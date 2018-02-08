A Docker file with Go, Dep and Node
==========================================

This is a base image that has the things I need to do backend and frontend development in golang and node. It also includes dep for golang dependency management.

This Dockerfile started before the dep project and most of my older projects are still glide based, which is why both dep and glide are included

NOTE: Dep 0.4.1 was released 1/24/18, we always pull master so...
NOTE: Glide has been removed since Dep is becoming stable

Included:
* [Golang 1.9.4](https://golang.org/)
* [NodeJS 9.5.0](https://nodejs.org/en/) - includes NPM 5.6.0
* [Yarn 1.3.2](https://yarnpkg.com/)
* [Dep latest](https://github.com/golang/dep)

