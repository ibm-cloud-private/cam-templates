#####################################################################
##
##      Created 6/5/18 by ucdpadmin. for vmware-singlevm
##
#####################################################################

variable "user" {
  type = "string"
  description = "Generated"
}

variable "password" {
  type = "string"
  description = "Generated"
}

variable "vsphere_server" {
  type = "string"
  description = "Generated"
}

variable "allow_unverified_ssl" {
  type = "string"
  description = "Generated"
}

variable "vm1_name" {
  type = "string"
  description = "Virtual machine name for vm1"
}

variable "vm1_number_of_vcpu" {
  type = "string"
  description = "Number of virtual cpu's."
}

variable "vm1_memory" {
  type = "string"
  description = "Memory allocation."
}

variable "vm1_disk_name" {
  type = "string"
  description = "The name of the disk. Forces a new disk if changed. This should only be a longer path if attaching an external disk."
}

variable "vm1_disk_size" {
  type = "string"
  description = "The size of the disk, in GiB."
}

variable "vm1_template_name" {
  type = "string"
  description = "Generated"
}

variable "vm1_datacenter_name" {
  type = "string"
  description = "Generated"
}

variable "vm1_datastore_name" {
  type = "string"
  description = "Generated"
}

variable "vm1_resource_pool" {
  type = "string"
  description = "Resource pool."
}

variable "net1_network_name" {
  type = "string"
  description = "Generated"
}

variable "disk1_disk_label" {
  type = "string"
  description = "Generated"
}

variable "disk1_unit_number" {
  type = "string"
  description = "The disk number on the SCSI bus. The maximum value for this setting is the value of scsi_controller_count times 15, minus 1 (so 14, 29, 44, and 59, for 1-4 controllers respectively). The default is 0, for which one disk must be set to. Duplicate unit numbers are not allowed."
}

variable "data1_size" {
  type = "string"
  description = "Generated"
}

variable "data1_vmdk_path" {
  type = "string"
  description = "Generated"
}

variable "data1_datacenter_name" {
  type = "string"
  description = "The name of the datacenter in which to create the disk. Can be omitted when when ESXi or if there is only one datacenter in your infrastructure."
}

variable "data1_datastore_name" {
  type = "string"
  description = "The name of the datastore in which to create the disk."
}

variable "data1_disk_type" {
  type = "string"
  description = "The type of disk to create. Can be one of eagerZeroedThick, lazy, or thin. Default: eagerZeroedThick."
  default = "thin"
}

variable "data1_disk_label" {
  type = "string"
  description = "Generated"
}

variable "data1_unit_number" {
  type = "string"
  description = "The disk number on the SCSI bus. The maximum value for this setting is the value of scsi_controller_count times 15, minus 1 (so 14, 29, 44, and 59, for 1-4 controllers respectively). The default is 0, for which one disk must be set to. Duplicate unit numbers are not allowed."
}

