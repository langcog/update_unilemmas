library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "English (American)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 683 English (American) items"
# "0 missing uni_lemmas in original ( 0 % missing)"
# "0 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "0 uni_lemmas still missing ( 0 % missing)"

new_items[which(new_items$uni_lemma=="nuts"),]$uni_lemma = "nut"
new_items[which(new_items$uni_lemma=="garbage"),]$uni_lemma = "trash" 
new_items[which(new_items$uni_lemma=="carrots"),]$uni_lemma = "carrot"
new_items[which(new_items$uni_lemma=="hafta"),]$uni_lemma = "have to"
new_items[which(new_items$uni_lemma=="woods"),]$uni_lemma = "forest"
new_items[which(new_items$uni_lemma=="vitamins"),]$uni_lemma = "vitamin"
new_items[which(new_items$uni_lemma=="tape"),]$uni_lemma = "tape (object)"
new_items[which(new_items$uni_lemma=="mop"),]$uni_lemma = "mop (object)"
new_items[which(new_items$uni_lemma=="call on phone"),]$uni_lemma = "call"
new_items[which(new_items$uni_lemma=="bat"),]$uni_lemma = "bat (object)"
new_items[which(new_items$uni_lemma=="sofa"),]$uni_lemma = "couch" # mapping sofa to couch because so similar
new_items[which(new_items$uni_lemma=="keys"),]$uni_lemma = "key"

new_items[which(new_items$uni_lemma=="skate"),]$uni_lemma = "skate (action)" 
new_items[which(new_items$uni_lemma=="mittens"),]$uni_lemma = "mitten"
new_items[which(new_items$uni_lemma=="gloves"),]$uni_lemma = "glove"
new_items[which(new_items$uni_lemma=="lips"),]$uni_lemma = "lip"
new_items[which(new_items$uni_lemma=="glue"),]$uni_lemma = "glue (object)"
new_items[which(new_items$uni_lemma=="block"),]$uni_lemma = "blocks"
new_items[which(new_items$uni_lemma=="like (action)"),]$uni_lemma = "like"

# save updated instrument(s)
new_ws <- update_instrument("English", "WS", new_items %>% rename(itemID = WS))
# "1 new uni-lemmas defined for English"
# "pastry"

# ToDo: check why itemIDs/definitions don't match??
new_wg <- update_instrument("English", "WG", new_items %>% rename(itemID = WG))
# "All itemIDs accounted for in new file: FALSE"
# "All definitions accounted for in new file: FALSE"
# "2 new uni-lemmas defined for English"
# "I"  "TV"

new_wsshort <- update_instrument("English", "WSShort", new_items %>% rename(itemID = WSShort))
new_wsshort <- update_instrument("English", "WGShort", new_items %>% rename(itemID = WGShort))

