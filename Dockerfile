FROM manjarolinux/base

# Create user
RUN useradd -r -m -p $(openssl passwd -6 -salt makjr 123456) -U -u 1000 makelarisjr
RUN pacman -Sy sudo --noconfirm && echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
RUN usermod -aG wheel makelarisjr

USER makelarisjr
WORKDIR /home/makelarisjr

COPY --chown=makelarisjr . /home/makelarisjr/delta-manjaro

CMD [ "/bin/bash" ]