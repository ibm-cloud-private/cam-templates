#####################################################################
##
##      Created 6/5/18 by ucdpadmin. for vmware-singlevm
##
#####################################################################

## REFERENCE {"net1":{"type": "vsphere_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "vsphere" {
  user           = "${var.user}"
  password       = "${var.password}"
  vsphere_server = "${var.vsphere_server}"

  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  version = "~> 1.2"
}


data "vsphere_virtual_machine" "vm1_template" {
  name          = "${var.vm1_template_name}"
  datacenter_id = "${data.vsphere_datacenter.vm1_datacenter.id}"
}

data "vsphere_datacenter" "vm1_datacenter" {
  name = "${var.vm1_datacenter_name}"
}

data "vsphere_datastore" "vm1_datastore" {
  name          = "${var.vm1_datastore_name}"
  datacenter_id = "${data.vsphere_datacenter.vm1_datacenter.id}"
}

data "vsphere_network" "net1" {
  name          = "${var.net1_network_name}"
  datacenter_id = "${data.vsphere_datacenter.vm1_datacenter.id}"
}

resource "vsphere_virtual_machine" "vm1" {
  name          = "${var.vm1_name}"
  datastore_id  = "${data.vsphere_datastore.vm1_datastore.id}"
  num_cpus      = "${var.vm1_number_of_vcpu}"
  memory        = "${var.vm1_memory}"
  guest_id = "${data.vsphere_virtual_machine.vm1_template.guest_id}"
  resource_pool_id = "${var.vm1_resource_pool}"
  network_interface {
    network_id = "${data.vsphere_network.net1.id}"
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.vm1_template.id}"
  }
  disk {
    name = "${var.vm1_disk_name}"
    size = "${var.vm1_disk_size}"
  }
  disk {
    attach = true
    label  = "${var.disk1_disk_label}"
    path   = "${vsphere_virtual_disk.data1.vmdk_path}"
    unit_number = "${var.disk1_unit_number}"
  }
  disk {
    attach = true
    label  = "${var.data1_disk_label}"
    path   = "${vsphere_virtual_disk.data1.vmdk_path}"
    unit_number = "${var.data1_unit_number}"
  }
}

resource "vsphere_virtual_disk" "data1" {
  size          = "${var.data1_size}"
  vmdk_path     = "${var.data1_vmdk_path}"
  datacenter    = "${var.data1_datacenter_name}"
  datastore     = "${var.data1_datastore_name}"
  type          = "${var.data1_disk_type}"
}

