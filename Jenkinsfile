pipeline {
    agent any
    environment{
    DOCKERHUB_CREDENTIALS = credentials('dockerjencred') // dockerjencred is id which i gave while adding docker hub credentials
    }

    tools {
        // Maven is declared as m2 in global tool configuration. envi variable
        maven "m2"
    }

    stages {
        

        stage('get code') {
            agent{
                label 'mavennode'
            }
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/divzraj/Repo1.git'
            }
        }

        stage('maven build') {
            agent{
                label 'mavennode'
            }
            steps {
                // Get some code from a GitHub repository
                sh 'mvn clean compile'
            }
        }
        stage('docker build'){
            agent{
                label 'dockerhost'
            }
   
            steps{
                sh 'docker build -t divya123raj/jenk:$BUILD_NUMBER .' // dockerhubusername:imagename:jenkinsbuildnumber nad dockerfile in current directory
            }
        }
        stage ('login to docker'){
            agent{
                label 'dockerhost'
            }
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin' 
                // first we echo pass and then login with username and output of first command and login
            }
        }
        stage ('push to repo dockerhub'){
            agent{
                label 'dockerhost'
            }
            steps{
                sh 'docker push divya123raj/jenk:$BUILD_NUMBER'
            }
        }
    }
    
    post{
        always{
            sh 'docker logout'
        }
    }
}
