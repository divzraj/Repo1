node {
    checkout scm

    docker.withRegistry('https://hub.docker.com/', 'dockerid') {

        def customImage = docker.build("divya123raj/jenk")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
