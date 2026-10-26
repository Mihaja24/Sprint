#!/bin/bash

export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

TOMCAT_HOME="/opt/tomcat"
APP_NAME="sprint06-test"
SRC_DIR="src"
CLASSES_DIR="WEB-INF/classes"
LIB_DIR="WEB-INF/lib"

FRAMEWORK_JAR="../../Framework/framework.jar"
if [ -f "$FRAMEWORK_JAR" ]; then
    cp -f "$FRAMEWORK_JAR" "$LIB_DIR/framework.jar"
fi

echo ">> Nettoyage..."
rm -rf $CLASSES_DIR
mkdir -p $CLASSES_DIR

FRAMEWORK_JAR="../../Framework/framework.jar"
if [ -f "$FRAMEWORK_JAR" ]; then
    cp -f "$FRAMEWORK_JAR" "$LIB_DIR/framework.jar"
fi

echo ">> Compilation..."
javac -cp "$LIB_DIR/framework.jar:$LIB_DIR/servlet-api.jar:$LIB_DIR/jackson-databind-2.20.0.jar" \
      -parameters \
      -d $CLASSES_DIR \
      $(find $SRC_DIR -name "*.java")

if [ $? -ne 0 ]; then
    echo "ERREUR : compilation echouee"
    exit 1
fi

echo ">> Deploiement..."
cp -r . $TOMCAT_HOME/webapps/$APP_NAME

