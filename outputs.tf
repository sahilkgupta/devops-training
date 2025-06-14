output "web_server_ips" {
  value = module.ec2.instance_ips    //this will be useful for running the code
}
 
output "rds_endpoint" {
  value = module.rds.rds_endpoint       //Store database
}