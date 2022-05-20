library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Irish"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 720 Irish items"
# "55 missing uni_lemmas in original ( 8 % missing)"
# "80 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "14 uni_lemmas still missing ( 2 % missing)"
# "Review 31 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$WS=="item_126"),]$uni_lemma = "train" # same..
new_items[which(new_items$WS=="item_132"),]$uni_lemma = "blocks" # plural
new_items[which(new_items$WS=="item_155"),]$uni_lemma = "puzzle" # generic
# ToDo - finish

new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police" 
new_items[which(new_items$uni_lemma=="fireman"),]$uni_lemma = "firefighter" 
new_items[which(new_items$uni_lemma=="nuts"),]$uni_lemma = "nut"
new_items[which(new_items$uni_lemma=="rock"),]$uni_lemma = "stone"

# ToDo: check empty uni-lemmas ("")
new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instrument(s)
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "91 new uni-lemmas defined for Irish"

