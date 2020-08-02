FROM tensorflow/tensorflow:nightly-gpu
LABEL DavidDexter "dmwangi@kineticengines.co.ke"
ENV DEBIAN_FRONTEND noninteractive

# default working directory
WORKDIR /app 

# install system util packages
RUN apt-get update -y && apt-get -y install vim software-properties-common apt-utils ca-certificates tzdata --fix-missing && \    
    ln -fs /usr/share/zoneinfo/Africa/Nairobi /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata && \ 
    apt install -y git curl httpie libasound2 libglu1-mesa cmake libopenmpi-dev zlib1g-dev build-essential libsndfile1 python3-dev \
    python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev \
    shared-mime-info python3-tk graphviz --fix-missing

# make python default by aliasing 
RUN echo alias python=python3 >> ~/.bashrc

# Define python path
ENV PYTHONPATH  /usr/bin/python 

# # Append pythonpath to system paths
ENV PATH=$PATH:$PYTHONPATH

# update pip
RUN python3 -m pip install --upgrade pip setuptools && pip3 install --upgrade pip

COPY . /app

RUN pip3 install -r requirements.txt

# Fix https://github.com/pytorch/pytorch/issues/22676 by reinstall tensorboard
RUN pip3 uninstall tb-nightly tensorboardX tensorboard
RUN pip3 install tensorboard