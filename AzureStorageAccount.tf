
module "resource-group" {
  source = "./modules/general/resourcegroup"  
  resource_group_name = var.resource_group_name
  location            = var
}
##  Demo now
resource "azurerm_storage_account" "StorageAccountDemo" {
  name                     = "npsatestant000012"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    video = "azure"
    channel = "CloudQuickLabs"
  }
}