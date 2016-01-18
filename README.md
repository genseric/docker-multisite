# docker-multisite with nginx
a basic tutorial on how to use docker with multiple domains on the same server, using proxy_pass

- install docker on host ( /root/docker/base presumed )
- navigate to Dockerfile folder
- build the image
docker build -t baseng . 
- run the first instance , we map the 80 to 80
docker run --name ng1 -it -d -p 80:80 -v /root/docker/base/conf/sites-enabled:/etc/nginx/sites-enabled baseng
- run the second and the third instance 
docker run --name ng2 -d -p 83:80 baseng
docker run --name ng3 -d -p 84:80 baseng
- change the content of the index files on hosts, 
docker exec -it ng2 /bin/bashdocker exec -it ng2 /bin/bash
under the instance make the changes
vi /var/www/html/index.nginx-debian.html

same for ng3.


now change your hosts file to point the a1 and a2.com to the docker host server.

