pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-key')  // Jenkins secret
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/RameshkumarBaskaran/Jenkins-Zero-To-Hero.git'
            }
        }

        stage('Setup Terraform') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Validate Terraform') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Plan Terraform') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Apply Terraform') {
            steps {
                input message: "Approve deployment?"
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
