provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "sanjan-tf-2020"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}
