# cantera-docker

Container compiles cantera from source.

Work in progress ...

## Usage

Build docker image

```
$ docker build -t testing .
```

Initialize the container

```
$ docker run -it testing
```

Compile cantera

```
root@<container_ID>:/work# cd cantera
root@<container_ID>:/work/cantera# scons build python_cmd=python3
```

and test

```
root@<container_ID>:/work/cantera# scons test
```
