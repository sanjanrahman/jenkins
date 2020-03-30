pipeline{
  agent any
  environment {
    PATH = "${PATH}:${getTerraformPath()}"
  }
  stages{
   stage('terraform init plan and apply -dev'){
    steps{
     // command will create a new workspace called dev and run terraform on dev workspace
     // Here return status is true. If the command succed or fail the oveall job in jenkins will not be impacted
     // If we wnat to make decesion programatically later we can add functions like def status = sh returnStatus: true/false....
     sh returnStatus: true, script: 'terraform workspace new dev'
     sh "terraform init"
     sh "terraform plan"
     sh "terraform apply -var-file=dev.tfvars -auto-approve"     
    } 
   }
   stage('terraform init plan and apply -prod'){
    steps{
     // command will create a new workspace called dev and run terraform on prod workspace
     // Here return status is true. If the command succed or fail the oveall job in jenkins will not be impacted
     // If we wnat to make decesion programatically later we can add functions like def status = sh returnStatus: true/false....
     sh returnStatus: true, script: 'terraform workspace new prod'
     sh "terraform init"
     sh "terraform plan"
     sh "terraform plan -var-file=prod.tfvars -auto-approve"
    }
   }
   
  }
}

// Calling terraform installation path through a function location where terraform is installed tfhome
def getTerraformPath(){
  def tfHome = tool name: 'terraform-12', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
  return tfHome
}
