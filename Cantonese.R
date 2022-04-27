library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Cantonese"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 804 Cantonese items"
# "42 missing uni_lemmas in original ( 5 % missing)"
# "6 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "38 uni_lemmas still missing ( 5 % missing)"
# "Review 2 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
# WS category definition gloss uni_lemma new_gloss new_uni_lemma notes
# item_101 food_drink       花生          peanut                     nut    NA
# item_339     toys  積木/Lego  <NA>      lego        NA        blocks    NA

# accept
new_items[which(new_items$definition=="花生"),]$uni_lemma = "nut" # or nuts?
new_items[which(new_items$definition=="積木/Lego"),]$uni_lemma = "blocks"

# save updated instrument(s)

new_instr <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "8 new uni-lemmas defined for Cantonese"
# ""          "blocks"    "corn"      "crab"    "nut"     "shrimp"  "TV"  "vegetable"

# should "" be NA? I think it's okay