pipeline {
    agent {
        docker {
            image 'python:3.14.7-alpine3.24'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'echo "Hello World"'

                sh '''
                    echo "Multiline shell steps works too"
                    ls -lah
                '''

                sh 'python --version'
            }
        }
    }
}