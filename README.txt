-------------------------Change Password-------------------------
This is a utility for ChangePassword with automated tests.

This utility is written in java and setup as a Maven project.[Source Code & Resources in src/main]
Test cases are written in Cucumber[ChangePassword.feature file in src/test/resources]

Installation:

Install JDK 1.5 or above. Edit PATH environment variable and add path_to_JDK/bin. Add a new environment variable "JAVA_HOME" as path_to_JDK.
Install Maven 3 or above. Edit PATH environment variable and add path_to_Maven/bin. Run mvn -v on command prompt to check if Maven is installed succesfully.

Usage:

>>>>>>>To Run Test Cases
1. Open Command prompt and go to folder where pom.xml is present for the project.
2. Run mvn clean compile --> All the dependecies of project should be downloaded and code should be compiled
3. Run mvn test --> All the test scenarios present in "ChangePassword.feature" should be executed and Build should be successful if all the scenarios 
   have passed.
   For a specific scenario execution, please specify tag on scenario and use command as mvn test -Dcucumber.options="--tags @TAG_NAME"
4. To see the Report, go to target\cucumber-html-report in project folder and open index.html file.[Sample Report is present in same folder in this repo]

>>>>>>>To directly execute main() method
1. Open Command prompt and go to folder where pom.xml is present for the project.
2. Run java -cp ./target/classes passwordUtil.ChangePasswordUtility "OLD_PASSWORD" "NEW_PASSWORD"


System Information:

1. Set of last 2 passwords are maintained in MockPasswordRepo. Current password should be unique.
2. Dictionary checks are done against dictionary.txt file in src/main/resources. Some custom words are added in dictionary to test few scenarios, as no 
   actual word exists with allowed special characters.
