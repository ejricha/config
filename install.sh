#!/bin/bash

# Install the following packages
PACKAGES="git tmux zsh ssh rsync curl htop"
DIR=`dirname $(realpath $0)`
DATETIME=`date +%Y-%m-%d_%H%M%S`
DIR_ZSH="$HOME/.oh-my-zsh"
DIR_ZSH_PLUGINS="$DIR_ZSH/custom/plugins"
DIR_TMUX="$HOME/.tmux"
DIR_TMUX_TPM="$HOME/.tmux/plugins/tpm"
DIR_NVIM_CONFIG="$HOME/.config/nvim"

# Main function
main() {
  install_packages
  fix_all_links
}

# Install packages
install_packages() {
  echo "[Install packages with apt]"
  echo "  ($PACKAGES)"
  sudo apt install $PACKAGES
  echo

   
  echo "[Install kitty]"
  install_kitty
  echo

  echo "[Install neovim]"
  install_neovim
  echo

  echo "[Clone a few git repos]"
  clone_repo https://github.com/robbyrussell/oh-my-zsh.git $DIR_ZSH
  clone_repo https://github.com/zsh-users/zsh-syntax-highlighting.git $DIR_ZSH_PLUGINS/zsh-syntax-highlighting
  clone_repo https://github.com/Aloxaf/fzf-tab $DIR_ZSH_PLUGINS/fzf-tab
  clone_repo https://github.com/tmux-plugins/tpm $DIR_TMUX_TPM

  echo
}

install_kitty() {
  # Check the current version
  app="$HOME/.local/kitty.app/bin/kitty"
  version=`$app -v 2>/dev/null | grep -oE "[0-9\.]+"`
  echo "version is $version"
  if [[ $version =~ "0.43." ]]
  then
    echo "great, already installed"
    return
  fi

  # Only update if we need to
  echo "too old, need to update"
  installer="https://sw.kovidgoyal.net/kitty/installer.sh"
  curl -L $installer | sh /dev/stdin
  sudo ln -sf $app /usr/local/bin/
}

install_neovim() {
  # Check the current version
  target="nvim-linux-x86_64"
  app="/opt/$target/bin/nvim"
  version=`$app -v | head -n1 | grep -Eo "[0-9\.]+"`
  echo "version is $version"
  if [[ $version =~ "0.11." ]]
  then
    echo "great, already installed"
    return
  fi

  # Only update if we need to
  echo "too old, need to update"
  tmp=`mktemp -d`
  cd $tmp
  installer="https://github.com/neovim/neovim/releases/latest/download/${target}.tar.gz"
  curl -LO $installer
  sudo rm -rf /opt/$target
  sudo tar -C /opt -xzf ${target}.tar.gz
  cd -
  rm -rf $tmp
  sudo ln -sf $app /usr/local/bin/
  sudo ln -sf $app /etc/alternatives/vim
  sudo ln -sf $app /etc/alternatives/vi
}

# Fix all links on the system
fix_all_links() {
  echo "[git]"
  create_link $DIR/git/.gitconfig $HOME/
  create_link $DIR/git/.gitexclude $HOME/
  echo

  echo "[zsh]"
  create_link $DIR/zsh/.zshrc $HOME/
  create_link $DIR/zsh/.zsh_aliases $HOME/
  create_link $DIR/zsh/.oh_my_zsh/custom/themes/gavin.zsh-theme $DIR_ZSH/custom/themes/
  create_link $DIR/zsh/.oh_my_zsh/custom/themes/eric.zsh-theme $DIR_ZSH/custom/themes/
  echo

  echo "[tmux]"
  create_link $DIR/tmux/.tmux.conf $HOME/
  echo

  echo "[nvim]"
  create_link $DIR/nvim/ $DIR_NVIM_CONFIG/
  echo
}

# Check a single link, and back it up and fix it if it is not correct
create_link() {
  to=$1
  dir_from=${2%/}
  f=`basename $to`
  from=$dir_from/$f

  # Check to see if we need to create the link
  if [[ -h "$from" ]] # Link
  then
    if [[ `readlink "$from"` == $to ]]
    then
      echo "  \"$from\" is already up-to-date"
      return
    fi
    backup_file $from
  elif [[ -f "$from" ]] # Regular file
  then
    backup_file $from
  fi

  if [[ -e "$from" ]] # Unknown file type
  then
    echo "  \"$from\" exists still!"
    return
  fi

  # Make the link
  mkdir -p $dir_from/
  ln -s $to $dir_from/
  if [[ -h "$from" && `readlink "$from"` == $to ]]
  then
    echo "  \"$from\" linked to $to"
  else
    echo "  \"$from\" FAILED TO LINK TO $to"
  fi
}

# Back up a given file
backup_file() {
  from=$1
  backup=$from.$DATETIME.bak
  echo "  \"$backup\" backup created"
  mv $from $backup
}

# Clone a given repo
clone_repo() {
  repo=$1
  local=$2
  echo "($repo in $local)"
  if [[ -d "$local" ]]
  then
    (cd $local && git pull)
  else
    echo git clone $repo $local
    git clone $repo $local
  fi
}

# Actually call the main function
main
