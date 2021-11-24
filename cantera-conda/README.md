# cantera-conda

Canter toolchain with system libraries installed via conda.

### Usage

Build the image
```
$ docker build -t cantera-conda .
```
or
```
$ docker build -t cantera-conda --build-arg uid=$(id -u) --build-arg gid=$(id -g) .
```

Make sure that gui is enabled (see below), and start a container

```
$ cd <path-to-cantera-repo>
$ docker run -it --name ct-conda --mount "type=bind,src=$(pwd),dst=/src" \
                 --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
                 --workdir /src cantera-conda
```
