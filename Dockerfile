FROM phusion/passenger-ruby21:latest

ENV HOME /root

CMD ["/sbin/my_init"]

RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default

ADD config/passenger.conf /etc/nginx/sites-enabled/app.conf
ADD config/nginx_docker_env.conf /etc/nginx/main.d/docker_env.conf

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*