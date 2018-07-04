variable "name" {
	description = "Name of the Virtual Machine"
}

variable "datacenter" {
	description = "Target vSphere datacenter for Virtual Machine creation"
}

variable "vcpu" {
	description = "Number of Virtual CPU for the Virtual Machine"
	default = 2
}

variable "memory" {
	description = "Memory for Virtual Machine in MBs"
	default = 4096
}

variable "cluster" {
	description = "Target vSphere Cluster to host the Virtual Machine"
}

variable "storage" {
	description = "Data store or storage cluster name for target VMs disks"
}

variable "vm_template" {
	description = "Source VM or Template label for cloning"
}

variable "allow_selfsigned_cert" {
    description = "Communication with vsphere server with self signed certificate"
    default = true
}

variable "vm_1_resource_pool" {
  type = "string"
  description = "Resource pool."
}

variable "network1_network_name" {
  type = "string"
  description = "Generated"
}
