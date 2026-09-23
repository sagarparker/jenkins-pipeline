pipeline {
    agent {
        docker {
            image 'python:3.14.7-alpine3.24'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh '''
                    python -m venv .venv
                    .venv/bin/pip install -r requirements.txt
                    mkdir -p dist
                    echo "Jenkins Python Pipeline Demo" > dist/app.txt
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                    .venv/bin/pytest --junitxml=test-results.xml
                '''
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