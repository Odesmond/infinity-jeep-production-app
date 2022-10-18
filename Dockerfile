@@ -1,2 +1,3 @@
FROM tomcat:8.0.20-jre8
### Good stuff
COPY target/*.war /usr/local/tomcat/webapps/maven-web-app.war
