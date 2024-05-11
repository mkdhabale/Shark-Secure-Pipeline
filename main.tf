provider "aws" { 
  access_key = "AKIAV6VEJQ2HIR37RXGI"
  secret_key = "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"
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
