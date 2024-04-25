FROM archlinux:base
RUN pacman -Sy ansible-core --noconfirm
RUN pacman -S openssh sshpass --noconfirm
RUN pacman -Scc --noconfirm
COPY ./inventory.yml .
COPY ../entrypoint-master.sh .
RUN chmod +x /entrypoint-master.sh
RUN ansible-config init --disabled > .ansible.cfg
RUN ssh-keygen -t rsa -b 4069 -N "" -f ~/.ssh/master

ENTRYPOINT ["./entrypoint-master.sh"]
