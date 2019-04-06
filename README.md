SINCE I NO LONGER USE GLIDE THIS REPO IS MIGRATING TO https://hub.docker.com/r/intabulas/go-node-bedrock I WILL KEEP THIS IN SYNC FOR A WHILE

NOTE: I will stop syncing things from [bedrock](https://hub.docker.com/r/intabulas/go-node-bedrock) on April 8th

# A Docker file with Go, Dep, Vgo and Node (with npm and yarn)

This is a base image that has the things I need to do backend and frontend development in golang and node. It also includes dep for golang dependency management.

This Dockerfile started before the dep project and most of my older projects are still glide based, which is why both dep and glide are included

NOTE: Now that vgo was accepted as the go-forward for dependency management, we will still include dep even after it becomes part of the official tool chain

NOTE: I dropped vgo from this build as experimental support was merged into go1.11

Included:

- [Golang 1.12.2](https://golang.org/)
- [NodeJS 11.13.0](https://nodejs.org/en/) - includes NPM 6.7.0
- [Yarn 1.15.2](https://yarnpkg.com/)
- [Dep latest](https://github.com/golang/dep)
- [Packr latest 1.x](https://github.com/gobuffalo/packr)
