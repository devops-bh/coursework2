node {
    stage("Build") {
        def image = docker.build 'devopsbh/nodeapp'
        image.inside {
            sh "node --version"   
        }
        image.run("docker container run --detach --publish 8081:8080 --name nodeapp") 
    } 
    stage("Test") {
        sh 'curl http://localhost:8081'
        echo 'curl http://localhost:8081'        
    }
    stage("Deploy") {
      def image = docker.build 'devopsbh/nodeapp'
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            image.push 'latest'
        }
       sh 'ansible-playbook -i inventory ansible-kube-release.yml --tags update'
    }
    stage("Confirm Deplyment") {
        sshagent(['jssh']) {
            sh 'ssh ubuntu@prod_ip echo $(curl $(minikube service node-port-service --url))'
        }
    }
    stage("Cleanup") {
        sh 'done :)'
    } 
}

