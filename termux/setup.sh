if [ "$(pwd)" -ef /root ]; then
    pacman -Syu
    pacman -S fish

    command -v fish | tee -a /etc/shells

    chsh -s "$(command -v fish)"

    exec "$(command -v fish)"
else
    pkg upgrade

    printf "" >~/../usr/etc/motd

    pkg install proot-distro

    pd add archlinux

    echo "pd sh archlinux" >>~/.bashrc

    exec "$(command -v bash)"
fi
