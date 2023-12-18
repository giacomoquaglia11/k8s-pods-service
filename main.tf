locals {
  vnet_cidr = ["10.0.0.0/16"]
  subnet_cidr_1 = ["10.0.1.0/24"]
  computer_name = "QuagliaVM"
  admin_username = "quagliagiacomo"
  admin_password = "QuagliaGiacomo01"
}
resource "azurerm_virtual_network" "vnet" {
  name = "${var.name_prefix}-vnet"
  address_space = local.vnet_cidr
  location = var.region
  resource_group_name = var.resource_group_name
}
resource "azurerm_subnet" "subnet" {
  name = "${var.name_prefix}-subnet"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = local.subnet_cidr_1
}
resource "azurerm_kubernetes_cluster" "aks" {
  name = var.cluster_name
  location = var.region
  resource_group_name = var.resource_group_name
  # dns_prefix = var.cluster_name
  default_node_pool {
    name = "node"
    node_count = 1
    vm_size = "Standard_DS2_v2"
    type = "VirtualMachineScaleSets"
    os_disk_size_gb = 30
  }
  identity {
    type = "SystemAssigned"
  }
  tags = {
    Environment = "Production"
  }
  network_profile {
    network_plugin = "kubenet" 
  }
}
resource "null_resource" "startup" {
  depends_on = [local_file.kubeconfig]
  provisioner "local-exec" {
    command = "PowerShell.exe -ExecutionPolicy Unrestricted -File .\\startup.ps1"
  }
}