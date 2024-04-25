FROM ubuntu:20.04

RUN apt-get update && apt-get install -y openssh-server vim

RUN mkdir /var/run/sshd

RUN echo "root:123" | chpasswd

RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
# RUN echo 'AuthenticationMethods password publickey' >> /etc/ssh/sshd_config
RUN echo 'ChallengeResponseAuthentication no' >> /etc/ssh/sshd_config
# RUN echo 'KbdInteractiveAuthentication no' >> /etc/ssh/sshd_config
# RUN echo 'AuthorizedKeysFile	.ssh/authorized_keys' >> /etc/ssh/sshd_config
RUN echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-f", "/etc/ssh/sshd_config", "-D"]
