---
title: 'Docker cheat sheet'
abstract: "Quick reference for common Docker commands. Basic docker knowledge is required."
---

# Start container with shell

```
docker run -it image-name /bin/bash
```

# Kill all containers

```
docker kill $(docker ps -q)
```

# Cleaning up

Delete all docker containers:

```
docker rm $(docker ps -a -q)
```

Delete all docker images:

```
docker rmi $(docker images -q)
```

Delete all untagged docker images:

```
docker rmi $(docker images -q -f dangling=true)
```

Delete all unused local volumes:

```
docker volume prune
```

Delete all unused networks:

```
docker network prune
```

