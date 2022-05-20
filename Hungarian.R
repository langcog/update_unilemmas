library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Hungarian"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 802 Hungarian items"
# "269 missing uni_lemmas in original ( 34 % missing)"
# "224 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "62 uni_lemmas still missing ( 8 % missing)"
# "Review 9 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$WS=="item_96"),]$uni_lemma = "blocks" # plural
new_items[which(new_items$WS=="item_192"),]$uni_lemma = "boot" # singular
new_items[which(new_items$WS=="item_237"),]$uni_lemma = "nail (body part)"
new_items[which(new_items$WS=="item_301"),]$uni_lemma = "TV" # capitalize
new_items[which(new_items$WS=="item_328"),]$uni_lemma = "sink (object)" # disambig
new_items[which(new_items$WS=="item_650"),]$uni_lemma = "orange (description)" # color, not food
new_items[which(new_items$WS=="item_708"),]$uni_lemma = "I" # caps
new_items[which(new_items$WS=="item_732"),]$uni_lemma = "where (question)"
new_items[which(new_items$WS=="item_789"),]$uni_lemma = "can (auxiliary)" # not 'his'

new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police" 
new_items[which(new_items$uni_lemma=="rock"),]$uni_lemma = "stone"
new_items[which(new_items$uni_lemma=="brush"),]$uni_lemma = "brush (object)"

# ToDo: check empty uni-lemmas ("")
new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instrument(s)
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "667 new uni-lemmas defined for Hungarian"

