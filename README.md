# cantera-docker

Container compiles cantera from source (using separate layers for tool chain, source compilation and testing). 

The workflow was tested on a [Docker CE](https://docs.docker.com/install/) installation.

## Usage

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

## Build Code from Fork

Make sure repo is up to date; then tar the local clone of the cantera fork.

```
$ tar -cvzf cantera.tar.gz cantera
$ mv cantera.tar.gz <path-to-cantera-docker>/cantera-fork/
```

Build docker image that compiles cantera from source (i.e. this will take a while).

```
$ cd cantera-fork
$ docker build -t cantera-fork .
$ cd ..
```



## Alternatives

 * [wmichalak/canteracontainer](https://github.com/wmichalak/canteracontainer): conda cantera container
 * [danielle-mustillo/docker-cantera](https://github.com/danielle-mustillo/docker-cantera): conda cantera container with jupyter

## References

 * Compilation within Docker: [Hello World in C++, with Docker](https://amytabb.com/ts/2018_07_28/)
 * Intro to Docker: [Docker tutorial series](https://rominirani.com/docker-tutorial-series-a7e6ff90a023)
 * Privileges: [Processes in Containers ... Not Run As Root](https://medium.com/@mccode/processes-in-containers-should-not-run-as-root-2feae3f0df3b)
 * Layers: [Digging into Docker layers](https://medium.com/@jessgreb01/digging-into-docker-layers-c22f948ed612)
