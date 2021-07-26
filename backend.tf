terraform {
  backend "s3" {
    bucket = "nti-test-remote-statee"
    key = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    
  }
}