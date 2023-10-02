# Prometheuzdy-Terraform

Terraform scripts for setting up infrastructure on Prometheuzdy.cloud.

## Overview

This repository contains Terraform configurations for deploying instances and a K3S cluster on an ESXi environment. The configurations are modular, allowing for the deployment of individual instances or a complete K3S cluster with master and agent nodes.

## Modules

### 1. [Initiate Instance](https://github.com/WasinUddy/Prometheuzdy-Terraform/tree/main/Initiate_Instance)

This module is responsible for initiating a single instance on the ESXi environment. The configurations allow for the specification of VM details such as CPU, memory, disk size, and network interface.


### 2. [Initiate K3S Cluster](https://github.com/WasinUddy/Prometheuzdy-Terraform/tree/main/Initiate_K3S_Cluster)

This module sets up a K3S cluster with separate configurations for the master and agent nodes. The master node is deployed first, followed by the agent nodes which join the cluster.


## License

This project is licensed under the [MIT License](https://github.com/WasinUddy/Prometheuzdy-Terraform/blob/main/LICENSE).

