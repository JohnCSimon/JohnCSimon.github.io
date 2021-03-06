---
layout: post
title:  "The Perspicacious Polyglot's Programming Language Plethora"
date:   2019-1-17 11:40:43 -0800
categories: polyglot
---
I like to play around with lots of different programming languages, but install too many and they pollute your working environment, so it's better to have them installed as a user instead of root. 
Here's a way to get several of them installed into your unix user directory. 
If things go wrong, or you get bored you can easily `rm -rf` the installation.

# Initial Install
Let's get ourselves a minimal debian environment. I'm using docker here, but you can use a native install, or a VM, or Windows Services for Linux with the ubuntu install.
```shell
john@BigBox:~/git/JohnCSimon.github.io$  sudo docker run -ti debian /bin/bash
Unable to find image 'debian:latest' locally
latest: Pulling from library/debian
cd8eada9c7bb: Pull complete
Digest: sha256:58a80e0b6aa4d960ee2a5452b0230c406c47ed30a66555ba753c8e1710a434f5
Status: Downloaded newer image for debian:latest
root@6d933dddbbcd:/#
```
Just to satisfy my OCD let's get the latest updates.

`apt update && apt upgrade -y`

 `apt install gnupg2 curl procps -y`
 Installs gpg2, curl and ps

# ruby
`gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`

`\curl -sSL https://get.rvm.io | bash -s stable`

To start using RVM you need to run `source /etc/profile.d/rvm.sh` or re-login to re-load `~/.profile`

From here you can run - `rvm list known` and you'll see a list of ruby flavors and individual versions. 

```bash
# MRI Rubies
[ruby-]1.8.6[-p420]
[ruby-]1.8.7[-head] # security released on head
[ruby-]1.9.1[-p431]
[ruby-]1.9.2[-p330]
[ruby-]1.9.3[-p551]
[ruby-]2.0.0[-p648]
[ruby-]2.1[.10]
[ruby-]2.2[.10]
[ruby-]2.3[.8]
[ruby-]2.4[.5]
[ruby-]2.5[.3]
[ruby-]2.6[.0]
```

MRI Ruby is the reference version of Ruby so let's install the latest version.

`rvm install ruby-2.6.0`

I'm running debian and rvm might ask for your root password to install some prerequsites from apt before compiling a new version. 

Congrats, you now have a ruby install 

```shell
$ ruby -v
ruby 2.6.0p0 (2018-12-25 revision 66547) [x86_64-linux]
```

from here you can now do whatever since I'm blogging this using jekyll

`gem install bundler jekyll`


# go
Go is a language that releases new versions on a regular basis. 
There's a similar tool to rvm called gvm. It's a "go version manager" available from here `https://github.com/moovweb/gvm` that'll let you install multiple versions and set $GOPATH and $GOROOT.


as a regular user:
```shell
$ bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
Cloning from https://github.com/moovweb/gvm.git to /root/.gvm
No existing Go versions detected
Installed GVM v1.0.22

Please restart your terminal session or to get started right away run
 `source /root/.gvm/scripts/gvm`
```

 you should be able to run and see 
```shell
$ gvm version
Go Version Manager v1.0.22 installed at /home/john/.gvm
```

Run `gvm listall`
which will give you a list of all the available versions of go.

```shell
$gvm listall

gvm gos (available)

   go1
   go1.0.1
   ...
   go1.11rc1
   go1.11rc2
   go1.11.1
   go1.11.2
   go1.11.3
   go1.11.4
   go1.12beta1
   go1.12beta2
```
of which there are entirely too many. 

From here, we can install go as our user via binary here: 

`gvm install go1.4 -B`

try it out
```bash
$ go version
go version go1.4 linux/amd64
```
We can see it gets installed here:
```bash
$ echo $GOROOT
/home/john/.gvm/gos/go1.4
```

From the gvm link earlier, in order to compile a go build environment for versions 1.5 on we require another go build environment. 
Go compiles itself! Neat huh?

As of now the latest version is go1.11.4
```bash
$ export GOROOT_BOOTSTRAP=$GOROOT
$ gvm install go1.11.4
```

```bash
$ go version
go version go1.4 linux/amd64
```
you can run
`gvm use        - select a go version to use (--default to set permanently)`

```shell
$ gvm use go1.11.4 --default
Now using version go1.11.4
$ go version
go version go1.11.4 linux/amd64
$ echo $GOROOT
/home/john/.gvm/gos/go1.11.4
$ echo $GOPATH
/home/john/.gvm/pkgsets/go1.11.4/global
$ ls /home/john/.gvm/gos/go1.11.4
AUTHORS  CONTRIBUTING.md  CONTRIBUTORS  LICENSE  PATENTS  README.md  VERSION  api  bin  doc  favicon.ico  lib  manifest  misc  pkg  robots.txt  src  test
ls $GOPATH
overlay  pkg  src
```

Be sure to set --default so you keep the same version when you relaunch the shell, so that whatever you install stays where you expect it. 

# node js
node.js, the server side javascript framework

nvm is Node Version Manager. Install it like this:
`curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash`


Since there are major revisions to the javascript language between node 4, 6, 8 I've found I've had to switch more often between these versions according to project than I did with other languages.

You can run `nvm ls-remote` and get a list of all the node versions available


```
$ nvm
Example:
  nvm install 8.0.0                     Install a specific version number
  nvm use 8.0                           Use the latest available 8.0.x release
  nvm run 6.10.3 app.js                 Run app.js using node 6.10.3
  nvm exec 4.8.3 node app.js            Run `node app.js` with the PATH pointing to node 4.8.3
  nvm alias default 8.1.0               Set default node version on a shell
  nvm alias default node                Always default to the latest available node version on a shell
```

so if you run 

```bash
$ nvm install 10
Downloading and installing node v10.15.0...
Downloading https://nodejs.org/dist/v10.15.0/node-v10.15.0-linux-x64.tar.gz...
######################################################################## 100.0%
Computing checksum with sha256sum
Checksums matched!
Now using node v10.15.0 (npm v6.4.1)
Creating default alias: default -> 10 (-> v10.15.0)

$ whereis node
node: /home/john/.nvm/versions/node/v10.15.0/bin/node
```

and you can set it to be the default so the setting persists between sessions
```
nvm alias default 10
```



So now you can run:
```shell
$ node -v
v10.15.0
$ npm -v
6.4.1
```


# rust
Rust is another language that sees regular updates. You'll just have to check which is the version for the 2015 and 2018 edition.

```
curl https://sh.rustup.rs -sSf | sh



Current installation options:

   default host triple: x86_64-unknown-linux-gnu
     default toolchain: stable
  modify PATH variable: yes

1) Proceed with installation (default)
2) Customize installation
3) Cancel installation
>

select 1 

To configure your current shell run source $HOME/.cargo/env
```

add `$HOME/.cargo/env` to your path in .bashrc

```shell
$ whereis cargo
cargo: /home/john/.cargo/bin/cargo
$ whereis rustc
cargo: /home/john/.cargo/bin/rustc
```

 