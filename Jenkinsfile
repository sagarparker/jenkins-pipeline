pipeline {
    agent {
        docker {
            image 'python:3.14.7-alpine3.24'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'pip install -r requirements.txt'
                sh 'mkdir -p dist'
                sh 'echo "Jenkins Python Pipeline Demo" > dist/app.txt'
            }
        }
        stage('Test') {
            steps {
                sh 'pytest --junitxml=test-results.xml'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'dist/*.txt', fingerprint: true
            junit 'test-results.xml'
        }
    }
}