#!/bin/bash

BASEDIR=$(cd $(/usr/bin/dirname $0); pwd)
IMAGE=vmacs
CHOME=/root

usage() {
    echo "Usage: $0 [OPTIONS] [WORKDIR]"
    echo "  If WORKDIR is not specified, defaults to ~/work."
    echo "Options:"
    echo "  --help      Show this help message and exit."
    echo "  --build     Build the Docker image before running."
    exit 0
}

BUILD=false

while [[ "$1" == --* ]]; do
    case "$1" in
        --help) usage ;;
        --build) BUILD=true ;;
        *) echo "Error: Unknown option: $1" >&2; usage; exit 1 ;;
    esac
    shift
 done

if [ "$#" -gt 1 ]; then
    echo "Error: Too many arguments." >&2
    usage
    exit 1
fi

if [ "$#" -eq 1 ]; then
    WORKDIR="$1"
else
    WORKDIR=~/work
fi

if [ ! -d "$WORKDIR" ]; then
    echo "Error: Work directory '$WORKDIR' does not exist or is not a directory." >&2
    exit 1
fi

WORKDIR=$(cd "$WORKDIR" && pwd)

if [ "$BUILD" = true ]; then
    docker build --target builder -t $IMAGE-builder $BASEDIR
    docker build -t $IMAGE $BASEDIR
fi

docker run -it --rm \
       -v $HOME/.gitconfig:$CHOME/.gitconfig \
       -v $IMAGE-fonts:$CHOME/.local/share/fonts \
       -v $IMAGE-persistent:$CHOME/.emacs.d/persistent \
       -v $WORKDIR:/work \
       -w /work \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -e DISPLAY=$DISPLAY \
       $IMAGE
