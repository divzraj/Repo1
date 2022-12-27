node {
    checkout scm

    docker.withRegistry('https://hub.docker.com/repositories/', 'docker cred') {

        def customImage = docker.build("divya123raj/jenk")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
