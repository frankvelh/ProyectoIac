##Provider##
provider "aws" {
  region = "us-east-2" #Region donde se despliega el recuerso
  #profile = "hotel-project" #Perfil de AWS
}
terraform {
  
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
    }
  }
}