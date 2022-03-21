//Cloud Router & Cloud NAT
module "cloud_router" {
	source = "terraform-google-modules/cloud-router/google"
	version = "~> 0.4"
	project = "project_name"
	name = "sonarqube-cloud-router"
	network = "sonarqube-network-2"
	region = "us-central1"
	
	nats = [{
		name = "sonarqube-nat-gateway"
	}]
}
