SINCE I NO LONGER USE GLIDE THIS REPO IS MIGRATING TO https://hub.docker.com/r/intabulas/go-node-bedrock I WILL KEEP THIS IN SYNC FOR A WHILE

# A Docker file with Go, Dep, Vgo and Node (with npm and yarn)

This is a base image that has the things I need to do backend and frontend development in golang and node. It also includes dep for golang dependency management.

This Dockerfile started before the dep project and most of my older projects are still glide based, which is why both dep and glide are included

NOTE: Now that vgo was accepted as the go-forward for dependency management, we will still include dep even after it becomes part of the official tool chain

NOTE: Added gorelease to the base image since myself and alot of others rely on it for releasing

NOTE: I dropped vgo from this build as experimental support was merged into go1.11

Included:

- [Golang 1.11.2](https://golang.org/)
- [NodeJS 11.1.0](https://nodejs.org/en/) - includes NPM 6.4.1
- [Yarn 1.12.1](https://yarnpkg.com/)
- [Dep latest](https://github.com/golang/dep)
- [GoReleaser latest](https://goreleaser.com/)
