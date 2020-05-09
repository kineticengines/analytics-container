run:
	docker run -it --rm -v $PWD:/app --network=host gcr.io/kinetic-engines-247005/kinetic-engines-analytics

push:
	gcloud builds submit --timeout=1800

