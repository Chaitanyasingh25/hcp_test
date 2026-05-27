# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-0b87ca41541fc16a3"
resource "aws_security_group" "sg" {
  description = "Allow SSH"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "SSH"
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
  }]
  name                   = "chaitanya-sg"
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-08583033ea0a82af5"
}

# __generated__ by Terraform
resource "aws_subnet" "main_subnet" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "ap-northeast-1a"
  availability_zone_id                           = "apne1-az4"
  cidr_block                                     = "10.0.1.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch                        = true
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    Name = "chaitanya-subnet"
  }
  tags_all = {
    Name = "chaitanya-subnet"
  }
  vpc_id = "vpc-08583033ea0a82af5"
}

# __generated__ by Terraform
resource "aws_vpc" "main_vpc" {
  assign_generated_ipv6_cidr_block     = false
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = false
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  ipv4_ipam_pool_id                    = null
  ipv4_netmask_length                  = null
  ipv6_ipam_pool_id                    = null
  ipv6_netmask_length                  = 0
  tags = {
    Name = "chaitanya-vpc"
  }
  tags_all = {
    Name = "chaitanya-vpc"
  }
}

# __generated__ by Terraform
resource "aws_instance" "ec2" {
  ami                                  = "ami-0d52744d6551d851e"
  associate_public_ip_address          = true
  availability_zone                    = "ap-northeast-1a"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = false
  get_password_data                    = false
  hibernation                          = false
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.micro"
  ipv6_address_count                   = 0
  ipv6_addresses                       = []
  monitoring                           = false
  placement_partition_number           = 0
  private_ip                           = "10.0.1.205"
  secondary_private_ips                = []
  security_groups                      = []
  source_dest_check                    = true
  subnet_id                            = "subnet-02437a091bd9a6e2b"
  tags = {
    Name = "chaitanya-ec2"
  }
  tags_all = {
    Name = "chaitanya-ec2"
  }
  tenancy                     = "default"
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-0b87ca41541fc16a3"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    core_count       = 1
    threads_per_core = 2
  }
  credit_specification {
    cpu_credits = "unlimited"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 100
    tags                  = {}
    tags_all              = {}
    throughput            = 0
    volume_size           = 8
    volume_type           = "gp2"
  }
}
