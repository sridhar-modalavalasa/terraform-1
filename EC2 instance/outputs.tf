output "vpc_id" {
    value = aws_vpc.primary_vpc.id
  }

output "web_subnet1_id" {
    value = aws_subnet.subnet[0].id
}  
output "web_subnet2_id" {
    value = aws_subnet.subnet[1].id
} 
output "db_subnet3_id" {
    value = aws_subnet.subnet[2].id
} 
output "db_subnet4_id" {
    value = aws_subnet.subnet[3].id
}  
output "app_subnet5_id" {
    value = aws_subnet.subnet[4].id
} 
output "app_subnet6_id" {
    value = aws_subnet.subnet[5].id
} 

output "web_security_id" {
    value = aws_security_group.web_sg.id
  
}

output "db_security_id" {
    value = aws_security_group.db_sg.id
  
}

output "ssh_login_for_firstec2" {

    value = format("ssh -i %s.pem ec2-user@%s","kubernetes",aws_instance.amazonlinux[0].public_ip)
  
}




