build:
	docker build -t gcr.io/kinetic-engines-247005/kinetic-engines-analytics:02.06.23 .

run:
	docker run --gpus all -it --rm -v $PWD:/app --network=host -u $(id -u):$(id -g) gcr.io/kinetic-engines-247005/kinetic-engines-analytics:02.06.23

push:
	gcloud builds submit --timeout=1h
