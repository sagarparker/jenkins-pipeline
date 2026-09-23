pipeline {
    agent {
        docker {
            image 'python:3.14.7-alpine3.24'
        }
    }
    stages {
        stage('Test') {
            steps {
                sh 'python --version'
            }
        }
    }
}