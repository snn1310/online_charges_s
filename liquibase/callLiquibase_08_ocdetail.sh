bash $JENKINS_HOME/liquibase/liquibase  --loglevel=debug --changeLogFile=src/main/resources/release/2021/R01/changelog_08_ocdetail.xml --username=${MasterUserName} --password=${MasterUserPassword} --url=jdbc:postgresql://${TargetDbEndpoint}:5432/${DbName} update
