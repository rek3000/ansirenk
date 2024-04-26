FROM archlinux:base
RUN pacman -Sy ansible-core --noconfirm
RUN pacman -S openssh sshpass --noconfirm
RUN pacman -Scc --noconfirm
COPY ./*.yml /root/.
COPY ../entrypoint-master.sh /root/.
RUN chmod +x /root/entrypoint-master.sh
RUN ansible-config init --disabled > .ansible.cfg
RUN ssh-keygen -t rsa -b 4069 -N "" -f ~/.ssh/master

WORKDIR /root/
ENTRYPOINT ["./entrypoint-master.sh"]
