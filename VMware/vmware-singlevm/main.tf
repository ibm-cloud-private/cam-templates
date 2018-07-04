##################### Variables ###############################

## REFERENCE {"vsphere_network":{"type": "vsphere_reference_network"}}

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

############### Optinal settings in provider ##########
provider "vsphere" {
    version = "~> 1.0"
    allow_unverified_ssl = "${var.allow_selfsigned_cert}"  # Communication with vsphere server with self signed certificate
}
 
#data "vsphere_datacenter" "datacenter" {
#  name = "${var.datacenter}"
#}

#data "vsphere_network" "network1" {
#  name          = "${var.network1_network_name}"
#  datacenter_id = "${data.vsphere_datacenter.vm_1_datacenter.id}"
#}

################## Resources ###############################

#
# Create VM with single vnic on a network label by cloning 
#
resource "vsphere_virtual_machine" "vm_1" {
  name   = "${var.name}"
  datacenter = "${var.datacenter}" 
  vcpu   = "${var.vcpu}"
  memory = "${var.memory}"
  cluster = "${var.cluster}"
  resource_pool_id = "${var.vm_1_resource_pool}"
  network_interface {
    network_id = "${data.vsphere_network.network1.id}"
  }
  disk {
    datastore = "${var.storage}"
    template = "${var.vm_template}"
  }
}

output "ipv4_address" {
  value = "${vsphere_virtual_machine.vm_1.network_interface.0.ipv4_address}"
}
