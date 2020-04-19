run:
	docker run -it --rm -v $PWD:/app --network=host kinetic-engines-analytics

push:
	gcloud builds submit --timeout=1800

