FROM tensorflow/tensorflow:2.4.1-gpu 
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
    libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info graphviz --fix-missing && \
    sudo add-apt-repository ppa:deadsnakes/ppa && sudo apt-get update && sudo apt-get install -y python3.8 && ls /usr/bin/python3* && \
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1 && \
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 2 && \
    sudo apt-get install -y python3.8-distutils && python3.8 -m pip install --upgrade pip six setuptools cffi wheel cython tk --user

# make python default by aliasing 
RUN echo alias python=python3.8 >> ~/.bashrc && echo "alias pip='python3.8 -m pip'" | tee -a ~/.bashrc

# Define python path
ENV PYTHONPATH  /usr/bin/python
# # Append pythonpath to system paths
ENV PATH=$PATH:$PYTHONPATH
ENV PATH=$PATH:/home/kineticengines/.local/bin

# install deps
RUN python3.8 -m pip install --upgrade -r requirements.txt  --user

RUN python3.8 -m pip install -U https://github.com/PythonOT/POT/archive/master.zip -- user
