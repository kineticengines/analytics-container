FROM tensorflow/tensorflow:2.6.1-gpu-jupyter
LABEL DavidDexter "dmwangi@kineticengines.co.ke"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y apt  sudo  

RUN groupadd --gid 1000 kineticengines \
    && useradd --uid 1000 --gid kineticengines --shell /bin/bash --create-home kineticengines \
    && echo 'kineticengines ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-kineticengines \
    && echo 'Defaults env_keep += "DEBIAN_FRONTEND"' >> /etc/sudoers.d/env_keep

USER kineticengines

# default working directory
WORKDIR /app 

COPY requirements.txt /app

# install system util packages
RUN sudo apt-get update -q -y && sudo apt-get -q -y install vim software-properties-common apt-utils ca-certificates tzdata --fix-missing && \    
    sudo ln -fs /usr/share/zoneinfo/Africa/Nairobi /etc/localtime && sudo dpkg-reconfigure --frontend noninteractive tzdata && \ 
    sudo apt install -q -y git curl wget httpie libasound2 libglu1-mesa cmake libopenmpi-dev zlib1g-dev build-essential libsndfile1 \
    libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info graphviz --fix-missing

# Define python path
ENV PYTHONPATH  /usr/bin/python
# # Append pythonpath to system paths
ENV PATH=$PATH:$PYTHONPATH
ENV PATH=$PATH:/home/kineticengines/.local/bin

# install deps
RUN python -m pip install --upgrade pip six setuptools cffi wheel cython tk --user
RUN python -m pip install --upgrade -r requirements.txt  --user
