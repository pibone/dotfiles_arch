echo "Your linux kernel"
uname -r

echo "First, update the system"
yaourt -Syyu


# This is for vscode install
# echo "Second, some builds needs to higher the number of files opened. I'll change that"
# echo "$USERNAME 	hard	nofile		20000" >> /etc/security/limits.conf
# echo "$USERNAME		soft	nofile		10000" >> /etc/security/limits.conf
# yaourt -S code --noconfirm

echo "So, you'll need to wait for a long time, sorry for that. I could ask you for some installations, sorry for that"
yaourt -S icu base-devel cmake node-lts-carbon npm linux414-broadcom-wl termite playerctl zathura libmpdclient mpd thunar dex linux414-headers virtualbox-host-dkms ranger morc_menu nitrogen viewnior zsh enchant dunst compton bmenu htop pulseaudio git google-chrome emacs xclip vim vi-vim-symlink powerline-fonts ttf-fira-code ponymix ctags python python-pip python-pygments wakatime pandoc typescript ycmd-git aspell aspell-es aspell-en prettier libpng zlib poppler poppler-glib editorconfig-core-c the_platinum_searcher-bin the_silver_searcher ack sift-bin ledger --noconfirm

sudo npm -g tern

echo "I'll sync your clock, just a little tip."
 timedatectl set-ntp true
 ntpd -qg

 echo "Adding a source to the configured profile in your home .profile"
 echo "source .config/shell/profile" | cat - $HOME/.profile > /tmp/out && mv /tmp/out $HOME/.profile

echo "Now, some links to your home dir and spacemacs"
mkdir -p $HOME/.local/share
ln -s $HOME/.config/shell/env $HOME/.env
ln -s $HOME/.config/shell/env $HOME/.zshenv
ln -s $HOME/.local/share/emacs.d $HOME/.emacs.d
# If there is more than one file in spacemacs.d
ln -s $HOME/.config/spacemacs.d $HOME/.spacemacs.d
ln -s $HOME/.config/spacemacs.d/init.el $HOME/.spacemacs
ln -s $HOME/.config/editorconfig $HOME/.editorconfig

git clone https://github.com/syl20bnr/spacemacs $HOME/.local/share/emacs.d

echo "Enabling services"
systemctl --user enable mpd

echo "Changing your shell to zsh"
chsh -s /usr/bin/zsh $USERNAME

echo "All its done."
echo "Now, reboot and let the magic happen"
