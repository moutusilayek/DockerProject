
pipeline {
    agent any
    
     environment {
        registry = "http://20.56.195.100:8081/mou-nexus"
        MY_NEXUS = credentials('nexus')
    }
    
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
        
        
        
        try{
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
        } catch(e){
              def project = jiraGetProject idOrKey: 'JIR', site: 'mou-jira-site'
            echo project.data.toString()
            def testIssue1 = [fields: [ project: [id: '10000'],
                                        summary: 'New Bug Created from Jenkins.',
                                        description: 'Docker Login has problem',
                                        issuetype: [name: 'Bug']]]
            def testIssues = [issueUpdates: [testIssue1]]
            response = jiraNewIssues issues: testIssues, site: 'mou-jira-site'
            echo response.successful.toString()
            echo response.data.toString()
            
            
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
