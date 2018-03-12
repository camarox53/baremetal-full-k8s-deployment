FROM centos:7
ENV container docker
# Setup systemd stffs
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]

# Install packages
RUN yum update -y
RUN yum install -y epel-release openssh-server libselinux-python htop wget vim bind-utils net-tools nmap

# Put keys in place
RUN mkdir /root/.ssh
WORKDIR /root/.ssh
RUN curl https://launchpad.net/~cumorris/+sshkeys > authorized_keys; echo "" >> authorized_keys
RUN curl https://launchpad.net/~bmp0015/+sshkeys >> authorized_keys; echo "" >> authorized_keys
RUN curl https://launchpad.net/~mapetik/+sshkeys >> authorized_keys; echo "" >> authorized_keys
RUN curl https://launchpad.net/~kro/+sshkeys >> authorized_keys

# Enable sshd
RUN systemctl enable sshd

CMD ["/usr/sbin/init"]
