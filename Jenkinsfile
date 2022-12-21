pipeline {
    agent {
        node {
            label 'jenkinsnode1'  //this is the name of label name in node which is given as jenkinsnode1 
        }
    }

    tools {
        // Maven is declared as m2 in global tool configuration. envi variable
        maven "m2"
    }

    stages {
        stage('Pull code from Git') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/divzraj/Repo1.git'
            }
        }
        stage('Build using Maven'){
            steps {
                // Run Maven on a jenkinsnode1 agent.
                sh "mvn clean verify"

            }
    }
}
}
