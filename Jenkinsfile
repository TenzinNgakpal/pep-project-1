pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        AWS_ACCOUNT_ID = '727646489281'  // 🔁 Replace with your actual AWS account ID
        REPO_NAME = 'flask-app'
        IMAGE_TAG = 'latest'
        ECR_REGISTRY = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Push to ECR') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-ecs-creds']]) {
                        sh '''
                            aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REGISTRY
                            docker build -t $REPO_NAME .
                            docker tag $REPO_NAME:$IMAGE_TAG $ECR_REGISTRY/$REPO_NAME:$IMAGE_TAG
                            docker push $ECR_REGISTRY/$REPO_NAME:$IMAGE_TAG
                        '''
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Image pushed to ECR successfully."
        }
        failure {
            echo "❌ Build or push failed."
        }
    }
}