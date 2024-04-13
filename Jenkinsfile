pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                git url: 'https://github.com/ganeshallu/Python-application.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('calculator-app')
                }
            }
        }

        stage('Push Docker Image to Registry') {
            steps {
                script {
                    docker.withRegistry('https://471112615702.dkr.ecr.us-east-1.amazonaws.com', 'ecr:your-region') {
                        docker.image('calculator-app').push('latest')
                    }
                }
            }
        }

        stage('Deploy to EKS') {
            steps {
                script {
                    kubernetesDeploy(
                        kubeconfigId: 'kubeconfig',
                        configs: 'deployment.yaml',
                        enableConfigSubstitution: true
                    )
                }
            }
        }
    }
}
