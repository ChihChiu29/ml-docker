FROM tensorflow/tensorflow:latest

MAINTAINER Chih Chiu <chih.chiu.19@gmail.com>

# Update and get aptitude.
RUN apt-get -y update && apt-get install -y aptitude


# System base.
RUN aptitude install -y cmake libgtk2.0-dev pkg-config
RUN aptitude install -y byobu emacs-nox
RUN aptitude install -y git git-completion


# Python Scientific libraries.
RUN aptitude install -y python-dev python-pip python-numpy python-scipy python-matplotlib python-sympy


# ML/DL libraries.
RUN aptitude install -y python-scikits-learn
RUN pip install keras


# OCR/Opencv
RUN aptitude install -y libavcodec-dev libavformat-dev libswscale-dev
RUN aptitude install -y tesseract-ocr libtesseract-dev libleptonica-dev
RUN pip install pytesseract



# Get Tensorflow examples.
RUN cd /workspace
RUN git clone https://github.com/aymericdamien/TensorFlow-Examples.git


# Config/Environment setup.
RUN rm -rf /notebooks
WORKDIR "/workspace"
COPY dot_emacs /root/.emacs


# Default command.
CMD ["/run_jupyter.sh"]
