##################### Variables ###############################

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

variable "network_label" {
	description = "vSphere Port Group or Network label for Virtual Machine's vNIC" 
}

variable "ipv4_address" {
	description = "IPv4 address for vNIC configuration"
}

variable "ipv4_gateway" {
	description = "IPv4 gateway for vNIC configuration"
}

variable "ipv4_prefix_length" {
	description = "IPv4 Prefix length for vNIC configuration"
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

############### Optinal settings in provider ##########
provider "vsphere" {
    version = "~> 1.0"
    allow_unverified_ssl = "${var.allow_selfsigned_cert}"  # Communication with vsphere server with self signed certificate
}
 
data "vsphere_datacenter" "datacenter" {
  name = "${var.datacenter}"
}

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
  network_interface {
      label = "${var.network_label}"
      ipv4_gateway = "${var.ipv4_gateway}"
      ipv4_address = "${var.ipv4_address}"
      ipv4_prefix_length = "${var.ipv4_prefix_length}"
  }
  disk {
    datastore = "${var.storage}"
    template = "${var.vm_template}"
  }
}

output "ipv4_address" {
  value = "${vsphere_virtual_machine.vm_1.network_interface.0.ipv4_address}"
}
