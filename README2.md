# About

Sample project for jumpstarting liquibase-based versioning of schemas. **Replace with info concerning YOUR schema**.

## Build

Standard maven commands, eg: `mvn clean install`

## Run
First, make sure the ABD props referenced in `src/main/resources/environment.properties` exist. Alternatively, define them locally in your marker file.

Run the generated jar file, passing the liquibase commands you want to run as arguments. Eg:

    java -jar target/liquibase-template-schema-1.0.0-SNAPSHOT.jar update

## Tips

You can run a local docker instance to test out changes faster and privately by firing it up with something like:

    docker run --name liquibase-template-postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres

## Loading test data

You can also create changelogs to load up test data, and then put it in the schema with something like:

    mvn liquibase:update -Dliquibase.url=jdbc:postgresql://localhost:5432/postgres -Dliquibase.username=postgres -Dliquibase.password=postgres -Dliquibase.verbose=true
