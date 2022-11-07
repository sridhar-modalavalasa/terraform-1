// creation of aws vpc 

resource "aws_vpc" "primary_vpc" {
    cidr_block = var.vpc_cidr
    tags       = {
        Name   = var.vpc_tag
    }
  
  }

// addition of subnets for vpc

resource "aws_subnet" "subnet" {
    count             = length(var.subnet_cidr)
    vpc_id            = aws_vpc.primary_vpc.id
    cidr_block        = var.subnet_cidr[count.index]
    availability_zone = var.subnet_azs[count.index]
    tags              = {
        Name          = var.subnet_tag[count.index]
    }
    
  }

// create a security group for the ec2 instance

resource "aws_security_group" "web_sg" {
  vpc_id         = aws_vpc.primary_vpc.id
  name           = var.websg
  description    = "allows all ssh, https and http requests from anyip using TCP"


  ingress {
    description      = "allowing ssh"
    from_port        = local.ssh
    to_port          = local.ssh
    protocol         = local.TCP
    cidr_blocks      = [local.anywhere]
    
  }
  
  ingress {
    description      = "allowing http"
    from_port        = local.http
    to_port          = local.http
    protocol         = local.TCP
    cidr_blocks      = [local.anywhere]
    
  }

  ingress {
    description      = "allowing https"
    from_port        = local.https
    to_port          = local.https
    protocol         = local.TCP
    cidr_blocks      = [local.anywhere]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [local.anywhere]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags   = {
    name = "websg"
  }

}

// creating a security group for the RDS database
resource "aws_security_group" "db_sg" {
  vpc_id         = aws_vpc.primary_vpc.id
  name           = var.dbsg
  description    = "exposes its working port depending upon the database used"


   ingress {
    from_port        = local.dbworkport
    to_port          = local.dbworkport
    protocol         = local.TCP
    cidr_blocks      = [var.vpc_cidr]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [local.anywhere]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags   = {
    name = "dbsg"
  }

}








