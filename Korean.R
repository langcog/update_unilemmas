library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Korean"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)