# cantera-docker

Container compiles cantera from source. For docker containers based on a conda installer, refer to [wmichalak/canteracontainer](https://github.com/wmichalak/canteracontainer). 

The workflow was tested on a [Docker CE](https://docs.docker.com/install/) installation.

## Usage

Build docker image that compiles cantera from source (i.e. this will take a while).

```
$ cd cantera-src 
$ docker build -t cantera-src .
$ cd ..
```

Build second layer for testing (avoiding container with root privileges)

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

## References

 * Cantera Docker container using conda: [wmichalak/canteracontainer](https://github.com/wmichalak/canteracontainer).
 * Compilation within Docker: [Hello World in C++, with Docker](https://amytabb.com/ts/2018_07_28/)
 * Intro to Docker: [Docker tutorial series](https://rominirani.com/docker-tutorial-series-a7e6ff90a023)
 * Privileges: [Processes in Containers ... Not Run As Root](https://medium.com/@mccode/processes-in-containers-should-not-run-as-root-2feae3f0df3b)
