pipeline {
    agent any
  
    
    environment {
        AWS_ACCESS_KEY_ID = credentials ('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
        
    }
    stages {
        stage ("Download codebase config") {
            steps {
                echo "This is stage one, we download terraform codebase"
                sh 'git clone https://github.com/olluseun1/codebase.git'
            }
        }
        stage ("Download env config") {
            steps {
                echo "This is stage two, we download  env config"
                sh 'git clone https://github.com/olluseun1/Env.git'
                sh 'ls -ltr'
            } 
        }
        stage ("terraform plan") {
            steps {
                echo "This is stage three, initialise and possibly apply terraform"
                sh '''
                cd codebase
                terraform init -backend-config=../Env/dev/backend.tfvars
                terraform plan -var-file ../Env/dev/backend.tfvars -var-file ../Env/dev/dev.tfvars 
                '''
                script {
                    env.NEXT_STEP = input message: 'implement plan?', ok: 'implement',
                    parameters: [choice (name: 'implement', choices: 'apply\ndestroy\ndo nothing', description: 'implementation stage')]
                }
            }      
        }
        stage ("implement apply") {
            when {
                expression {
                    env.NEXT_STEP == 'apply'
                }
            }
        
        
            steps {
                echo "This is stage three, initialise and possibly apply terraform"
                sh '''
                cd codebase
                terraform init -backend-config=../Env/dev/backend.tfvars
                terraform apply -var-file ../Env/dev/backend.tfvars -var-file ../Env/dev/dev.tfvars -auto-approve
                '''
            }      
        }
        stage ("implement destroy") {
            when {
                expression {
                    env.NEXT_STEP == 'apply'
                }
            }
        
        
            steps {
                echo "This is stage three, initialise and possibly apply terraform"
                sh '''
                cd codebase
                terraform init -backend-config=../Env/dev/backend.tfvars
                terraform destroy -var-file ../Env/dev/backend.tfvars -var-file ../Env/dev/dev.tfvars -auto-approve
                '''
            }      
        }
    }
        
    post {
        always {
            echo 'This will always run, no matter what'
            deleteDir()
        }
        success{
            echo 'This will only run if build succeeds'
        }
        failure {
            echo 'This will always run if build fails'
        }
    
    }
}