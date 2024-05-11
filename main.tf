provider "aws" { 
  TF_VAR_access_key = var.AWS_USR_ACCESS_KEY
  TF_VAR_secret_key = var.AWS_USR_SECRET_KEY
  region     = "us-east-1"
}

resource "aws_instance" "k8-M" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.medium"  
  key_name      = "LinuxKey_pem_new"
  tags = {
    Name = "KMASTER"
  }

  root_block_device {
    volume_size = 16  
  }
}

resource "aws_instance" "k8-S1" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  key_name      = "LinuxKey_pem_new"
  tags = {
    Name = "KSlave"
  }
}
