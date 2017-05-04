FROM tensorflow/tensorflow:latest

MAINTAINER Chih Chiu <chih.chiu.19@gmail.com>

# Update and get aptitude.
RUN apt-get -y update && apt-get install -y aptitude
RUN aptitude upgrade -y 


# System base.
RUN aptitude install -y cmake libgtk2.0-dev pkg-config
RUN aptitude install -y byobu wget psmisc
RUN aptitude install -y emacs-nox nano ne
RUN aptitude install -y git git-completion
RUN aptitude install -y openssh-server


# Python Scientific libraries.
RUN aptitude install -y python-dev python-pip python-numpy python-scipy python-matplotlib python-sympy


# ML/DL libraries.
RUN aptitude install -y python-scikits-learn
RUN pip install keras


# OCR/Opencv
RUN aptitude install -y libavcodec-dev libavformat-dev libswscale-dev
RUN aptitude install -y tesseract-ocr libtesseract-dev libleptonica-dev
RUN pip install pytesseract


# NLP
RUN pip install spacy


# Web scraping
RUN aptitude install -y python-scrapy


# Apt clean up
RUN apt-get -y clean
RUN apt-get -y autoclean


# Get Tensorflow examples.
ADD https://github.com/aymericdamien/TensorFlow-Examples/archive/master.zip /tmp
RUN mkdir -p /workspace/examples
RUN unzip -d /workspace/examples /tmp/master.zip
RUN rm /tmp/master.zip


# Setup SSH Daemon
RUN mkdir /var/run/sshd
RUN echo 'root:toor' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22


# Config/Environment setup.
RUN rm -rf /notebooks
WORKDIR "/workspace"
COPY data/dot_bashrc /root/.bashrc
COPY data/dot_emacs /root/.emacs
RUN jupyter nbextension enable --py widgetsnbextension


# Default command.
CMD ["/run_jupyter.sh", "--allow-root", "--NotebookApp.iopub_data_rate_limit=10000000000"]
