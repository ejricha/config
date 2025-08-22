#!/bin/bash

# Install the following packages
PACKAGES="git zsh tmux neovim ssh rsync curl htop"
DIR=`dirname $(realpath $0)`
DATETIME=`date +%Y-%m-%d_%H%M%S`

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

  echo "[Clone a few git repos]"
  clone_repo https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  clone_repo https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  clone_repo https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo
}

# Fix all links on the system
fix_all_links() {
  echo "[git]"
  create_link $DIR/git/.gitconfig ~/
  create_link $DIR/git/.gitexclude ~/
  echo

  echo "[zsh]"
  create_link $DIR/zsh/.zshrc ~/
  create_link $DIR/zsh/.zsh_aliases ~/
  create_link $DIR/zsh/.oh_my_zsh/custom/themes/* ~/.oh-my-zsh/custom/themes/
  echo

  echo "[tmux]"
  create_link $DIR/tmux/.tmux.conf ~/
  echo

  echo "[nvim]"
  mkdir -p ~/.config/nvim/
  create_link $DIR/nvim/ ~/.config/nvim
  echo
}

# Check a single link, and back it up and fix it if it is not correct
create_link() {
  to=$1
  d=${2%/}
  f=`basename $to`
  from=$d/$f

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
  ln -s $to $d/
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
  to=$1
  from=$2
  echo "  ($from to $to)"
  if [[ -d "$from" ]]
  then
    (cd $from && git pull)
  else
    echo git clone $to $from
    git clone $to $from
  fi
}

# Actually call the main function
main
