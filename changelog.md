# 21.04.26

- restore `docker builder` from `kaniko`

# 21.04.25

- add sci-spacy and spacy
- remove `RUN python3.8 -m pip install -U https://github.com/PythonOT/POT/archive/master.zip -- user`

# 21.02.07.2

- correctly install python3.8 dependencies

# 21.02.07

- remove `tf-models-nightly`. This will significantly reduce the image size
- default to python3.8

# 21.02.06

- add tensorflow-hub, tensorflow-text, tensorflow-addons, datashader, holoviews
- change base to `tensorflow/tensorflow:2.4.1-gpu`

# 21.01.17

- add POT https://github.com/PythonOT/POT
- change base to tf-nightly-gpu

# 20.12.25

- remove `t5` package introduced in version `20.11.12`. With this change, the image size should reduce significantly.
  If there is a need to restore it in the future, include the following line in the Dockerfile

  ```Dockerfile
    RUN python3 -m pip install git+https://github.com/kineticengines/text-to-text-transfer-transformer.git@mirror-main --use-feature=2020-resolver --user
  ```

- change base image from `2.4.0rc0-gpu` to the stable release`2.4.0-gpu`

# 20.11.22

- change base from `tf-nightly-gpu` to `2.4.0rc0-gpu`

- introduce [t5](https://pypi.org/project/t5/) package for text-to-text model experiments.
  t5 install torch. this may cause conflicts in tensorboard installation. restore fix from
  previous commit <920c5a71158bb310394a0cef197433067612f566>

- remove java/spark comments in Dockerfile.
  in the future is these packages are needed agains, add the following line in the dockerfile'

  ```Dockerfile
  RUN apt-get update -q -y && apt-get -q -y install openjdk-11-jdk && echo "JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" | tee -a /etc/environment && \
      source /etc/environment

  ENV SPARK_HOME=/opt/spark
  # # Append spark pato to system paths
  ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

  RUN curl https://downloads.apache.org/spark/spark-3.0.1/spark-3.0.1-bin-hadoop3.2.tgz > spark-3.0.1-bin-hadoop3.2.tgz && \
    tar -xzf spark-3.0.1-bin-hadoop3.2.tgz && mv spark-3.0.1-bin-hadoop3.2 spark && mv spark /opt/
  ```

# 20.11.15

- introduce docker best practises;
- deprecate `latest` tag
- deploy using calver for tagging new images
- add `kineticengines` as default container user
