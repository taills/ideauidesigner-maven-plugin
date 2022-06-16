Introduction
-----------


This was originally a git clone of https://github.com/gshakhn/ideauidesigner-maven-plugin that was itself a clone of https://svn.codehaus.org/mojo/trunk/mojo/ideauidesigner-maven-plugin.

I modified it to support IntelliJ 2022.1.2

All credit goes to original authors of the maven plugin and the install-intellij-libs.sh.

Usage
-----

Clone this repository

This plugin is dependent on IntelliJ's javac2.jar, asm-all.jar, and forms_rt.jar. You'll need to install them into your local maven repo by running:

    ./install-intellij-libs.sh <path to IntelliJ 2022.1.2>

You can then install the plugin locally by doing:

    mvn install

Add the following to your project pom.xml build -> plugins configuration

```xml
<plugin>
    <groupId>org.codehaus.mojo</groupId>
    <artifactId>ideauidesigner-maven-plugin</artifactId>
    <version>2022.1.2</version>
    <executions>
        <execution>
            <goals>
                <goal>javac2</goal>
            </goals>
        </execution>
    </executions>
    <configuration>
        <fork>true</fork>
        <debug>true</debug>
        <failOnError>true</failOnError>
    </configuration>
</plugin>
 ```