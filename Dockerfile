# Paso 1: Compilar el WAR con Maven usando Java 17
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Paso 2: Usar Tomcat oficial y configurar las librerías manualmente
FROM tomcat:10.1-jdk17-temurin
WORKDIR /usr/local/tomcat

# Borramos contenido basura por defecto
RUN rm -rf webapps/*

# Copiamos el archivo WAR renombrándolo a ROOT.war
COPY --from=build /app/target/*.war webapps/ROOT.war

# Descargamos el Driver de PostgreSQL directamente a la carpeta lib de Tomcat para que nunca falte
ADD https://repo1.maven.org/maven2/org/postgresql/postgresql/42.7.2/postgresql-42.7.2.jar lib/

EXPOSE 8080
CMD ["catalina.sh", "run"]
