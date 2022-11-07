resource "aws_instance" "amazonlinux" {
    count                       = 1
    ami                         = var.ec2_ami
    instance_type               = var.ec2_size
    subnet_id                   = aws_subnet.subnet[0].id
    associate_public_ip_address = true
    key_name                    ="kubernetes"
    vpc_security_group_ids      = [aws_security_group.web_sg.id]
    tags = {
      name = "myec2"
      env  = "development"
    }
  
}


variable "ec2_ami" {
    default = "ami-0c2ab3b8efb09f272"
    description = "this is the ami id of ec2 instance"
  
}


variable "ec2_size" {
    default = "t2.micro"
    description = "this is the size of ec2 instance"
  
}

//created 3 ec2 instances irrespective of subnets so some might receive internet 
// and some won't receive internet so solve this we need to have nat attachment
// now we need to create a natgateway view the steps in networking part

