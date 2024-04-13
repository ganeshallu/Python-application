pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from Git repository
                git branch: 'main', url: 'https://github.com/ganeshallu/Python-application.git'
            }
        }

        stage('Build') {
            steps {
                // Build your Docker image
                script {
                    docker.build('calculator-app')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the Docker container, mapping port 8085
                script {
                    docker.image('calculator-app').run('-p 8085:8085 --name calculator-container')
                }
            }
        }
    }
}
