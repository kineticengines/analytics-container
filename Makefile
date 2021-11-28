run:
	docker run --gpus all -it --rm -v $PWD:/app --network=host -u $(id -u):$(id -g) gcr.io/kinetic-engines-247005/kinetic-engines-analytics:21.11.28

push:
	gcloud builds submit --timeout=1h



