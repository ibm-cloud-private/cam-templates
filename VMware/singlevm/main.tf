#####################################################################
##
##      Created 7/5/18 by ucdpadmin. for singlevm
##
#####################################################################

## REFERENCE {"net0":{"type": "vsphere_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "vsphere" {
  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  version = "~> 1.2"
}


data "vsphere_virtual_machine" "vm0_template" {
  name          = "${var.vm0_template_name}"
  datacenter_id = "${data.vsphere_datacenter.vm0_datacenter.id}"
}

data "vsphere_datacenter" "vm0_datacenter" {
  name = "${var.vm0_datacenter_name}"
}

data "vsphere_datacenter" "vm0_datacenter_name" {
  name = "${var.vm0_datacenter_name}"
}

data "vsphere_datastore" "vm0_datastore" {
  name          = "${var.vm0_datastore_name}"
  datacenter_id = "${data.vsphere_datacenter.vm0_datacenter.id}"
}

data "vsphere_network" "net0" {
  name          = "${var.net0_network_name}"
  datacenter_id = "${data.vsphere_datacenter.vm0_datacenter.id}"
}

data "vsphere_resource_pool" "cluster1_cluster" {
  name          = "${var.cluster1_cluster_name}"
  datacenter_id = "${data.vsphere_datacenter.vm0_datacenter_name.id}"
}

resource "vsphere_virtual_machine" "vm0" {
  name          = "${var.vm0_name}"
  datastore_id  = "${data.vsphere_datastore.vm0_datastore.id}"
  num_cpus      = "${var.vm0_number_of_vcpu}"
  memory        = "${var.vm0_memory}"
  guest_id = "${data.vsphere_virtual_machine.vm0_template.guest_id}"
  resource_pool_id = "${data.vsphere_resource_pool.cluster1_cluster.id}"
  network_interface {
    network_id = "${data.vsphere_network.net0.id}"
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.vm0_template.id}"
  }
}