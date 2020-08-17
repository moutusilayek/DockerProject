
node {

    checkout scm
    export PATH=/usr/local/bin:$PATH

    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {

        def customImage = docker.build("moutusilayek/mouimage")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
