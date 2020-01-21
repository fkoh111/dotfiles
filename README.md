# dotfiles

A selection of dotfiles that I use across `*nix` machines.  

For setup: `./install.sh`

For some context on folder structure, see **Context**.  
On those dots that are not OS agnostic, see: **!Agnostic**.  
For debating my (schizophrenic) self, see **FAQ**.  

#### Context

In the context of this project, a dotfile can belong to one of three categories:

1. As a regular dotfile. A well known example of such a file is a `.gitconfig`. A general trait of these files are that they contain personal preferences but no sensitive information. Thus they can be shared. Another trait is that they (in general) need to be located in `$HOME` if other programs are supposed to consume them.  
   Regular dotfiles are in this project stored in `dots/` and will be copied to `$HOME` by the installer.

2. As a prefixed `.add_*` dotfile. In general these files contain aliases, environment variables and all the other good (but greasy) stuff you will normally find in a cluttered `~/.bash*` file.  
   Dotfiles belonging to this category will automatically be sourced from a proxy file (see DOTFILE variable in `install.sh`) that will be placed in `$HOME` and sourced from `~/.bash*` after you've executed the installer.  
   The reason for doing so is to minimize clutter in `~/.bash*`.  
   The prefixed dotfiles are stored in `dots/adds/` and will be copied to `$HOME` by the installer.

3. As boilerplates. This type of dotfile is a templates for sensitive information, often in the form of an empty file (e.g., `.Renviron`). Upon running the installer, you're supposed to populate these with tokens and secrets in `$HOME` **(Never within the project before running the installer!)**.  
   The boilerplates are stored in `dots/boilerplates/` and will be copied to `$HOME` by the installer.

```sh
.
├── dots 1
│   ├── adds 2
│   └── boilerplates 3
└── utils
```

_dotfiles and their respective categories are stored within the following tree like structure_


#### !Agnostic

Sometimes a dotfile might not be OS agnostic. A dot that is not OS agnostic, is most likely a category 2 dotfile. Now, how could you deal with such a file?  

1. Assuming that you're realizing incompatability issues _after_ you've executed the installer: remove the source cmd for the given dotfile in your proxy file and re-source your `bash*` file.  

2. Assuming that you know that a given dotfile will be problematic before you've executed the intaller: delete the dotfile and execute the installer.  

The table below maps out dotfiles that are known to be problematic across OS'.

|File|Comment|OS|
|---|---|---|
|`.add_git_completion`|Currently the `.add_git_completion` file should not be included in the proxy file on a Linux machine since Linux comes prebaked with support for git completion.|Linux (Ubuntu LTS 18.04)|  


#### FAQ

**Q:** _Why are you adding a prefix to category 2 dotfiles?_  
**A:** _I like the fact that I can easily distinguish them from other files when visiting `$HOME`._

**Q:** _Ok, but then, why are you not adding prefixes to dotfiles from category 1 or 3?!_  
**A:** _If I added prefixes for 1 or 3, then a lot of applications wouldn't be able to find a given dotfile unless I tweaked the application settings... It would litterally defeat the purpose of doing this dotfile thingy._

**Q:** _Why did you choose such a silly prefix, `add_*`, I don't get it?!_  
**A:** _Well, the files are being **added** to bash via the proxy dotfile. So I think it's a fair enough prefix._

**Q:** _Why are you including the boilerplate category of dotfiles? I mean, if the files are empty, then they can't really do anything!_  
**A:** _Sure, that's right. But I like to think of them as small reminders. The thing is, that I am supposed to be reminded to update them whenever I've executed the installer (assumming that the ones in `$HOME` aren't already populated; in that scenario, the installer will not overwrite the (former) boilerplate)._

#### Inspired by various repos, e.g.:

https://github.com/AndersBallegaard/dotfiles  
https://github.com/sorenvind/dev-env  
https://dotfiles.github.io/  
https://github.com/mads-hartmann/dotfilesv2
