A Dockerfile with Go, Glide and Node Dockerfile
===============================================

This is a base image that has the things I need to do backend and frontend development in golang and node. It also includes Glide for golang dependancy management.

Included:
* GOLANG 1.7.1 and Glide 0.12.3
* NodeJS 6.8.1

NOTE: This uses *FROM* golang:171 which is based on Ubuntu 8.x (wheezy). Its meant for dev only. An alpine container should be used when running production golang apps..  Python is still TBD
NOTE: This dockerfile also does an apt-get update to resolve some vulnerabilities in the tagged version of wheezy that golang:1.7.1 is build with
