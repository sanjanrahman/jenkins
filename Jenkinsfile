pipeline{
  agent any
  environment {
    PATH = "${PATH}:${getTerraformPath()}"
  }
  stages{
   stage('terraform init'){
    steps{
     sh "terraform init"
    } 
   }
  }
}

// Calling terraform installation path through a function location where terraform is installed tfhome
def getTerraformPath(){
  def tfHome = tool name: 'terraform-12', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
  return tfHome
}
