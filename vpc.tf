//VPC and Subnet Creation
module "vpc" {
	source = "terraform-google-modules/network/google"
	version = "~>4.0"
	
	project_id = var.project_id
	network_name = "sonarqube-network-2"
	
	subnets = [
	{
		subnet_name = "sonarqube-subnet"
		subnet_ip = "10.77.0.0/16"
		subnet_region = "us-central1"
	},
	]
	secondary_ranges = {
		sonarqube-subnet
			{
				range_name = var.pods-subnet
				ip_cidr_range = "10.78.0.0/16"
			},
			{
				range_name = var.services-subnet
				ip_cidr_range = "10.79.0.0/16"
			}
		]
	}
}

