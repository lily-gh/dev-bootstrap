# Dev Bootstrap
Automation script and ansible playbooks to easily set up a new computer with my favorite developer tools.

These automations have been tested on: MacOS, Ubuntu and Arch Linux.

  
### How to use
#### On Ubuntu/MacOS
Download this repository, go to the root folder of the repository and run:

```sh
./bootstrap.sh
```

Enter the `sudo` password when prompted for the `BECOME` password and sit back while ansible does all the hard workf.

#### On Arch
Arch usually doesn't come with `unzip` preinstalled, so the best option is to use `bsdtar`, which comes preinstalled, to unzip the downloaded contents. 

Here's a _one-liner_ to download this repository as a `zip` file, unzip it using `bsdtar` and `cd` into the repository folder:

```bash
curl -L -o ~/Downloads/dev-bootstrap.zip https://github.com/lily-gh/dev-bootstrap/archive/refs/heads/main.zip && cd ~/Downloads && bsdtar -xf dev-bootstrap.zip && cd dev-bootstrap-main
```

Then run:
```sh
./bootstrap.sh
```

Enter the `sudo` password when prompted for the `BECOME` password and sit back while ansible does all the hard workf.


### Packages
The playbook in this repository ensures that the following packages/apps are installed:
  - bat
  - ffmpeg
  - fzf
  - git
  - gpg
  - eza
  - ansible
  - asdf
  - neovim  
  - zsh
  - zsh-syntax-highlighting
  - zsh-autosuggestions
  - oh-my-zsh
  - powerlevel10k
  - vlc
  - telegram
  - 1password


### How it works
The main `bootstrap.sh` script will check if ansible is installed in the system, and install it if it's not already installed, then, it will use ansible to start the main playbook with the following command:

```sh
ansible-playbook main.yml --ask-become-pass
```


When **_I_** (Lily) run the script, I pass in an additional parameter `lily` when running `bootstrap.sh`, this causes the script to execute an additional ansible playbook and uses an additional argument:

```sh
ansible-playbook main.yml lily.yml --ask-become-pass --ask-vault-pass
```

The `lily.yml` playbook imports two other playbooks that are used to setup my ssh key and download one of my private repos:
```yml
- import_playbook: tasks/setup-ssh.yml
- import_playbook: tasks/clone-lilydevtools.yml 
```

The parameter `--ask-vault-pass` prompts me for a password to decrypt the ssh key in this repository.


## Quality Certificate
<img src="https://github.com/lily-gh/lily-gh/blob/main/img/works_on_my_machine.png" width="350" alt="Works on my machine" /> ![Kitty](https://github.com/lily-gh/lily-gh/blob/main/img/kitty_paws.gif)
