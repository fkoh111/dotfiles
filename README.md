# dotfiles

As the name implies, a curated selection of dotfiles used across `*nix` machines.

#### Context
In the context of this project, a dotfile can exist in one of three flavours:

1. As a regular dotfile. A well known example is a `.gitconfig` file. A general trait of these files are that they contain personal preferences but no sensitive information. Another trait is that they (in general) need to be located in `$HOME` if other programs are supposed to consume them.  
Regular dotfiles are in the project stored in `dots/` and will be copied to `$HOME` by the installer.  

2. As a prefixed `.add_*` dotfile. In general these files contain aliases, environment variables and all the other good stuff you normally will find in a cluttered `~/.bashrc` or `~/.bash_profile`.  
These dotfiles are stored in `dots/adds/` and will be copied to `$HOME` by the installer.  

3. As boilerplates. This type of dotfile is usually frameworks for configs or empty files. When populated these files will contain sensitive information such as tokens and secrets.  
The boilerplates are stored in `dots/boilerplates/` and will be copied to `$HOME` by the installer.  


```sh
.
├── dots 1
│   ├── adds 2
│   └── boilerplates 3
└── utils
```


#### Inspired by various repos, e.g.:

https://github.com/AndersBallegaard/dotfiles  
https://github.com/sorenvind/dev-env  
https://dotfiles.github.io/  
https://github.com/mads-hartmann/dotfilesv2  
