Useful docker links
	-	https://takacsmark.com/dockerfile-tutorial-by-example-dockerfile-best-practices-2018/
	-	https://gabrieltanner.org/blog/docker-compose/
	-	https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose
	-	5 parts: https://www.massolit-media.com/technical-writing/local-wordpress-development-environment-with-docker/
	-	docker compose: https://www.youtube.com/watch?v=SXwC9fSwct8 

wordpress:
	-	https://make.wordpress.org/cli/handbook/guides/installing/
	-	https://www.digitalocean.com/community/tutorials/php-fpm-nginx

mariadb:
	-	https://mariadb.com/kb/en/creating-a-custom-container-image/
	-	https://severalnines.com/blog/how-deploy-mariadb-server-docker-container/
	
nginx:
	-	find better: https://www.nginx.com/blog/deploying-nginx-nginx-plus-docker/

Virtualbox ubuntu setup:
make user sudo: -> https://askubuntu.com/questions/147241/execute-sudo-without-password
install ssh server -> sudo apt install ssh - might want to change port & disable root login.
start ssh: sudo systemctl start ssh
vm settings: autologin, no password == settings -> system -> users -> automated login: on
vm settings: no standby 	    == settings -> privacy & security -> automated screen lock: off && lock screen on suspend: off
start on startup: cmd + a -> "Startup appliction preferences" -> "add" -> 
	name: start vm
	command: VBoxManage startvm "name of vm" --type separate
	comment: starting vm on startup
virtualbox - vm machine - settings -> networking -> advanced: cable connected: on
virtualbox - vm machine - settings -> networking -> advanced -> port forwarding: 
	host ip: 127.0.0.1 (command on main os: 'ip a') - 
	host port: '3022' 
	guest ip: (command on vm os: 'ip a') take the second one - 
	geust port: the one ssh is listening (default 22)
passwordless ssh: https://medium.com/@ravipatel.it/setting-up-passwordless-ssh-between-a-virtual-machine-ubuntu-and-host-machine-using-virtualbox-70145717153f
Add port forwarding for nginx.
