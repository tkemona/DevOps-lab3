param location string = 'westeurope'
param acrName string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'devops-rg'
  location: location
}

resource acr 'Microsoft.ContainerRegistry/registries@2022-12-01-preview' = {
  name: acrName
  location: location
  sku: { name: 'Basic' }
}
