# dotfiles

As the name implies, a selection of dotfiles used across `*nix` machines.  

#### Context
In the context of this project, a dotfile can belong to one of three categories:

1. As a regular dotfile. A well known example of such a file is a `.gitconfig`. A general trait of these files are that they contain personal preferences but no sensitive information. Thus they can be shared. Another trait is that they (in general) need to be located in `$HOME` if other programs are supposed to consume them.  
Regular dotfiles are in this project stored in `dots/` and will be copied to `$HOME` by the installer.  

2. As a prefixed `.add_*` dotfile. In general these files contain aliases, environment variables and all the other good but greasy stuff you would normally find in a cluttered `~/.bash*` file.  
Dotfiles belonging to this category will automatically be sourced from a proxy file (see DOTFILE variable in `install.sh`) that will be placed in `$HOME` and sourced from  `~/.bash*` after you've executed the installer.  
The reason for doing so is to minimize cluttering.  
The prefixed dotfiles are stored in `dots/adds/` and will be copied to `$HOME` by the installer.  

3. As boilerplates. This type of dotfile is a templates for sensitive information, often in the form of an empty file (e.g., `.Renviron`). Upon running the installer, you're supposed to populate these with tokens and secrets in `$HOME` __(Never within the project!)__.  
The boilerplates are stored in `dots/boilerplates/` and will be copied to `$HOME` by the installer.  


```sh
.
├── dots 1
│   ├── adds 2
│   └── boilerplates 3
└── utils
```
_dotfiles are stored within the following tree like structure_

#### Inspired by various repos, e.g.:

https://github.com/AndersBallegaard/dotfiles  
https://github.com/sorenvind/dev-env  
https://dotfiles.github.io/  
https://github.com/mads-hartmann/dotfilesv2  
