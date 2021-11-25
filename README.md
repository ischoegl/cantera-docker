# cantera-docker

Container compiles cantera from source (using separate layers for tool chain, source compilation and testing).

The workflow was tested on a [Docker CE](https://docs.docker.com/install/) installation.

### Usage

Build docker image with tool chain (ubuntu + buildessentials, etc.).

```
$ cd ubuntu-toolchain
$ docker build -t ubuntu-toolchain .
$ cd ..
```

Build docker image that compiles cantera from source (i.e. this will take a while).

```
$ cd cantera-src
$ docker build -t cantera-src .
$ cd ..
```

Build third layer for testing (avoiding container with root privileges)

```
$ cd cantera-testing
$ docker build -t cantera-testing .
$ cd ..
```

Initialize the container

```
$ docker run -it cantera-testing
```

Verify that everything works

```
ctuser@<container_ID>:~$ cp .python-examples/surface_chemistry/catalytic_combustion.py .
ctuser@<container_ID>:~$ python catalytic_combustion.py
```

### Enabling GUI Display

*TODO: this no longer works*

A quick example for a running GUI, based on [this](https://medium.com/@SaravSun/running-gui-applications-inside-docker-containers-83d65c0db110)

```
$ cd gui
$ docker build -t gui-app .
```

On Wayland, [additional measures are required](https://unix.stackexchange.com/questions/330366/how-can-i-run-a-graphical-application-in-a-container-under-wayland) allow local user access to to x host, and retrieve the user id

```
$ xhost +SI:localuser:$(id -un)
$ id -u
```

Then start a container using:
```
$ docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
             --user=$(id -u):$(id -g) gui-app
```

### Share a Local Folder with Docker

Start docker container, using a bind mount to the local folder

```
$ docker run -it --name <container_name> --mount type=bind,source="$(pwd)",target=/<folder> <image_name>
```

## Alternatives

 * [wmichalak/canteracontainer](https://github.com/wmichalak/canteracontainer): conda cantera container
 * [danielle-mustillo/docker-cantera](https://github.com/danielle-mustillo/docker-cantera): conda cantera container with jupyter

## References

 * Compilation within Docker: [Hello World in C++, with Docker](https://amytabb.com/ts/2018_07_28/)
 * Intro to Docker: [Docker tutorial series](https://rominirani.com/docker-tutorial-series-a7e6ff90a023)
 * Privileges: [Processes in Containers ... Not Run As Root](https://medium.com/@mccode/processes-in-containers-should-not-run-as-root-2feae3f0df3b)
 * Layers: [Digging into Docker layers](https://medium.com/@jessgreb01/digging-into-docker-layers-c22f948ed612)
 * Permissions: [shared permissions](https://vsupalov.com/docker-shared-permissions/)
