# **README**

Welcome to the ARM Template tutorial!

<br>
<br>

# **ARM Template**

<br>

* ARM Template stands for "Azure Resource Management" Template
* It is used to implement infrastructure as code to Azure Solutions

<br>

* ARM Template is actually a JSON file that defines the infrastructure and configuration of a project, and it uses the declarative syntax to do that

<br>
<hr>
<br>

## **Sections of ARM Template**

<br>

The ARM Template contains following sections: (*Note: It isn't required that an ARM Template has all sections*)

* **Parameters**
  * => With parameters one same template can be used for different environments
* **Variables**
  * => Define values that are reused in templates, and those values are then constructed from parameters
* **User-Defined Functions**
  * => Functions that simplify the template
* **Resources**
  * => Specifies which resources will be deployed
* **Outputs**
  * => Returns the values from the deployed resources

<br>
<hr>
<br>


## **Template Deployment Process**

<br>

* When an ARM Template is deployed, what actually happens is that the template is converted into REST API operations
* That means that the values are taken from the JSON file, and from them a PUT Request is made and sent to `Microsoft.Storage` resource provider

<br>
<hr>
<br>


## **Tools needed (Editor & Azure CLI)**

<br>

* Editor
  * Working with ARM Templates is actually working with JSON file, so a basic JSON editor is needed
    * *In case of this tutorial the Visual Studio Code was used*
* Azure CLI
  * The ARM Template is deployed through the Azure CLI 
  * Azure CLI is free to download => https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
  * After the installation of the Azure CLI the user needs to login by executing the following command `az login`

<br>
<hr>
<br>

# **Creating ARM Template**

<br>

## **Creating Resource Group**

<br>

* "Resource group is a container that holds related resources for an Azure solution"
* Resource group includes those resources that one wants to manage as a group

<br>

* When deploying a template, a resource group, which will contain the resources, is needed

```PowerShell
az group create --name myResourceGroup --location "centralus"
```

<br>
<hr>
<br>

## **Template**

<br>

* The actual template is JSON file, and it needs to be named `azuredeploy.json`
* The following is my ARM Template used for this tutorial

```JSON
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
      "storageName": {
        "type": "string",
        "minLength": 3,
        "maxLength": 24
      },
      "storageSKU": {
        "type": "string",
        "defaultValue": "Standard_LRS",
        "allowedValues": [
          "Standard_LRS",
          "Standard_GRS",
          "Standard_RAGRS",
          "Standard_ZRS",
          "Premium_LRS",
          "Premium_ZRS",
          "Standard_GZRS",
          "Standard_RAGZRS"
        ]
      },
      "location": {
      "type": "string",
      "defaultValue": "[resourceGroup().location]"
    }
    },
    "functions": [],
    "variables": {},
    "resources": [
      {
        "type": "Microsoft.Storage/storageAccounts",
        "name": "[parameters('storageName')]",        
        "apiVersion": "2019-06-01",        
        "location": "[parameters('location')]",
        "kind": "StorageV2",
        "sku": {
          "name": "[parameters('storageSKU')]"          
        }
      }
    ],
    "outputs": {}
  }
```


<br>

For the start it needs to have 3 sections:


### **`$schema`**
   * Specifies the location of the JSON schema file, and describes the properties available within a template
### **`contentVersion`**
   * Specifies the version of the template (*this value is used to document significant changes in template, one can think of it as the Template Version*)
### **`resources`** 
   * Resources which will be deployed or updated
     * `type` => Type of the resource, the value is the combination of the namespace of the resource provider and the resource type, e.g. `Microsoft.Storage/storageAccounts`
     * `name` => Name of the reosurce
     * **Important:** The storage account name must be unique across Azure
       * In this case the name is provided as parameter
     * `apiVersion` => Version of the REST API to use for creating the resource 
     * `location` => Sets the region where the resource is deployed
     * `kind` => Defines the type of the resource being deployed
     * `sku` => `Stock-Keeping-Unit` 
       * *Explained in the* `parameters` *section* 

<br>
<br>

### **`parameters`**
  * Parameters make template reusable
    * When defining parameters we can also define constraints that are applied to parameters
  * In this case we have defined the following parameters:
    * `storageName`
      * This parameters has following constraints: 
        * Its type is `string`, minimum length is `3` and maximum length is `24`
    * `storageSKU`
      * `SKU` =  `Stock-Keeping-Unit` and `Standard_LRS` stands for "Standard Locally Redundant Storage" which supports the following account kinds: Storage, BlobStorage, Storage V2
    * `location` 
      * For this paremter we use a function `resourceGroup().location`
      * This function returns an object with information about the resource group being used for deployment
      * This is a default value, i.e. the storage account location has the same location as the resource group


<br>
<hr>
<br>

## **Parameters File**


* The parameters file is a JSON file, and it needs to be named `azuredeploy.parameters.json`
* The following is my parameters file used in this tutorial

```JSON
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
      "storageName": {
          "value": "lab1lazargrbovicstorage" 
      },
      "storageSKU": {
          "value": "Standard_LRS"
      }
    }
  }
```

The values of the parameters are explained above


<br>
<hr>
<br>

# **Deplyoment**

<br>

After creating the template file `azuredeploy.json` and parameters file `azuredeploy.parameters.json` we can now deploy our template using the Azure CLI

<br>


```PowerShell
az deployment group create --name {DeploymentName} --resource-group {ResourceGroup} --template-file {TemplateFilePath} --parameters {ParametersFilePath}
```

<br>

*Note: The `{` and the `}` are used only as a place holders for the actual parameters, i.e. they do NOT need to be included in the actual command*

<br>
<hr>
<br>

# **Creating WebApp**

<br>

For this tutorial, I have created a simple Node example app

```PowerShell
# It is assumed that the user is in the directory where the Template and Parameters file are located
npx express-generator myExpressApp --view pug
cd myExpressApp
npm install
npm start # This starts the application, so that the user can verify that the application is up and running (visit localhost:3000) 
```

<br>

# **Deploying WebApp**

<br>

In the main folder of the WebApp, the following command needs to be executed

```PowerShell
az webapp up --resource-group {ResourceGroup} --name {WebApp Name, e.g. myExpressApp} 
```

<br>

The user should expect the following output on terminal 

``` 
The webapp 'myExpressApp' doesn't exist
Creating AppServicePlan '113095_asp_Linux_centralus_0' ...
Creating webapp 'myExpressApp' ...
Configuring default logging for the app, if not already enabled
```

<br>
<hr>
<br>

## Literature

<br>

* https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/overview
* https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/syntax
* https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-create-first-template?tabs=azure-powershell *(1-9)*
* https://intellipaat.com/community/44076/what-is-sku-in-azure
* https://superuser.com/questions/1392227/what-does-sku-stand-for-in-microsoft-azure
* https://docs.microsoft.com/en-us/rest/api/automation/automation-account/create-or-update#skunameenum
* https://docs.microsoft.com/en-us/azure/app-service/quickstart-nodejs?tabs=windows