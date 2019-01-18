---
layout: post
title:  "Gradual Typing With Javascript and VS Code"
date:   2019-1-17 11:40:43 -0800
categories: polyglot
---


let's get ourselves a minimal debian environment
```bash
john@BigBox:~/git/JohnCSimon.github.io$  sudo docker run -ti debian /bin/bash
Unable to find image 'debian:latest' locally
latest: Pulling from library/debian
cd8eada9c7bb: Pull complete
Digest: sha256:58a80e0b6aa4d960ee2a5452b0230c406c47ed30a66555ba753c8e1710a434f5
Status: Downloaded newer image for debian:latest
root@6d933dddbbcd:/#
```
Just to satisfy my OCD let's get the latest updates!

`apt update && apt upgrade -y`

 `apt install gnupg2 curl procps -y`
 Installs gpg2, curl and ps


`gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`

`\curl -sSL https://get.rvm.io | bash -s stable`

`source /etc/profile.d/rvm.sh` add rvm to your commandline

```bash

rvm list known

```


* To start using RVM you need to run `source /etc/profile.d/rvm.sh`

[typescript-site]: https://www.typescriptlang.org/
[dt-site]: http://definitelytyped.org/
[type-annotation]: https://github.com/Microsoft/TypeScript/wiki/Type-Checking-JavaScript-Files