#!/bin/sh

INTELLIJ_HOME=$1

if [ -z "$INTELLIJ_HOME" ]
then
  echo "Please provide the path to Intellij home directory. For example: ./install-intellij-libs.sh /Applications/IntelliJ\ IDEA.app"
  exit 1
fi

if [ ! -d "$INTELLIJ_HOME" ]
then
  echo "Directory does not exist: $INTELLIJ_HOME"
  exit 1
fi

echo 'Installing Intellij artifacts to Maven local repository'
echo "Intellij home: $INTELLIJ_HOME"

mvn install:install-file -Dfile="$INTELLIJ_HOME/Contents/plugins/java/lib/javac2.jar" -DgroupId=com.intellij -DartifactId=javac2 -Dversion=2022.1.2 -Dpackaging=jar
mvn install:install-file -Dfile="$INTELLIJ_HOME/Contents/lib/3rd-party-rt.jar" -DgroupId=com.intellij -DartifactId=3rd-party-rt -Dversion=2022.1.2 -Dpackaging=jar
mvn install:install-file -Dfile="$INTELLIJ_HOME/Contents/lib/forms_rt.jar" -DgroupId=com.intellij -DartifactId=forms_rt -Dversion=2022.1.2 -Dpackaging=jar
mvn install:install-file -Dfile="$INTELLIJ_HOME/Contents/lib/annotations.jar" -DgroupId=com.intellij -DartifactId=annotations -Dversion=2022.1.2 -Dpackaging=jar
