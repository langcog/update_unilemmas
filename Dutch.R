library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Dutch"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 1075 Dutch items"
# "66 missing uni_lemmas in original ( 6 % missing)"
# "95 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "44 uni_lemmas still missing ( 4 % missing)"
# "Review 19 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"