run:
	docker run --gpus all -it --rm -v $PWD:/app --network=host -u $(id -u):$(id -g) gcr.io/kinetic-engines-247005/kinetic-engines-analytics:<tag>

push:
	gcloud builds submit --timeout=1h



