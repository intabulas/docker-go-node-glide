# A Docker file with Go, Dep, Vgo and Node (with npm and yarn)

This is a base image that has the things I need to do backend and frontend development in golang and node. It also includes dep for golang dependency management.

This Dockerfile started before the dep project and most of my older projects are still glide based, which is why both dep and glide are included

NOTE: Now that vgo was accepted as the go-forward for dependency management, we will still include dep even after it becomes part of the official tool chain

Included:

- [Golang 1.10.2](https://golang.org/)
- [NodeJS 10.34.0](https://nodejs.org/en/) - includes NPM 6.1.0
- [Yarn 1.7.0](https://yarnpkg.com/)
- [Dep latest](https://github.com/golang/dep)
- [Vgo latest](https://github.com/golang/vgo)
