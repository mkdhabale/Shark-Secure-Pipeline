

data "aws_secretsmanager_secret" "aws-keys" {
 name = "aws-keys"
}

data "aws_secretsmanager_secret_version" "secret_credentials" {
 secret_id = data.aws_secretsmanager_secret.aws-keys.id
}
provider "aws" { 
  access_key = jsondecode(data.aws_secretsmanager_secret_version.secret_credentials.secret_string)["access_key"]
  secret_key = jsondecode(data.aws_secretsmanager_secret_version.secret_credentials.secret_string)["secret_key"]
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
