# Running nanoLIMS using docker

# 1. Install docker on system

Use the Docker-maintained install script for Debian or Ubuntu. For other operating systems, see the [Docker Installation](https://docs.docker.com/en/latest/installation/) guides.

1. Run 

```
curl -sSL https://get.docker.com/ | sh
```

2. Add nonroot user to "docker" group if necessary

```
sudo usermod -aG docker example_user
```

# 2. Setup

We are using a preconfigured LAMP image provided by linode which is found on [dockerhub](https://hub.docker.com/r/linode/lamp/).

2. 
```
sudo docker search linode
sudo docker pull linode/lamp
sudo docker run -p 80:80 -t -i linode/lamp /bin/bash
```

