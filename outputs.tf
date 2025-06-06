output "web_server_ips" {
  value = module.ec2.instance_ips
}
 
output "rds_endpoint" {
  value = module.rds.rds_endpoint
}