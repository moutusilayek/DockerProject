
pipeline {
    agent any
    
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
        
        
        
        
         stage("Build Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            def customImage = docker.build("moutusilayek/mouimage")
                           customImage.push()
                    }
                }
            }
        } 
        
        
        
        stage('Deploy Application on K8s') {
              steps
              {
                sh("curl -LO https://storage.googleapis.com/kubernetes-release/release/\$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl")
                sh("chmod +x ./kubectl")
                sh("cat ./deployment.yaml | sed s/1.0.0/${BUILD_NUMBER}/g | ./kubectl apply -f -")
                echo "Application started on port: HTTP_PORT (http)"
                  
              }
        }
        
        
               }

    
    

    
}
