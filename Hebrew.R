library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Hebrew"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 681 Hebrew items"
# "84 missing uni_lemmas in original ( 12 % missing)"
# "75 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "20 uni_lemmas still missing ( 3 % missing)"
# Review 10 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:

new_items[which(new_items$WS=="item_227"),]$uni_lemma = "TV" # capitalize
new_items[which(new_items$WS=="item_343"),]$uni_lemma = "people"
new_items[which(new_items$WS=="item_426"),]$uni_lemma = "look"
new_items[which(new_items$WS=="item_556"),]$uni_lemma = "I" # capitalize
new_items[which(new_items$WS=="item_567"),]$uni_lemma = "where (question)"
new_items[which(new_items$WG=="item_30"),]$uni_lemma = "ouch"
new_items[which(new_items$WG=="item_32"),]$uni_lemma = "buzz" # vs. bzzz
new_items[which(new_items$WG=="item_109"),]$uni_lemma = "rattle (object)"
new_items[which(new_items$WG=="item_442"),]$uni_lemma = "he" # not 'his'
new_items[which(new_items$WG=="item_443"),]$uni_lemma = "here" # not 'her'

# ToDo: check empty uni-lemmas ("")

# save updated instrument(s)
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "69 new uni-lemmas defined for Hebrew"

new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
# "41 new uni-lemmas defined for Hebrew"
