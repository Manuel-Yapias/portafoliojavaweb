# Paso 1: Compilar la aplicación con Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Paso 2: Correr la aplicación en Tomcat
FROM tomcat:10.1-jdk17-temurin
WORKDIR /usr/local/tomcat

# Borramos las apps por defecto de Tomcat para evitar conflictos
RUN rm -rf webapps/*

# 1. Copiamos tu archivo WAR compilado directamente como ROOT.war para que use la raíz
COPY --from=build /app/target/*.war webapps/ROOT.war

# 2. TRUCO CLAVE: Copiamos los archivos .jar de las dependencias (como PostgreSQL) a la carpeta lib de Tomcat
COPY --from=build /app/target/dependency/*.jar lib/ 2>/dev/null || true

EXPOSE 8080
CMD ["catalina.sh", "run"]
