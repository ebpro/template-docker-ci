#!/bin/bash
docker run -it --rm brunoe/${PWD##*/}:$(git rev-parse --abbrev-ref HEAD)
