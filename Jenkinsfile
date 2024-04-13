pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/ganeshallu/Python-application.git'
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    docker.build('my-python-app')
                    docker.withRegistry('https://471112615702.dkr.ecr.us-east-1.amazonaws.com', 'ecr:your-region') {
                        docker.image('my-python-app').push('latest')
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
