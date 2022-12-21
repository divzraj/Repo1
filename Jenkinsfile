pipeline {
    agent {
        node {
            label 'jenkinsnode1'
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
                // Run Maven on a Unix agent.
                sh "mvn clean verify"

            }
    }
}
}
