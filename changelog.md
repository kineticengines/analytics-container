
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