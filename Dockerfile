# docker build -t ctf .
# docker run --rm -v $PWD:/ctf --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf
# docker exec -it ctf /bin/bash
#thanks, liveoverflow

FROM ubuntu:18.04
LABEL maintainer="pryr@pryr.xyz"

#ENV Variables
ENV LC_CTYPE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
apt-get update && \
apt-get install -y build-essential jq strace ltrace curl wget rubygems gcc dnsutils netcat gcc-multilib net-tools vim gdb gdb-multiarch python python3 python3-pip python3-dev libssl-dev libffi-dev wget git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev python-pip nmap whois sqlmap netcat tmux binutils iputils-ping binwalk htop ssh steghide libc6:i386 libncurses5:i386 libstdc++6:i386 && \
pip install capstone requests pwntools r2pipe && \
pip3 install pwntools keystone-engine unicorn capstone ropper && \
mkdir tools && cd tools && \
git clone https://github.com/radare/radare2 && cd radare2 && sys/install.sh && \
cd .. && git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh
