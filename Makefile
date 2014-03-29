build:
	hugo
	docker build -t mapitman/pitman.io:latest .
run:
	docker create --name pitman.io mapitman/pitman.io:latest
	docker run --rm -d -p 80:80 --name nginx --volumes-from pitman.io nginx
stop:
	docker stop nginx
	docker rm pitman.io
push:
	docker push mapitman/pitman.io:latest
