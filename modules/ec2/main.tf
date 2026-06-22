# Thsi Automatically fatch the latest ubuntu 22.04 ami id 

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical's official AWS Account ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# Ec2 instance block

data "aws_key_pair" "existing_key" {
  key_name = var.key_name
}

resource "aws_instance" "web_server" {
  count         = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  key_name      = data.aws_key_pair.existing_key.key_name

  tags = {
    Name        = "${var.environment}-web-server-${count.index + 1}"
    Environment = var.environment
  }
}

