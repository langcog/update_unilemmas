library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Latvian"

new_items <- update_unilemmas(language, show_conflicts=T)
# 

