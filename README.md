A Docker file with Go, Glide, Dep and Node
==========================================

This is a base image that has the things I need to do backend and frontend development in golang and node. It also includes Glide for golang dependency management.

This Dockerfile started before the dep project and most of my older projects are still glide based, which is why both dep and glide are included

Included:
* [Golang 1.9.0](https://golang.org/)
* [Glide 0.12.3](https://github.com/Masterminds/glide)
* [NodeJS 8.6.0](https://nodejs.org/en/)
* [Yarn 1.1.0](https://yarnpkg.com/)
* [Dep latest](https://github.com/golang/dep)

Glide Plugins:
* [Glide Report](https://github.com/Masterminds/glide-report)
* [Glide-VC](https://github.com/sgotti/glide-vc)
* [Glide Cleanup](https://github.com/ngdinhtoan/glide-cleanup)


