# Kubernetes NonPreemptingPriority gate feature demo

In Kubernetes, _Priority_ determines the importance of a Pod to other
Pods and _Preemption_ is the logic which tries to find a Node to
remove one or more low priority Pods to schedule a high priority Pod.

The goal of this project is to clarify those concepts through code
examples. This project deploys an All-in-One Kubernetes Cluster with
the `NonPreemptingPriority` feature gate enabled with the
[installer](installer.sh) bash script which is consumed by the
[Vagrantfile](Vagrantfile).

## Setup

This project uses [Vagrant tool][2] for provisioning Virtual Machines
automatically. The [setup](setup.sh) bash script contains the
Linux instructions for installing dependencies and plugins
required for its usage. This script supports two Virtualization
providers (Libvirt and VirtualBox).

    $ ./setup.sh -p libvirt

Once Vagrant is installed, it's possible to deploy the demo with the
following instruction:

    $ vagrant up

## License

Apache-2.0

[1]: https://github.com/kubernetes-sigs/kubespray
[2]: https://www.vagrantup.com/
