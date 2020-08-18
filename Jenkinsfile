
pipeline {
    agent any
    
    stages {
        stage ("check out code") {
            
            checkout scm
        }
        
        stage ("build image"){
           docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {

           def customImage = docker.build("moutusilayek/mouimage")

           /* Push the container to the custom Registry */
          customImage.push()
        } 
        }
        
        
               }

    
    

    
}
