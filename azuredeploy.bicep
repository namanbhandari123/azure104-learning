@description('Storage Account type')
@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_ZRS'
  'Premium_LRS'
])
param storageAccountType string = 'Standard_LRS'

resource newjikanamanstorage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'newjikanamanstorage'
  location: resourceGroup().location
  sku: {
    name: storageAccountType
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
  }
}

output storageEndpoint object = newjikanamanstorage.properties.primaryEndpoints
