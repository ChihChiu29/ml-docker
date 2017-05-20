# ml-docker
For building chihchiu29/ml-swiss-army-knife image.

The image is meant to be the all-in-one image for ML/DL. It contains commonly used DL tools and engineering tools.

# Quickstart

* To start the docker image, use `run_image.sh`.
* To update the `chihchiu29/ml-swiss-army-knife` image, use `update_image.sh`.
* The `external` folder is mapped to `/workspace/external` in the container.

# Included Tools

## ML/DL

* numpy / scipy / sympy / pandas / matplotlib
* Jupyter (with widget enabled)
* TensorFlow
* scikit
* keras

## Data processing tools

* OpenCV, tesseract
* spacy
* scrapy

## System tools

* jdk
* bazel
* git
* sshd (port 9000, root:toor)
* byobu
* wget, curl
* emacs (nox), ne, nano
* zip
