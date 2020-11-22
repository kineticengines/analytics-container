
# 20.11.22

- introduce [t5](https://pypi.org/project/t5/) package for text-to-text model experiments. 
  t5 install torch. this may cause conflicts in tensorboard installation. restore fix from
  previous commit <920c5a71158bb310394a0cef197433067612f566>


# 20.11.15

- introduce docker best practises;
   - deprecate `latest` tag 
   - deploy using calver for tagging new images
   - add `kineticengines` as default container user