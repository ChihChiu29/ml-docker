FROM tensorflow/tensorflow:latest

MAINTAINER Chih Chiu <chih.chiu.19@gmail.com>

# Update and get aptitude.
RUN apt-get -y update && apt-get install -y aptitude

# ML/DL libraries.
RUN aptitude install -y python-scikits-learn
RUN pip install keras

# Engineering tools.
RUN aptitude install -y git git-completion byobu emacs-nox

# Config/Environment setup.
RUN rm -rf /notebooks
WORKDIR "/workspace"
COPY dot_emacs /root/.emacs

# Default command.
CMD ["/run_jupyter.sh"]
