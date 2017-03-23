FROM tensorflow/tensorflow:latest

MAINTAINER Chih Chiu <chih.chiu.19@gmail.com>

RUN apt-get -y update && apt-get install -y aptitude
RUN aptitude install -y emacs-nox python-scikits-learn

RUN rm -rf /notebooks
WORKDIR "/workspace"

COPY dot_emacs /root/.emacs

CMD ["/run_jupyter.sh"]
