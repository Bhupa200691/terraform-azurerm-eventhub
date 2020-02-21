output "namespaces" {
  description = "Map of the namespaces"
  value = {
    for namespace, config in var.eventhub_namespaces_hubs :
    namespace => azurerm_eventhub_namespace.eventhub_namespace[namespace].id
  }
}

output "hubs" {
  description = "Map of the hubs"
  value = {
    for namespace, config in var.eventhub_namespaces_hubs :
    namespace => { for hub in local.hubs_list :
    azurerm_eventhub.eventhub[hub].name => azurerm_eventhub.eventhub[hub].id if split("|", hub)[0] == namespace }
  }
}

# output "senders" {
#   description = "Map of the senders access policies"
#   value = {
#     for namespace, config in var.servicebus_namespaces_hubs :
#     namespace => { for queue in local.hubs_sender :
#     azurerm_servicebus_queue_authorization_rule.sender[queue].name => azurerm_servicebus_queue_authorization_rule.sender[queue].primary_connection_string if split("|", queue)[0] == namespace }
#   }
# }

# output "readers" {
#   description = "Map of the readers access policies"
#   value = {
#     for namespace, config in var.servicebus_namespaces_hubs :
#     namespace => { for queue in local.hubs_reader :
#     azurerm_servicebus_queue_authorization_rule.reader[queue].name => azurerm_servicebus_queue_authorization_rule.reader[queue].primary_connection_string if split("|", queue)[0] == namespace }
#   }
# }

# output "manages" {
#   description = "Map of the manages access policies"
#   value = {
#     for namespace, config in var.servicebus_namespaces_hubs :
#     namespace => { for queue in local.hubs_manage :
#     azurerm_servicebus_queue_authorization_rule.manage[queue].name => azurerm_servicebus_queue_authorization_rule.manage[queue].primary_connection_string if split("|", queue)[0] == namespace }
#   }
# }
