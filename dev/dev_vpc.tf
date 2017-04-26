# template to create VPC with public and private subnets

# configure aws provider

provider "aws" {
}

# create VPC

resource "aws_vpc" "main" {
	cidr_block = "10.32.0.0/16"
	tags {
		Name = "dev"
	}
	enable_dns_hostnames = true
}

# create route 53 private zone

resource "aws_route53_zone" "dns" {
	name = "ptrkdy.internal"
	comment = "Terraform - private internal zone"
	vpc_id = "${aws_vpc.main.id}"
}
