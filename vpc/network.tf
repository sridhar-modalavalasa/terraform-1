// created an internet connection and attached to our vpc

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.primary_vpc.id
      tags = {
      name = "Internet Gateway"
    }
}

// creating public route table and private route table

resource "aws_route_table" "public_rt" {
    vpc_id         = aws_vpc.primary_vpc.id
    route  {
       cidr_block = local.anywhere
       gateway_id = aws_internet_gateway.igw.id
      } 
   

    tags = {
      name = "Public-routetable"
    }
  
}


resource "aws_route_table" "private_rt" {
    vpc_id         = aws_vpc.primary_vpc.id
    tags = {
      name = "Private-routetable"
    }
  
}


// Associating the subnets with the route tables

resource "aws_route_table_association" "route1_sub1" {
    subnet_id = aws_subnet.subnet[0].id
    route_table_id = aws_route_table.public_rt.id
  }

resource "aws_route_table_association" "route2_sub2" {
    subnet_id = aws_subnet.subnet[1].id
    route_table_id = aws_route_table.public_rt.id
  }  
resource "aws_route_table_association" "route3_sub3" {
    subnet_id = aws_subnet.subnet[2].id
    route_table_id = aws_route_table.private_rt.id
  }

resource "aws_route_table_association" "route4_sub4" {
    subnet_id = aws_subnet.subnet[3].id
    route_table_id = aws_route_table.private_rt.id
  }  

resource "aws_route_table_association" "route5_sub1" {
    subnet_id = aws_subnet.subnet[4].id
    route_table_id = aws_route_table.public_rt.id
  }

resource "aws_route_table_association" "route6_sub2" {
    subnet_id = aws_subnet.subnet[5].id
    route_table_id = aws_route_table.public_rt.id
  }    



