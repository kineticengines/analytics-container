<div align="center">
  <img src="https://kineticengines.co.ke/assets/images/logo-dark.png">
  <h1>Kinetic Engines Analytics Container</h1>
</div>


Analytics container is a simple docker image that comes pre-installed with majority of data science and 
ML/Dl packages. 

It's purpose to allow users quickly get working without having to worry about installing required packages in 
their system. All the is needed to **Docker**.

## Included packages

- tensorflow
- neural-structured-learning
- jupyter
- pandas
- scikit-learn
- scikit-image
- datashader
- holoviews
- seaborn
- matplotlib
- pydot
- opencv-python
- pydicom
- larq
- librosa
- python_speech_features
- tqdm
- transformers
- nlp
- keras-tuner
- pytorch
- stable-baselines
- gym
- tf-agent
- tensorforce


While not an exhaustive list of all packages that may be required, it does contain engough to get started. 

The image is updated frequently and can be downloaded from Google cloud registry by running

```sh
docker pull gcr.io/kinetic-engines-247005/kinetic-engines-analytics:latest 
```

## License

[Apache License 2.0](LICENSE)