# ou-robotics-vrep - robot VM

In order to simplify the installation of software for running the activities, build a virtual machine that contains:

- a minimal Linux desktop
- the [Coppelia Robotics V-REP simulator](http://www.coppeliarobotics.com/)
- a Jupyter notebook server
- the [vrep-api-python](https://github.com/Troxid/vrep-api-python) V-REP API Python wrapper

The virtual machine will:

- launch with a GUI desktop using Virtualbox;
- disable VM desktop screensaver;
- autorun the V-REP simulator on the virtual desktop;
- autorun the Jupyter notebook server.

When launched under `vagrant` using the supplied `Vagrantfile`:

- a shared directory will made available between the host machine and virtual machine that allows notebooks to be shared from the host into the VM;
- enable copy and paste between the host machine and the virtual machine; *(for a Mac, cmd-c/v on host, ctrl-shift-c/v in guest);*
- enable port forwarding so that the notebooks served by the Jupyter server can be viewed using a browser on the host machine (`http://localhost:12980`).
 

## Installation

To install and run the VM:

- download and install Virtualbox ([here](https://www.virtualbox.org/wiki/Downloads));
- download and install Vagrant ([here](https://www.vagrantup.com/downloads.html));
- *optionally*, install Vagrant plugin to ensure that VirtualBox Additions match between guest and host machines: `vagrant plugin install vagrant-vbguest`
- download and unzip the contents of this repo and `cd` into the `robotVM/` folder.

### Build the VM
`cp Vagrantfile.build Vagrantfile && vagrant up && vagrant halt`

### Run the VM Desktop With VirtualBox GUI

__First run:__ `cp Vagrantfile.user Vagrantfile && vagrant up`

__Thereafter:__ `vagrant up`

Suspend / resume VM: `vagrant suspend` / `vagrant resume`

Halt / restart VM: `vagrant halt` / `vagrant up`

Reboot running VM: `vagrant reload`

## Demo

The following demo is based on the demo provided in the  `vrep-api-python` repo:

- launch the VM;
- in the V-REP simulator running on the VM desktop, load in the `Pioneer.ttt` scene from the `/vagrant/scenes/` directory;
- in your browser on host, got to `http://127.0.0.1:12980` and load the `Demo.ipynb` notebook;
- work though the notebook and watch the simulator...