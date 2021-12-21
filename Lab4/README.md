# Lab 4

<br>

Cluster-Ip: 13.86.62.238

<br>

* Setup and configuration of an AKS in Azure.

* Configuration and deplyoment of Wordpress incl. MySQL in the AKS cluster. 

<br>
<hr>
<br>

## Commands

The following are commands that were needed for Lab 4:


1. Creating a Resource Group    
   * `az group create --name *YourName* --location *YourLocation*`
2. Creating a Cluster
   * `az aks create --resource-group *YourResourceGroup* --name *YourAKSCluster* --node-count 1 --enable-addons monitoring --generate--ssh-keys`
3. Connecting to Kubernetes Cluster
   * `az aks get-credentials --resource-group *YourResourceGroup* --name *YourAKSCluster*`
4. Verify the Connection to the Cluster
   * `kubectl get nodes`
     * *NOTE:* The `kubecetl` needs to be installed first: https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/
5. The `kustomization.yaml` file needs to be run
   * This file contains all resources for deploying a MySQL Database and Wordpress Service
   * `kubectl apply -k ./`
      * *NOTE:* This command needs to be run from the project folder, hence the `./` to indicate everything in the current work directoy
6. Validate that the created Wordpress Service is running:
   * `kubecetl get services wordpress` 

## Screenshots

<br>

Verification of the Kubernetes Cluster

![](https://https://github.com/LazarGrbovic/Software_Deployment_WS2021/blob/main/Lab4/Screenshots/Kubectl_Get_Nodes.png)

<br>

Running the `kustomization.yaml` file

![](https://https://github.com/LazarGrbovic/Software_Deployment_WS2021/blob/main/Lab4/Screenshots/Kubcetl_Apply_-k.png)

<br>

Validating that the created Wordpress Service is running

![](https://https://github.com/LazarGrbovic/Software_Deployment_WS2021/blob/main/Lab4/Screenshots/Kubectl_Get_Services_Wordpress.png)
