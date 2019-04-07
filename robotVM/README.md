# ou-robotics-vrep - robot VM

The robotics activities described in this repo use Python scripts running in Jupyter notebooks to control simulatd robots in the Coppelia Robotics V-REP simulator.

The software set-up can be installed two ways:

- DIY on your own computer;
- using a pre-built virtual machine, with notebooks accessed via a web browser on your host operating system.

The notebooks are being developed as part of a course. The suggested path through them is as follows:

- `Getting Started With The Notebooks.ipynb`
- `Getting Started With Notebooks and the V-REP Simulator.ipynb`
- `Demo - linetracer.ipynb`
- `Demo - Square 1.ipynb`
- `Demo - Square 2.ipynb`

The notebook `Demo - vrep magic.ipynb` is a scratch pad containing examples of how to do all sorts of things...

The `howtos` directory contains helpfiles for doig various things with the V-REP simulator.

## DIY Installation Route

- download and install a Jupyter notebook installation (e.g. download and install the Anaconda scientific python distribution);
- download and install the V-REP simulator;
- in the notebook environment, install the `vrep-api-python` package from the Github repo [Troxid/vrep-api-python](https://github.com/Troxid/vrep-api-python)


## Virtual Machine Route

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

### Related blog posts (documenting the process...):

- [Distributing Virtual Machines That Include a Virtual Desktop To Students – V-REP + Jupyter Notebooks](https://blog.ouseful.info/2017/09/10/distributing-virtual-machines-that-include-a-virtual-desktop-to-students-v-rep-jupyter-notebooks/)
- [IPython Magic for Controlling the V-REP Robot Simulator from Jupyter notebooks](https://blog.ouseful.info/2017/10/03/ipython-magic-for-v-rep-robot-simulator/)
- [First Attempt At Using IPywidgets in Jupyter Notebooks to Display V-REP Robot Simulator Telemetry](https://blog.ouseful.info/2017/10/03/first-attempt-at-using-ipywidgets-in-jupyter-notebooks-to-display-v-rep-robot-simulator-telemetry/)

## Installation

To install and run the VM:

- download and install Virtualbox ([here](https://www.virtualbox.org/wiki/Downloads));
- download and install Vagrant ([here](https://www.vagrantup.com/downloads.html));
- *optionally*, install Vagrant plugin to try to match the version of VirtualBox Guest Additions between guest and host machines: `vagrant plugin install vagrant-vbguest`
- download and unzip the contents of this repo and `cd` into the `robotVM/` folder.

### Build the VM (Optional)

To build the VM from scratch:

`cp Vagrantfile.build Vagrantfile && vagrant up && vagrant halt`

### Run the VM Desktop With VirtualBox GUI

If you have built the VM locally (optional), you will be able to launch the VM using that image.

If the locally built image is not find, the user `Vagrantfile` will automatically pull the latest prebuilt [ouseful/ou-robotics-test](https://app.vagrantup.com/ouseful/boxes/ou-robotics-test) box image from Vagrant Cloud and use that to launch the VM:

__First run:__ `cp Vagrantfile.user Vagrantfile && vagrant up`

__Thereafter:__ `vagrant up`

Suspend / resume VM: `vagrant suspend` / `vagrant resume`

Halt / restart VM: `vagrant halt` / `vagrant up`

Reboot running VM: `vagrant reload`

## Demo

The following demo is based on the demo provided in the  `vrep-api-python` repo:

- launch the VM;
- ensire that the V-REP simulator is running on the VM desktop;
- in your browser on host, got to `http://127.0.0.1:12980` and load the `Demo - vrep magic.ipynb` notebook;
- work though the notebook and watch the simulator...

## Other V-REP edu Demos

- [clement-moulin-frier/pyvrep_epuck](https://github.com/clement-moulin-frier/pyvrep_epuck): example tutorial notebooks; uses extension to `vrep` py package; scenes and notebooks included;
- [Obero/vrep_2w1a_python_sample](https://github.com/Obero/vrep_2w1a_python_sample): demo for "two wheels, one arm" robot(?) (`.ttt` file included);
- [Quadruped Robot 5: Simulation on V-REP](http://galvanicloop.com/blog/post/7/quadruped-robot-5-simulation-on-v-rep)
- *poppy projext*: useful resources using a humanoid robot and simple robot arm. Example notebooks [here](https://github.com/poppy-project/community-notebooks);
- vrep and openCV: [nemilya/vrep-api-python-opencv](https://github.com/nemilya/vrep-api-python-opencv)

PS Examples elsewhere. Eg [ROS Juoyter widgets](https://blog.jupyter.org/ros-jupyter-b7e82b5e1202)
