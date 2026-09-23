pipeline {
    agent {
        docker {
            image 'python:3.14.7-alpine3.24'
        }
    }
    options {
        skipStagesAfterUnstable()
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
                sh '.venv/bin/pytest --junitxml=test-results.xml'
            }
        }
        stage('Deploy - Staging') {
            steps {
                sh './deploy.sh staging'
                sh './run-smoke-tests.sh staging'
            }
        }
        stage('Sanity Check') {
            steps {
                input 'Does the staging environment look OK?'
            }
        }
        stage('Deploy - Production') {
            steps {
                sh './deploy.sh production'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'dist/*.txt', fingerprint: true
            junit 'test-results.xml'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}