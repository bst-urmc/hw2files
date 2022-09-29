# Notes on lintr via github actions

Currently, this uses .Rprofile to add a couple functions that modify linting 
defaults to the global environment.
Eventually, it might make sense to convert into a package.

## Github actions

At the moment, using a MacOS runner, as it's much quicker to install the infra.  But it looks like there's tricks [to cache installed packages](https://github.com/tidyverse/ggplot2/blob/daed59363d3eb3cded0ebeb122ef0bfd236dd97b/.github/workflows/R-CMD-check.yaml#L64) I could be using.

##
