FROM tensorflow/tensorflow:latest-gpu 
LABEL DavidDexter "dmwangi@kineticengines.co.ke"
ENV DEBIAN_FRONTEND noninteractive

# default working directory
WORKDIR /app 

# install system util packages
RUN apt-get update -y && apt-get -y install software-properties-common --fix-missing && apt-get -y install apt-utils --fix-missing && \
    apt install -y vim && apt-get install -y ca-certificates && \
    apt-get install -y tzdata --fix-missing && ln -fs /usr/share/zoneinfo/Africa/Nairobi /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \ 
    apt install -y htop tmux git curl httpie libasound2 libglu1-mesa --fix-missing

RUN apt-get -y update && apt-get install -y build-essential cmake httpie libsndfile1 python3-dev \ 
    python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 \ 
    libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info python3-tk graphviz
    
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

# install pyttorch
RUN pip3 install torch==1.5.0+cu101 torchvision==0.6.0+cu101 -f https://download.pytorch.org/whl/torch_stable.html