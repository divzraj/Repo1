pipeline {
environment{
    reg = "https://hub.docker.com/u/divya123raj"
    regcred = 'docker cred'
    dockerImage = ''
}
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
                sh "mvn clean install"

            }
    }
        stage('Deploy to Tomcat'){
            steps{
                deploy adapters: [tomcat9(credentialsId: 'tomcatcred', path: '', url: 'http://15.206.92.28:8080/')], contextPath: null, war: 'target/*.war'
            }
        }
        stage('Docker image create with Dockerfile in github'){
            steps{
            script {
                dockerImage = docker.build reg + ':$BUILD_NUMBER'

                }
            }
        }

        stage('deploy to dockerhub'){
            steps{
            script{
            docker.withRegistry('', regcred ){
            dockerImage.push()
            }
            }
            }

            stage ('clean up'){
            steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
            }        }
        }
                
}
}
