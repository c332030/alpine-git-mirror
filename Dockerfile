FROM c332030/alpine-git-ssh

ADD *.sh /

RUN ["chmod", "+x", "/mirror.sh"]
RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
