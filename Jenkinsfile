pipeline {
    agent any
    environment{
    DOCKERHUB_CREDENTIALS = credentials('dockerjencred')
    }

    stages {
        stage('get code') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/divzraj/Repo1.git'
            }
        }
        stage('build'){
            steps{
                sh 'docker build -t divya123raj/jenk:$BUILD_NUMBER .'
            }
        }
        stage ('login to docker'){
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage ('push to repo dockerhub'){
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
