# dotfiles et al.

A selection of dotfiles (and some OS settings) that I use across `*nix` machines.  

For setup: `./install.sh`

For some context on folder structure, see **Context**.  
On those dots that are not OS agnostic, see: **!Agnostic**.  
For debating my (schizophrenic) self, see **FAQ**.  

> _Strictly speaking, the OS settings are only for OSX, and will not be invoked if executing the installer on a Linux machine..._

#### Context

In the context of this project, a dotfile can be one of three:

1. A regular dotfile. A well known example of such a file is a `.gitconfig`. A general trait of these is that they (in general) need to be located in `$HOME` if other programs are supposed to consume them.  
Regular dotfiles are in this project stored in `dots/` and will be copied to `$HOME` by the installer.

2. A regular dotfile with dedicated location. An example is the ssh `config` file, that isn't stored in `$HOME`, but rather in some dedicated location, e.g. within `~/.ssh/`.
Regular dotfiles with dedicated locations wil be copied to their dedicated location by the installer.

2. As a prefixed `.add_*` dotfile. In general these files contain aliases, environment variables and all the other good (but greasy) stuff you will normally find in a cluttered `~/.bash*` file.  
Dotfiles belonging to this category will automatically be sourced from a proxy file (see DOTFILE variable in `install.sh`) that will be copied to `$HOME` and sourced from `~/.bash*` after you've executed the installer.  
__FYI:__ The reason for sourcing them through a proxy file is to minimize clutter in `~/.bash*` :-)  
The prefixed dotfiles are stored in `dots/adds/` and will be copied to `$HOME` by the installer.

#### !Agnostic

Sometimes a dotfile might not be OS agnostic. Now, how could you deal with such a file?  

1. Assuming that you're realizing incompatability issues _after_ you've executed the installer: remove the source cmd for the given dotfile in your proxy file and re-source your `bash*` file.  

2. Assuming that you know that a given dotfile will be problematic before you've executed the intaller: delete the dotfile and execute the installer.  

The table below maps out dotfiles that are known to be problematic across OS'.

|File|Comment|OS|
|---|---|---|
|`.add_git_completion`|Currently the `.add_git_completion` file should not be included in the proxy file on a Linux machine since Linux comes prebaked with support for git completion.|Linux (Ubuntu LTS 18.04)|  


#### FAQ

**Q:** _Why are you adding a prefix to add_ dotfiles?_  
**A:** _I like the fact that I can easily distinguish them from other files when visiting `$HOME`._

**Q:** _Ok, but then, why are you not adding prefixes to e.g. .gitconfig or .Rprofile?!_  
**A:** _If I added prefixes for them a lot of applications wouldn't be able to find a given dotfile unless I tweaked the application settings... It would litterally defeat the purpose of doing this dotfile thingy._

**Q:** _Why did you choose such a silly prefix, `add_*`, I don't get it?!_  
**A:** _Well, the files are being **added** to bash via the proxy dotfile. So I think it's a fair enough prefix._


#### Inspired by various repos, e.g.:

https://github.com/AndersBallegaard/dotfiles  
https://github.com/sorenvind/dev-env  
https://dotfiles.github.io/  
https://github.com/mads-hartmann/dotfilesv2  
https://github.com/skovhus/setup  
