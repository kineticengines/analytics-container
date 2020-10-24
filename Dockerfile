FROM tensorflow/tensorflow:nightly-gpu
LABEL DavidDexter "dmwangi@kineticengines.co.ke"
ENV DEBIAN_FRONTEND noninteractive

# default working directory
WORKDIR /app 

# install system util packages
RUN apt-get update -q -y && apt-get -q -y install vim software-properties-common apt-utils ca-certificates tzdata --fix-missing && \    
    ln -fs /usr/share/zoneinfo/Africa/Nairobi /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata && \ 
    apt install -q -y git curl httpie libasound2 libglu1-mesa cmake libopenmpi-dev zlib1g-dev build-essential libsndfile1 python3-dev \
    python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev \
    shared-mime-info python3-tk graphviz --fix-missing

# RUN apt-get update -q -y && apt-get -q -y install openjdk-11-jdk && \
#     echo "JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" | tee -a /etc/environment && \
#     source /etc/environment 

# make python default by aliasing 
RUN echo alias python=python3 >> ~/.bashrc

# Define python path
ENV PYTHONPATH  /usr/bin/python 
# # Append pythonpath to system paths
ENV PATH=$PATH:$PYTHONPATH


# ENV SPARK_HOME=/opt/spark
# # # Append spark pato to system paths
# ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

# update pip
RUN python3 -m pip install -q --upgrade pip setuptools && pip3 install --upgrade pip

COPY . /app

# RUN curl https://downloads.apache.org/spark/spark-3.0.1/spark-3.0.1-bin-hadoop3.2.tgz > spark-3.0.1-bin-hadoop3.2.tgz && \
#     tar -xzf spark-3.0.1-bin-hadoop3.2.tgz && mv spark-3.0.1-bin-hadoop3.2 spark && mv spark /opt/


RUN pip3 install -q -r requirements.txt --use-feature=2020-resolver