variable "project_id" {
	description = "My-Project"
	default = "project_name"
}

variable "pods-subnet" {
	description = "Secondary IP Range to use for Pods"
	default = "ip-range-pods"
}	

variable "services-subnet" {
	description = "Secondary IP Range to use for Services"
	default = "ip-range-services-1"
}
variable "regional" {
	description = "If it is a regional clsuter"
	default = true
}

variable "master_authorized_networks" {
	type = list (object({cidr_block=string,display_name=string}))
	description = "Outside Access"
	default = [
		{
		cidr_block = 1.2.3.4/32" //This is just an example
		display_name = "Temp-To-Be-Removed" //This is an example name
		}
	]
}

variable "values" {
	description = "Extra Values"
	type = list(string)
	default = []
}

variable set {
	description = "Custom values to be merged alongwith the default values"
	type = list (object ({
		name = string
		value = string	
	}))
	default = null
}

variable set_sensitive {
	description = "Sensitive Values to be merged with default values, will be stored securely"
	type = list (object({
		name = string
		value = string
	}))
	default = null
}
