#####################################################################
##
##      Created 7/5/18 by ucdpadmin. for singlevm
##
#####################################################################

variable "vm0_name" {
  type = "string"
  description = "Virtual machine name for vm0"
}

variable "vm0_number_of_vcpu" {
  type = "string"
  description = "Number of virtual cpu's."
}

variable "vm0_memory" {
  type = "string"
  description = "Memory allocation."
}

variable "vm0_template_name" {
  type = "string"
  description = "Generated"
}

variable "vm0_datacenter_name" {
  type = "string"
  description = "Generated"
}

variable "vm0_datastore_name" {
  type = "string"
  description = "Generated"
}

variable "net0_network_name" {
  type = "string"
  description = "Generated"
}

variable "cluster1_cluster_name" {
  type = "string"
  description = "Cluster name"
}

variable "allow_unverified_ssl" {
  type = "string"
  description = "Generated"
  default = "TRUE"
}

