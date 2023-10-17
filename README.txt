list of all images on your system.
	docker image ls

Current containers that are running
	docker container ls

containers that ran
	docker container ls -a
	
to verify that the service is running:
	docker service ps devtest-service 

You can remove the service to stop the running tasks:
	docker service rm devtest-service

So now, to build the stack, go back to the terminal window, 
make sure you’re in your build directory, and issue the command:
	docker-compose up

If you want to run them in detached mode, you’d issue the command:
	docker-compose up -d

Note: We used the --force parameter to remove the running 
container without shutting it down. 
This will ungracefully shutdown the container and permanently 
remove it from the Docker host.
	docker container rm --force linux_tweet_app

In a production environment you may want to use "docker container stop" 
to gracefully stop the container and leave it on the host. 
You can then use "docker container rm" to permanently remove it.

https://www.techrepublic.com/article/how-to-build-a-docker-compose-file/
https://www.linode.com/docs/guides/how-to-use-docker-compose/
https://docs.docker.com/compose/environment-variables/env-file/
https://github.com/docker/awesome-compose/blob/master/official-documentation-samples/wordpress/README.md
https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose#step-3-definin
https://www.baeldung.com/linux/nginx-docker-container
https://www.nginx.com/blog/deploying-nginx-nginx-plus-docker/
https://github.com/karthequian/docker-helloworld/blob/master/Dockerfile
https://training.play-with-docker.com/beginner-linux/