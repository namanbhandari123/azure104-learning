param accountType string = 'Standard_LRS'
param location string = resourceGroup().location
param accountName string = 'storage${uniqueString(resourceGroup().id)}'

resource storeacct 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: accountName
  location: location
  sku: {
    name: accountType
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

output storageAccountName string = accountName
output storageAccountId string = storeacct.id
