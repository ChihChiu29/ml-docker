FROM tensorflow/tensorflow:latest
RUN apt-get -y update && apt-get install -y aptitude
RUN aptitude install -y emacs-nox python-scikits-learn
CMD /run_jupyter.sh
