output "azure_container_instance_resource_group_name" {
  value = azurerm_container_group.acigroup.resource_group_name
}

output "azure_container_instance_id" {
  value = azurerm_container_group.acigroup.id
}