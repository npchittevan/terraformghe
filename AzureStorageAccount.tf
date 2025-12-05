
module "resource-group" {
  source = "./modules/general/resourcegroup"  
  resource_group_name = var.resource_group_name
  location            = var.location
}
##  Demo now

resource "azurerm_storage_account" "StorageAccountDemo" {
  name                     = "npsatestant000012"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    video = "azure"
    channel = "CloudQuickLabs"
  }
}
