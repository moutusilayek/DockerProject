
node {

    checkout scm
 
   
    agent {
    label 'docker' 
  }

    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {

        def customImage = docker.build("moutusilayek/mouimage")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
