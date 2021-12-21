# Table of Contents

* [Introduction - Basic Info](#id-IntroductionBasicInfo)
* [Commands for doing the Lab4](#id-CommandsLab4)
* [Screenshots](#id-Screenshots)
   * [Verification Of The Kubernetes Cluster](#id-VerificationOfTheKubernetesCluster)
   * [Running the `kustomization.yaml` File](#id-RunningThekustomizationyamlFile)
   * [Validating the created Wordpress Service](#id-ValidatingTheCreatedWordpressService)

# Lab 4

<br>

## Introduction -Basic Info <div id="id-IntroductionBasicInfo">



Cluster-Ip: 13.86.62.238

<br>

* Setup and configuration of an AKS in Azure.

* Configuration and deplyoment of Wordpress incl. MySQL in the AKS cluster. 

<br>
<hr>
<br>

## Commands <div id="id-CommandsLab4">

The following are commands that were needed for Lab 4:


1. Creating a Resource Group:
   * `az group create --name *YourName* --location *YourLocation*`
2. Creating a Cluster:
   * `az aks create --resource-group *YourResourceGroup* --name *YourAKSCluster* --node-count 1 --enable-addons monitoring --generate--ssh-keys`
3. Connecting to Kubernetes Cluster:
   * `az aks get-credentials --resource-group *YourResourceGroup* --name *YourAKSCluster*`
4. [Verify the Connection to the Cluster](id-ValidatingTheCreatedWordpressService):
   * `kubectl get nodes`
     * *NOTE:* The `kubecetl` needs to be installed first: https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/
5. [The `kustomization.yaml` file needs to be run](id-RunningThekustomizationyamlFile):
   * This file contains all resources for deploying a MySQL Database and Wordpress Service
   * `kubectl apply -k ./`
      * *NOTE:* This command needs to be run from the project folder, hence the `./` to indicate everything in the current work directoy
6. [Validate that the created Wordpress Service is running](id-ValidatingTheCreatedWordpressService):
   * `kubecetl get services wordpress` 

## Screenshots <div id="id-Screenshots">

<br>

Verification of the Kubernetes Cluster <div id="id-VerificationOfTheKubernetesCluster">

![](https://github.com/LazarGrbovic/Software_Deployment_WS2021/blob/main/Lab4/Screenshots/Kubectl_Get_Nodes.png)

<br>

Running the `kustomization.yaml` file <div id="id-RunningThekustomizationyamlFile">

![](https://github.com/LazarGrbovic/Software_Deployment_WS2021/blob/main/Lab4/Screenshots/Kubcetl_Apply_-k.png)

<br>

Validating that the created Wordpress Service is running <div id="id-ValidatingTheCreatedWordpressService">

![](https://github.com/LazarGrbovic/Software_Deployment_WS2021/blob/main/Lab4/Screenshots/Kubectl_Get_Services_Wordpress.png)
