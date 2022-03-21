//Kubeconfig entry for provider Kubernetes
provider "Kubernetes" {
	config_path = "~/.kube/config"
}

//Sonarqube Namespace Creation
resource "kubernetes_namespace" "ns" {
	metadata {
		name = "sonarqube"
	}
}

//Kubeconfig entry for provider Helm
provider "helm" {
	kubernetes {
	config_path = "~/.kube/config"
	}
}

//Sonarqube Helm Chart Installation
resource "helm_release" "sq_chart_values" {
	name = "sonarqube"
	namespace = "sonarqube"
	repository = "https://sonarqube.github.io/helm-chart-sonarqube"
	chart = "sonarqube"
	//values = "helm-chart-sonarqube/charts/sonarqube/values.yml"
	values = [templatefile{"values.yaml"",{})]
	dynamic "set" {
		iterator = item
		for_each = var.set == null ? [] : var.set
	
		content {
			name = item.value.name
			value = item.value.value
		}
	}
	dynamic "set_sensitive" {
		iterator = item
		for_each = var.set_sensitive ==null ? [] : var.set_sensitive
	}
	
	content {
		name = item.value.path
		value = item.value.value
	}
	}
}

