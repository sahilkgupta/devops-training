output "vpc_id" {
  value = aws_vpc.main.id
}
/* 
output "public_subnets" {
  value = values(aws_subnet.public)[*].id
}

*/
output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public : subnet.id]
}

 
output "private_subnets" {
  value = values(aws_subnet.private)[*].id
}
 
output "web_security_group" {
  value = aws_security_group.web.id
}
 
output "db_security_group" {
  value = aws_security_group.db.id
}
 
output "db_subnet_group" {
  value = aws_db_subnet_group.main.id
}