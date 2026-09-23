pipeline {
    agent {
        docker {
            image 'python:3.14.7-alpine3.24'
        }
    }
    stages {
        stage('Test') {
            steps {
                sh 'echo "Running tests..."'
                sh '.venv/bin/pytest'
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished'
        }
        success {
            echo 'Tests passed successfully!'
        }
        failure {
            echo 'Tests failed!'
        }
        changed {
            echo 'Build status changed!'
        }
    }
}