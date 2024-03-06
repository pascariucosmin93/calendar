pipeline {
    agent any
    
    environment {
        registry = "registry.cosmin-lab.cloud:5000"
        dockerImage = "calendar"
        dockerCredentials = 'docker-registry' // ID-ul de acreditare pentru Docker
        kubeconfigId = 'KUBECONFIG' // ID-ul kubeconfig

    }
    
    stages {
        stage('Checkout Source') {
            steps {
                git branch: 'main', url: 'https://github.com/pascariucosmin93/calendar.git'
            }
        }
        
        stage('Build Image') {
            steps {
                script {
                    // Construiește imaginea Docker folosind versiunea dinamică
                    dockerImage = docker.build("${registry}/${dockerImage}:latest")
                }
            }
        }
        
        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('https://' + registry, dockerCredentials) {
                        // Pune imaginea în registrul Docker
                        dockerImage.push()
                    }
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Definiți comanda kubectl pentru a implementa resursele Kubernetes din fișierul calendar.yaml
                    def deployCommand = "kubectl apply -f calendar.yaml"
                    
                    // Executați comanda utilizând sh
                    sh deployCommand
                }
            }
        }
    }
}
