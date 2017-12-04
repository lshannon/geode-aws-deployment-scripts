# Geode Cluster scripts

Apache Geode is an amazing memory oriented clusters. It can handle:

- Caching use cases (JSR 107)
- Key/Value data store use cases
- Shared Nothing In-Memory compute
- Event driven data exchange using subscriptions between clients and the cluster

This repo contains scripts to run Geode locally (all members on the local machine) and remotely, all members
in their own machines.

## How It Works

The Geode binaries and all dependancies are copied to each machine. Geode supports a CLI called `gfsh` that can be used start, stop and manage Geode processes.

Once the Locators have been started, a `gfsh` connection can be made from any location that can in turn issue commands to the rest of the Cluster.

The `geode-ubuntu-package` folder contains all the required binaries to run Geode locally and remotely. This folder is copied up to remote machines.

## Set Up

In the `remote_management_scripts`, run the `setup.sh` script.

### Locally

### Remote



## Requirements

### Local

All scripts and setting have been made assuming a Mac or Linux OS.

### Remote

These remote scripts set up 2 Locators and 4 Servers. These scripts have been written assuming
a Ubuntu Linux OS on the remote machines.

The scripts in their current form assume EC2 machines.

#### Setting Up Remote machines on AWS

1. Geode requires dedicated and high performance networking between them. A 10gb network is recommended
2. To call commands remotely its assume an AWS `gemfire.pem` will be created and stored in the root directory

## Disclaimer

This is not tested for Production. Do not use these scripts without completely testing them. As Geode is a distributed system, to test them it must be done in the environment you expect to run them, using a Cluster size similar to production. Ensure to run your tests under load and over and extended duration of time.


## Next Steps

- Extended remote scripts to work with Azure or GCP (or create separate scripts for those)
