locals {
  webapp = {
    app_service_environments     = merge( try( var.webapp.app_service_environments, {}), var.app_service_environments )
    app_service_plans            = merge( try( var.webapp.app_service_plans, {}), var.app_service_plans )
    app_services                 = merge( try( var.webapp.app_services, {}), var.app_services ) 
    azurerm_application_insights = merge( try( var.webapp.app_service_environments, {}), var.azurerm_application_insights )
    function_apps                = merge( try( var.webapp.function_apps, {}), var.function_apps )
    static_sites                 = merge( try( var.webapp.static_sites, {}), var.static_sites )
  }
}
