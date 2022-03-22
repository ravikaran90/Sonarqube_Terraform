# Sonarqube_Terraform

In this project, VPCs, NAT (Cloud Router and Cloud NAT), Kubernetes Cluster creation has been done through terraform.

You can install an editor such as Visual Studio, then keep the terraform (tf) files in the same folder.

Initialize the terrafrom within the folder:
terrafrom init

Planning it
terrafrom plan -out="infra-plan"

Creation of Infrastructure
terraform apply infra-plan

After the Infrastructure creation, sonarqube is installed on the Kubernetes cluster and then an ingress is created and attached to sonarqube service.
