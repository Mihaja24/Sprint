#!/bin/bash

TOMCAT_HOME="/opt/tomcat"
APP_NAME="sprint06-test"
SRC_DIR="src"
CLASSES_DIR="WEB-INF/classes"
LIB_DIR="WEB-INF/lib"

echo ">> Nettoyage..."
rm -rf $CLASSES_DIR
mkdir -p $CLASSES_DIR

echo ">> Compilation..."
javac -cp "$LIB_DIR/framework.jar:$LIB_DIR/servlet-api.jar:$LIB_DIR/jackson-databind-2.20.0.jar" \
      -d $CLASSES_DIR \
      $(find $SRC_DIR -name "*.java")

if [ $? -ne 0 ]; then
    echo "ERREUR : compilation echouee"
    exit 1
fi

echo ">> Deploiement..."
cp -r . $TOMCAT_HOME/webapps/$APP_NAME

echo ""
echo "OK — Routes disponibles :"
echo "  http://localhost:8082/$APP_NAME/dept/list      → JSP"
echo "  http://localhost:8082/$APP_NAME/dept/new       → JSP + ModelAndView"
echo "  http://localhost:8082/$APP_NAME/dept/api/list  → JSON"
