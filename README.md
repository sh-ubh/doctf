# doctf
Docker for CTFs
This is my docker build for playing CTFs. Feel free to use it, I will also add new tools as per my needs.

## Deployment
```
$ git clone https://github.com/anon6405/doctf
$ cd doctf
$ docker build -t ctf .
$ docker run --rm -v $PWD:/ctf --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf
$ docker exec -it ctf /bin/bash
```

Thanks, liveoverflow for giving an overview
