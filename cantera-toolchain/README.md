# cantera-conda

Cantera toolchain with system libraries installed via pip. The cython version can be configured.

### Usage

Build the image
```
$ docker build -t cantera-toolchain .
```
or (with several build arguments)
```
$ docker build -t cantera-cython --build-arg uid=$(id -u) --build-arg gid=$(id -g) --build-arg cython=new .
```

Make sure that gui is enabled (see below), and start a container

```
$ cd <path-to-cantera-repo>
$ docker run -it --name ct- --mount "type=bind,src=$(pwd),dst=/src" \
                 --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
                 --workdir /src cantera-toolchain
```

### Setting `sudo`

While the container is running, set a password for the `cantera` user (using a _separate_ terminal)

```
$ docker exec -u 0 -it ct-fork bash
# passwd cantera # <-- set password for cantera
# usermod -aG sudo cantera # <-- add cantera to sudoers list
...
# exit
```

Inside the container started with `docker run ...`, compile cantera

```
$ cd /src
$ scons build python_cmd=python3
$ scons test
$ sudo scons install
```
