module "publickey" {
  source = "../../_tfmodules/openstack/public_key"

  project = var.project
}

module "secgroup_ssh" {
  source = "../../_tfmodules/openstack/security_group"

  project = var.project
}

module "controlplane" {
  source = "../../_tfmodules/openstack/basic_vm"

  counter   = 3
  project   = var.project
  pubkey    = module.publickey.public_key
  secgroups = [module.secgroup_ssh.secgroup]
  flavor    = "2C-2GB-20GB"
}
