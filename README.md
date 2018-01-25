A Docker file with Go, Dep and Node
==========================================

This is a base image that has the things I need to do backend and frontend development in golang and node. It also includes dep for golang dependency management.

This Dockerfile started before the dep project and most of my older projects are still glide based, which is why both dep and glide are included

Included:
* [Golang 1.9.3](https://golang.org/)
* [NodeJS 9.4.0](https://nodejs.org/en/) - includes NPM 5.5.1
* [Yarn 1.3.2](https://yarnpkg.com/)
* [Dep latest](https://github.com/golang/dep)

