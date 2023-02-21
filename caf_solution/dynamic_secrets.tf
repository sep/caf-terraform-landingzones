module "dynamic_keyvault_secrets" {
  source  = "aztfmod/caf/azurerm//modules/security/dynamic_keyvault_secrets"
  version = "5.6.5"

  #source = "git::https://github.com/sep/terraform-azurerm-caf.git//modules/security/dynamic_keyvault_secrets"
  #source = "git::https://github.com/sep/terraform-azurerm-caf.git//modules/security/dynamic_keyvault_secrets?ref=sep-mods"
  
  for_each = {
    for keyvault_key, secrets in try(var.dynamic_keyvault_secrets, {}) : keyvault_key => {
      for key, value in secrets : key => value
      if try(value.value, null) == null
    }
  }

  settings = each.value
  keyvault = module.solution.keyvaults[each.key]
  objects  = module.solution
}