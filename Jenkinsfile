node {
def mavenHome = tool name : 'maven3.8.6'
stage('1cloneCode'){
git "https://github.com/Odesmond/infinity-jeep-production-app"
//sh  "git clonw https://github.com/Odesmond/infinity-jeep-production-app"

stage('2Test&Bluid'){sh "${mavenHome}/bin/mvn clean package"}

stage('3CodeQuality'){sh "${mavenHome}/bin/mvn sonar:sonar"}

stage('4UploadArtifacts') //{sh "${mavenHome}/bin/mvn deploy"}

}
stage('5deployUAT'){ 
    sh "echo 'deploy to UAT' "
    deploy adapters: [tomcat9(credentialsId: 'tomcat-credentials', path: '', url: 'http://18.134.150.107:8080/')], contextPath: null, war: 'target/*war'}
}    
stage('6approvalgate'){
   
    timeout(time:5, unit:'DAYS') {
    input message: 'Application ready for deployment, Please review and approve'
        
    }
    
stage('7deploy2production'){
    sh "sleep 50"
  deploy adapters: [tomcat9(credentialsId: 'tomcat-credentials', path: '', url: 'http://18.134.150.107:8080/')], contextPath: null, war: 'target/*war' 
} 


stage('8emailNotification'){
emailext body: '''Hi All
 Please check the bluild status''', recipientProviders: [buildUser(), developers(), contributor(), requestor()], subject: 'build status', to: 'tarixdream@gmail.com, '}
}

