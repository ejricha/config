#!/bin/bash

# Install the following packages
PACKAGES="ssh curl zsh tmux neovim"
DIR=`dirname $(realpath $0)`
DATETIME=`date +%Y-%m-%d_%H%M%S`

# Main function
main()
{
	install_packages
	fix_all_links
}

# Install packages
install_packages()
{
	# Install with apt
	sudo apt install $PACKAGES
	
	# Clone a few git repos
	clone_repo https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	clone_repo https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

	# Install the junegunn/vim-plug plugin manager for vim and nvim
	for PLUG in ~/.vim/autoload/plug.vim ~/.local/share/nvim/site/autoload/plug.vim
	do
		if [[ ! -e $PLUG ]]
		then
			curl -fLo $PLUG --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		else
			echo "[$PLUG] already exists"
		fi
	done
}

# Fix all links on the system
fix_all_links()
{
	# git
	create_link $DIR/.gitconfig ~/
	
	# zsh
	create_link $DIR/.zshrc ~/
	create_link $DIR/.zsh_aliases ~/
	create_link $DIR/.oh_my_zsh/custom/themes/* ~/.oh-my-zsh/custom/themes/

	# tmux
	create_link $DIR/.tmux.conf ~/
	
	# nvim
	mkdir -p ~/.config/nvim/
	create_link $DIR/init.vim ~/.config/nvim/
	create_link $DIR/.vimrc ~/
	create_link $DIR/.vimrc.colors ~/
	create_link $DIR/.vimrc.normal ~/
	create_link $DIR/.vimrc.plugged ~/

	# most
	create_link $DIR/.mostrc ~/
}

# Check a single link, and back it up and fix it
#  if it is not correct
create_link()
{
	TO=$1
	D=${2%/}
	F=`basename $TO`
	FROM=$D/$F
	
	# Check to see if we need to create the link
	if [[ -h "$FROM" ]] # Link
	then
		if [[ `readlink "$FROM"` == $TO ]]
		then
			echo "[$FROM] is already up-to-date"
			return
		fi
		backup_file $FROM
	elif [[ -f "$FROM" ]] # Regular file
	then
		backup_file $FROM
	fi

	if [[ -e "$FROM" ]] # Unknown file type
	then
		echo "[$FROM] exists still!"
		return
	fi
	
	# Make the link
	ln -s $TO $D/
	if [[ -h "$FROM" && `readlink "$FROM"` == $TO ]]
	then
		echo "[$FROM] linked to $TO"
	else
		echo "[$FROM] FAILED TO LINK TO $TO"
	fi
}

# Back up a given file
backup_file()
{
	FROM=$1
	FROM_BAK=$FROM.$DATETIME.bak
	echo "[$FROM_BAK] backup created"
	mv $FROM $FROM_BAK
}

# Clone a given repo
clone_repo()
{
	TO=$1
	FROM=$2
	if [[ -d "$FROM" ]]
	then
		(cd $FROM && git pull)
	else
		echo git clone $TO $FROM
		git clone $TO $FROM
	fi
}
	


# Actually call the main function
main
