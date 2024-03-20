FROM ubuntu:latest
RUN apt-get update && apt-get -y --no-install-recommends install bash  ca-certificates curl python3-venv python3-pip && apt-get clean all
RUN bash -c 'install -m 0755 -d /etc/apt/keyrings;curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc; chmod a+r /etc/apt/keyrings/docker.asc ;echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null'
RUN bash -c 'apt-get update &&  apt-get -y --no-install-recommends install openssh-client  docker-ce-cli  docker-buildx-plugin docker-compose-plugin socat curl jq git less  bash pv & ( python3 -m venv venv ; source venv/bin/activate  ; pip3 install pillow requests beautifulsoup4 pandas webdriver-manager selenium selenium-stealth ;cp -aurv veenv /etc/myveenv) & wait;ln -s /usr/local/bin/* /usr/bin/ || true ' && apt-get clean all
RUN find / -name docker
RUN dpkg -L docker-ce-cli
RUN which docker
