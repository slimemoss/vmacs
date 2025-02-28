CURDIR=$(cd $(dirname $0);pwd)
if [ "$#" -ne 1 ]; then
    WORKDIR=$(cd ~/work && pwd)
else
    WORKDIR=$(cd "$1" && pwd)
fi
BASEDIR=$(cd $(/usr/bin/dirname $0); pwd)
IMAGE=vmacs
CHOME=/root

docker build --target builder -t $IMAGE-builder $BASEDIR
docker build -t $IMAGE $BASEDIR

docker run -it --rm \
       -v $HOME/.gitconfig:$CHOME/.gitconfig \
       -v $IMAGE-fonts:$CHOME/.local/share/fonts \
       -v $IMAGE-persistent:$CHOME/.emacs.d/persistent \
       -v $WORKDIR:/work \
       -w /work \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -e DISPLAY=$DISPLAY \
       $IMAGE
