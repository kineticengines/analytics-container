build:
	docker build -t europe-west1-docker.pkg.dev/kinetic-engines-247005/kng/kinetic-engines-analytics:23.10.04 .

run:
	docker run -d -it --gpus all -v $PWD:/home/kineticengines/app -w /home/kineticengines/app --restart=always --network=host -u $(id -u):$(id -g) europe-west1-docker.pkg.dev/kinetic-engines-247005/kng/kinetic-engines-analytics:23.10.04

push:
	gcloud builds submit --timeout=1h
