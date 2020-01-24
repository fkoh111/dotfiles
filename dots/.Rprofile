# Inspiration:
## https://csgillespie.github.io/efficientR/3-3-r-startup.html#rprofile
## https://rstats.wtf/r-startup.html#rprofile

# Set these options in every single process
options(repos = c(CRAN = "https://cran.rstudio.org"))

# Set these options when running an interactive process
if (interactive()) {
  options(prompt = " R > ")
}

# Prompting R interpreter
message(" > R is using an interpreter at: ", R.home())
message(" ")

# Prompting primary location for Rpackages
message(" > Rpkgs are being stored and read from ", .libPaths()[[1]])
message(" ")
