# Nginx sidecar for DigitalOcean App Platform

[![GitHub license](https://img.shields.io/github/license/cheqd/nginx?color=blue&style=flat-square)](https://github.com/cheqd/nginx/blob/main/LICENSE) [![GitHub contributors](https://img.shields.io/github/contributors/cheqd/nginx?label=contributors%20%E2%9D%A4%EF%B8%8F&style=flat-square)](https://github.com/cheqd/nginx/graphs/contributors)

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/cheqd/nginx/dispatch.yml?label=workflows&style=flat-square)](https://github.com/cheqd/nginx/actions/workflows/dispatch.yml) ![GitHub repo size](https://img.shields.io/github/repo-size/cheqd/nginx?style=flat-square)

## ℹ️ Overview

A custom Nginx sidecar image for use on [DigitalOcean App Platform](https://docs.digitalocean.com/products/app-platform/). It is intended as a common base image that could then be modified to work across a variety of different deployments.

## 🧑‍💻 Developer Guide

Build the Docker image using:

```bash
docker build --target runner . -t nginx:local
```

`runner` is the build target stage.

The start script is set to `entrypoint.sh`. In this instance, it's optimised for working with [LogTo](https://docs.logto.io/docs/tutorials/get-started/).

## 💬 Community

The [**cheqd Community Slack**](http://cheqd.link/join-cheqd-slack) is our primary chat channel for the open-source community, software developers, and node operators.

Please reach out to us there for discussions, help, and feedback on the project.

## 🙋 Find us elsewhere

[![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge\&logo=telegram\&logoColor=white)](https://t.me/cheqd) [![Discord](https://img.shields.io/badge/Discord-7289DA?style=for-the-badge\&logo=discord\&logoColor=white)](http://cheqd.link/discord-github) [![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge\&logo=twitter\&logoColor=white)](https://twitter.com/intent/follow?screen\_name=cheqd\_io) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge\&logo=linkedin\&logoColor=white)](http://cheqd.link/linkedin) [![Slack](https://img.shields.io/badge/Slack-4A154B?style=for-the-badge\&logo=slack\&logoColor=white)](http://cheqd.link/join-cheqd-slack) [![Medium](https://img.shields.io/badge/Medium-12100E?style=for-the-badge\&logo=medium\&logoColor=white)](https://blog.cheqd.io) [![YouTube](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge\&logo=youtube\&logoColor=white)](https://www.youtube.com/channel/UCBUGvvH6t3BAYo5u41hJPzw/)
