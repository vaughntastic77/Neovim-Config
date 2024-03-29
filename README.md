# Neovim Config

## A complete configuration for writing LaTeX documents with [NeoVim](https://neovim.io).

I have provided steps to setup Neovim with my config to get you started. If you would like a deeper dive into capabilities and customizing your configuration, visit [ejmastnak's guide](https://www.ejmastnak.com/tutorials/vim-latex/intro/).

## Table of Contents

1. [Mac OS Installation](#Mac-OS-Installation)
2. [Arch Linux Installation](#Arch-Linux-Installation)
3. [Debian Linux Insallation](#Debian-Linux-Installation)

The programs covered include: NeoVim, Git, Skim/Zathura, and Zotero.

# Mac OS Installation

Open the terminal by hitting `Command+Space` and typing 'terminal'.
You may check whether you already have Homebrew installed by entering the following into the terminal:

```
brew --version
```

If Homebrew is installed, it will report which version you have which you can update by means of the following:

```
brew update
brew doctor
brew upgrade
```

If Homebrew has not been installed, you may install it by running the following two commands:

```
sudo rm -rf /Library/Developer/CommandLineTools
  sudo xcode-select --install
  
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Dependencies

Check if Node is installed by running:

```
node --version
```

If Node is not installed, run:

```
brew install node
```

Check if Python 2 and 3 are installed by running the following:

```
Python2 --version
Python3 --version
```

If either version of Python is missing, run:

```
brew install python
```

## [NeoVim](https://neovim.io/)

Install NeoVim by entering:

```
brew install neovim
```

Once the installation is complete, open NeoVim by entering:

```
nvim
```

To check the health of your NeoVim install, enter the following in normal-mode (enter normal-mode in NeoVim by hitting escape) in NeoVim:

```
:checkhealth
```

If Python 3 reports an error, run following in the terminal (to exit NeoVim, write `:qa!`):

```
pip3 install --user pynvim
```

Continue to run `:checkhealth` in NeoVim, following the instructions under the reported errors until all errors are gone (the Python 2 errors may be ignored, and similarly for Ruby and Node.js).
This may involve doing some research if errors persist.

NeoVim comes with an extremely austere set of defaults, including no mouse support, making it difficult to use prior to configuration.
In order to install plugins, extending the features included in NeoVim, run the following:

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Check to see if `fzf`, `ripgrip`, `pandoc`, and `pandoc-citeproc` are installed by running each with `--version` after as above.
Install any which are missing with the following commands:

```
brew install fzf
brew install ripgrep
brew install pandoc
brew install pandoc-citeproc
```

## [Git](https://git-scm.com/)

Check to see whether Git is already installed by entering the following:

```
git --version
```

If Git is not installed, run:

```
brew install git
```

(Optional) Install LazyGit by running:

```
brew install jesseduffield/lazygit/lazygit
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

### Installing the GitHub Cli (Optional)

Assuming that you are using GitHub to host your repositories, it is convenient to install the GitHub Cli which allows you to make changes to your repositories directly from the terminal inside NeoVim:

```
brew install gh
```

For further information, see the section **GitHub Cli** in the [Cheat Sheet](https://github.com/benbrastmckie/.config/blob/master/CheatSheet.md) as well as the [GitHub Cli Repo](https://github.com/cli/cli).

### Adding an SSH Key to GitHub

If you have not already, you can also add an SSH key by amending and running the following:

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

Hit `return` once, entering your GitHub passphrase in response to the prompt.
Next run:

```
bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

Run the following to copy the SSH key to your system clipboard:

```
pbcopy < ~/.ssh/id_rsa.pub
```

In the top right corner of your GitHub page, click `Profile -> Settings -> SSH and GPG Keys` selecting `New SSH Key`.
Name the key after the devise you are using, pasting the SSH key from the clipboard into the appropriate field.
Saving the key completes the addition.

Check to make sure that the SSH key is working by pushing commits up to one of your repositories (see [(Git Part 2)](https://www.youtube.com/watch?v=7HHvkI2Swbk&list=PLBYZ1xfnKeDQYYXIhKKrXhWOaSphnn9ZL&index=2) for details).
If your SSH key stops working after rebooting, run the following command:

```
ssh-add -K ~/.ssh/id_rsa
```

You can add these (if missing or incorrect) with the following commands:

```
   git config --global user.name "USERNAME"
   git config --global user.email "EMAIL"
   git config -l
```

## [Configuration](https://github.com/benbrastmckie/.config)

I recommend forking my config so that you have your own version that you can customise for yourself. To do so, click `Fork` in my GitHub repo. This will copy the repo over to your GitHub. Now you can click the `Code` button in your repo on GitHub, sellecting SSH, and copying the address which you will use below. Alternatively, if you don't want to fork, click the `Code` button in my repo, copying the address in the same way. Now you are ready to open the terminal back up and run the following commands in order:

```
cd ~/.config
git clone YOUR-ADDRESS
git remote -v
```

This last command should show that you have two addresses synced up, reading to push and pull changes to/from assuming that you went for the fork-option above. This will permit you keep your config backed up to your GitHub repo which you can then clone onto other computers if you want to reporduce your customised config instead of mine (that is once you customise it).

Lastly, you can install the following:

```
sudo pip3 install neovim-remote
```

## [LaTeX](https://www.latex-project.org/)

If you are here, you are probably familiar with LaTeX and already have it installed. But just in case you don't, you can run the following command in order to check to see if it is already installed:

```
latexmk --version
```

To install MacTex, you can download the package [here](https://www.tug.org/mactex/), or else run the following command:

```
brew cask install mactex
```

Reboot your computer, and run NeoVim by entering the following into the terminal:

```
nvim
```

After the plugins finish installing, quite NeoVim with `:qa!`.

## [Skim](https://skim-app.sourceforge.io)

Install the Skim pdf viewer by running:

```
brew install skim
```

In order to configure Vimtex to use skim we must have the following line in our config:

```
let g:vimtex_view_method = 'skim'
```

We must also configure skin to work with Neovim for forward and inverse search. Open skim and go to `Preferences > Sync` and select `PDF-TeX Sync Support`. For Neovim, set the `Preset` field to `Custom`, set the `Command` field to `nvim`, and the `Arguments` field to 

```
--headless -c "VimtexInverseSearch %line '%file'"
```

## [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

In order for NeoVim to load icons, it will be imporant to install a NerdFont.

If you intend to use the stock terminal, you will need to go into the terminal's settings to change the font to a Nerd Font of your choice.
You are now ready to write LaTex in NeoVim inside the stock terminal.

I highly recommend swapping the CapsLock and Esc keys by opening `System Preferences -> Keyboard`, and making the appropriate changes.

# Arch Linux Installation

Open the terminal and run the following commands:

```
sudo pacman -S neovim
```

Check to confirm that Python is installed:

```
python3 --version
```

If Python is not installed, run:

```
sudo pacman -S python
```

To check the health of your NeoVim install, open NeoVim by running `nvim` in the terminal and enter the following command:

```
:checkhealth
```

If Python 3 reports an error, run following in the terminal (to exit NeoVim, write `:qa!`):

```
pip3 install --user pynvim
```

NeoVim comes with an extremely austere set of defaults, including no mouse support, making it difficult to use prior to configuration.
In order to install plugins, extending the features included in NeoVim, run the following:

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Install the FZF fuzzy finder, Ripgrep, and Pandoc with the following commands respectively:

```
sudo pacman -S fzf
sudo pacman -S ripgrep
sudo pacman -S pandoc
sudo pacman -S pandoc-citeproc
```

## [Git](https://git-scm.com/)

Check to see whether Git is already installed by entering the following:

```
git --version
```

If Git is not installed, run:

```
sudo pacman -S install git
```

If you don't have Yay, you can install it by running the following:

```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

If you run into errors, you may be missing the following dependency, which you can add by running:

```
sudo pacman -S base-devel
```

(Optional) Install LazyGit using Yay by running:

```
yay -S lazygit
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

### Installing the GitHub Cli

Assuming that you are using GitHub to host your repositories, it is convenient to install the GitHub Cli which allows you to make changes to your repositories directly from the terminal inside NeoVim:

```
sudo pacman -S github-cli
```

You will then need to follow the [instructions](https://cli.github.com/manual/) in order to authenticate GitHub Cli by running:

```
gh auth login
```

Set NeoVim as your default editor by running:

```
gh config set editor nvim
```

For further information, see the section **GitHub Cli** in the [Cheat Sheet](https://github.com/benbrastmckie/.config/blob/master/CheatSheet.md) as well as the [GitHub Cli Repo](https://github.com/cli/cli).

### Adding an SSH Key to GitHub

If you have not already, you can also add an SSH key by amending and running the following:

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

Hit `return` once, entering your GitHub passphrase in response to the prompt.
Next run:

```
bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

If you do not have `xclip` you can install it by running:

```
sudo pacman -S xclip
```

After the install, run the following to copy the SSH key to your system clipboard:

```
xclip -sel clip < ~/.ssh/id_rsa.pub
```

In the top right corner of your GitHub page, click `Profile -> Settings -> SSH and GPG Keys` selecting `New SSH Key`.
Name the key after the devise you are using, pasting the SSH key from the clipboard into the appropriate field.
Saving the key completes the addition.

## [Configuration](https://github.com/benbrastmckie/.config)

I recommend forking my config so that you have your own version that you can customise for yourself. To do so, click `Fork` in my GitHub repo. This will copy the repo over to your GitHub. Now you can click the `Code` button in your repo on GitHub, sellecting SSH, and copying the address which you will use below. Alternatively, if you don't want to fork, click the `Code` button in my repo, copying the address in the same way. Now you are ready to open the terminal back up and run the following commands in order:

```
cd ~/.config
git clone YOUR-ADDRESS
git remote -v
```

This last command should show that you have two addresses synced up, reading to push and pull changes to/from assuming that you went for the fork-option above. This will permit you keep your config backed up to your GitHub repo which you can then clone onto other computers if you want to reporduce your customised config instead of mine (that is once you customise it).

Lastly, you can install the following:

```
sudo pacman -S python-pip
sudo pip3 install neovim-remote
sudo pacman -S yarn
```

If you have not already installed LaTeX on your computer, you can run the following command in order to check to see if it is already installed:

```
latexmk --version
```

To install LaTeX, run the following

```
sudo pacman -S texlive-most
```

Run NeoVim to install plugins:

```
nvim
```

After the plugins finish installing, quite NeoVim with `:qa!`.

## [Zathura](https://pwmt.org/projects/zathura/)

Install the Zathura pdf viewer by running:

```
sudo pacman -S zathura-pdf-mupdf
```

Unless you have the Evince pdf viewer installed, you may also want to set Zathura as your default pdf viewer for opening pdfs for the papers you cite via the Vimtex Context Menu.
You can do so by editing the following file:

```
nvim ~/.config/nvim/plug-config/vimtex.vim
```

Once the file has opened in NeoVim, change all occurrences of 'evince' to 'zathura' by entering the following in NeoVim in normal-mode:

```
:%s/'evince'/'zathura'/g
```

Alternatively, you could replace Zathura here with another pdf viewer of your choice, for instance, one that allows you to easily take notes and highlight the associated pdf.
After reopening NeoVim, enter the following command:

```
:checkhealth
```

Ignore any warnings for Python 2, Ruby, and Node.js.
If other warnings are present, it is worth following the instructions provided by CheckHealth, or else troubleshooting the errors by Googling the associated messages as needed.

## [Zotero](https://www.zotero.org/)

Download and extract the [Zotero](https://www.zotero.org/download/) tarball in ~/Downloads, and move the extracted contents and set the launcher by running the following in the terminal:

```
sudo mv ~/Downloads/Zotero_linux-x86_64 /opt/zotero
cd /opt/zotero
sudo ./set_launcher_icon
sudo ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
```

Install Better-BibTex by downloading the latest release [here](https://retorque.re/zotero-better-bibtex/installation/) (click on the .xpi).
Go into `Tools -> add-ons` and click the gear in the upper right-hand corner, selecting `Install Add-on From File` and navigate to the .xpi file in ~/Downloads.
Go into `Edit -> Preferences -> BetterBibTex` and set citation key format to `[auth][year]`.
Go into `Edit -> Preferences -> Sync` entering your username and password, or else create a new account if you have not already done so.
Also check 'On item change' at the bottom left.
Now switch to the 'Automatic Export' sub-tab and check 'On Change'.
Exit `Preferences` and click the green sync arrow in the to right-hand corner (if you have not previously registered a Zotero database, no change will occur).
Install the appropriate plugin for your browser by following the link [here](https://www.zotero.org/download/)
Find a paper online, sigining in to the journal as necessary and downloading the PDF manually.
Now return to the paper on the journal's website and test the browser plugin for Zotero which should be displayed in the top right of the screen.
Create the bib and bst directories, and move the .bst bibliography style files into the appropriate folder by running the following:

```
mkdir -p ~/texmf/bibtex/bib
cp -R ~/.config/latex/bst ~/texmf/bibtex
```

Right-click the main library folder in the left-most column, and select `Export Library`.
Under the `Format` dropdown menu, select `Better BibTex`, selecting the `Keep Updated` box. 
Save the file as `Zotero.bib` to ~/texmf/bibtex/bib which you previously created.
You are now ready to cite files in your Zotero database.

## [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

In order for NeoVim to load icons, it will be imporant to install a NerdFont.

If you intend to use the stock terminal, you will need to go into the terminal's settings to change the font to a Nerd Font of your choice.
You are now ready to write LaTex in NeoVim inside the stock terminal.

# Debian Linux Installation

Open the terminal and run the following commands:

```
sudo apt install neovim
```

Check to confirm that Python is installed:

```
python3 --version
```

If Python is not installed, run:

```
sudo apt install python
```

To check the health of your NeoVim install, open NeoVim by running `nvim` in the terminal and enter the following command:

```
:checkhealth
```

If Python 3 reports an error, run following in the terminal (to exit NeoVim, write `:qa!`):

```
pip3 install --user pynvim
```

NeoVim comes with an extremely austere set of defaults, including no mouse support, making it difficult to use prior to configuration.
In order to install plugins, extending the features included in NeoVim, run the following:

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Install the FZF fuzzy finder, Ripgrep, and Pandoc with the following commands respectively:

```
sudo apt install fzf
sudo apt install ripgrep
sudo apt install pandoc
sudo apt install pandoc-citeproc
```

## [Git](https://git-scm.com/)

Check to see whether Git is already installed by entering the following:

```
git --version
```

If Git is not installed, run:

```
sudo apt install git
```

(Optional) Install LazyGit using Launchpad by running:

```
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

### Installing the GitHub Cli

Assuming that you are using GitHub to host your repositories, it is convenient to install the GitHub Cli which allows you to make changes to your repositories directly from the terminal inside NeoVim:

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh
```

You will then need to follow the [instructions](https://cli.github.com/manual/) in order to authenticate GitHub Cli by running:

```
gh auth login
```

Set NeoVim as your default editor by running:

```
gh config set editor nvim
```

For further information, see the section **GitHub Cli** in the [Cheat Sheet](https://github.com/benbrastmckie/.config/blob/master/CheatSheet.md) as well as the [GitHub Cli Repo](https://github.com/cli/cli).

### Adding an SSH Key to GitHub

If you have not already, you can also add an SSH key by amending and running the following:

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

Hit `return` once, entering your GitHub passphrase in response to the prompt.
Next run:

```
bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

If you do not have `xclip` you can install it by running:

```
sudo apt install xclip
```

After the install, run the following to copy the SSH key to your system clipboard:

```
xclip -sel clip < ~/.ssh/id_rsa.pub
```

In the top right corner of your GitHub page, click `Profile -> Settings -> SSH and GPG Keys` selecting `New SSH Key`.
Name the key after the devise you are using, pasting the SSH key from the clipboard into the appropriate field.
Saving the key completes the addition.

## [Configuration](https://github.com/benbrastmckie/.config)

I recommend forking my config so that you have your own version that you can customise for yourself. To do so, click `Fork` in my GitHub repo. This will copy the repo over to your GitHub. Now you can click the `Code` button in your repo on GitHub, sellecting SSH, and copying the address which you will use below. Alternatively, if you don't want to fork, click the `Code` button in my repo, copying the address in the same way. Now you are ready to open the terminal back up and run the following commands in order:

```
cd ~/.config
git clone YOUR-ADDRESS
git remote -v
```

This last command should show that you have two addresses synced up, reading to push and pull changes to/from assuming that you went for the fork-option above. This will permit you keep your config backed up to your GitHub repo which you can then clone onto other computers if you want to reporduce your customised config instead of mine (that is once you customise it).

Lastly, you can install the following:

```
sudo apt install python-pip
sudo pip3 install neovim-remote
sudo apt install yarn
```

If you have not already installed LaTeX on your computer, you can run the following command in order to check to see if it is already installed:

```
latexmk --version
```

To install LaTeX, run the following

```
sudo apt install texlive-full
```

Run NeoVim to install plugins:

```
nvim
```

After the plugins finish installing, quite NeoVim with `:qa!`.

## [Zathura](https://pwmt.org/projects/zathura/)

Install the Zathura pdf viewer by running:

```
sudo apt install zathura-pdf-mupdf
```

After reopening NeoVim, enter the following command:

```
:checkhealth
```

Ignore any warnings for Python 2, Ruby, and Node.js.
If other warnings are present, it is worth following the instructions provided by CheckHealth, or else troubleshooting the errors by Googling the associated messages as needed.

## [Zotero](https://www.zotero.org/)

Download and extract the [Zotero](https://www.zotero.org/download/) tarball in ~/Downloads, and move the extracted contents and set the launcher by running the following in the terminal:

```
sudo mv ~/Downloads/Zotero_linux-x86_64 /opt/zotero
cd /opt/zotero
sudo ./set_launcher_icon
sudo ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
```

Install Better-BibTex by downloading the latest release [here](https://retorque.re/zotero-better-bibtex/installation/) (click on the .xpi).
Go into `Tools -> add-ons` and click the gear in the upper right-hand corner, selecting `Install Add-on From File` and navigate to the .xpi file in ~/Downloads.
Go into `Edit -> Preferences -> BetterBibTex` and set citation key format to `[auth][year]`.
Go into `Edit -> Preferences -> Sync` entering your username and password, or else create a new account if you have not already done so.
Also check 'On item change' at the bottom left.
Now switch to the 'Automatic Export' sub-tab and check 'On Change'.
Exit `Preferences` and click the green sync arrow in the to right-hand corner (if you have not previously registered a Zotero database, no change will occur).
Install the appropriate plugin for your browser by following the link [here](https://www.zotero.org/download/)
Find a paper online, sigining in to the journal as necessary and downloading the PDF manually.
Now return to the paper on the journal's website and test the browser plugin for Zotero which should be displayed in the top right of the screen.
Create the bib and bst directories, and move the .bst bibliography style files into the appropriate folder by running the following:

```
mkdir -p ~/texmf/bibtex/bib
cp -R ~/.config/latex/bst ~/texmf/bibtex
```

Right-click the main library folder in the left-most column, and select `Export Library`.
Under the `Format` dropdown menu, select `Better BibTex`, selecting the `Keep Updated` box. 
Save the file as `Zotero.bib` to ~/texmf/bibtex/bib which you previously created.
You are now ready to cite files in your Zotero database.

## [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

In order for NeoVim to load icons, it will be imporant to install a NerdFont.

If you intend to use the stock terminal, you will need to go into the terminal's settings to change the font to a Nerd Font of your choice.
You are now ready to write LaTex in NeoVim inside the stock terminal.
