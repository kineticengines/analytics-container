build:
	docker build --force-rm -t kinetic-engines-analytics:latest .

app-run:build
	docker rm -f phoenix-analytics
	docker run -d -p 5555:8000 --name phoenix-analytics --restart unless-stopped kinetic-engines-analytics:latest

run-local:
	docker run -it --rm -v $PWD:/app --network=host kinetic-engines-analytics

push:build
	docker tag kinetic-engines-analytics:latest gcr.io/kinetic-engines-247005/kinetic-engines-analytics:latest
	docker push gcr.io/kinetic-engines-247005/kinetic-engines-analytics:latest
	

