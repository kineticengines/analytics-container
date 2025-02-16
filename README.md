<div align="center">
  <img src="https://kineticengines.co.ke/assets/images/logo-dark.png">
  <h1>Kinetic Engines Analytics Container</h1>
</div>

Analytics container is a simple docker image that comes pre-installed with majority of data science and
ML/Dl packages.

It's purpose to allow users quickly get working without having to worry about installing required packages in
their system. All the is needed to **Docker**.

## Pulling

The image is updated frequently and can be downloaded from Google cloud registry by running

```sh
docker pull gcr.io/kinetic-engines-247005/kinetic-engines-analytics:<tag>
```

## Running locally

```sh
docker run --gpus all -it --rm -v $PWD:/app --network=host -u $(id -u):$(id -g) gcr.io/kinetic-engines-247005/kinetic-engines-analytics:<tag>
```

## Docker GPU support

- https://www.tensorflow.org/install/docker
- https://github.com/NVIDIA/nvidia-container-toolkit
- https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
- https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

## Install CUDA

- https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
- https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_local

## License

[Apache License 2.0](LICENSE)
