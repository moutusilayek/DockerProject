
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
        
        
               }

    
    

    
}
