library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Mandarin (Taiwanese)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 696 Mandarin (Taiwanese) items"
# "63 missing uni_lemmas in original ( 9 % missing)"
# "48 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "15 uni_lemmas still missing ( 2 % missing)"

new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police" 
new_items[which(new_items$WS=="item_281"),]$uni_lemma = "brush (object)"
new_items[which(new_items$WS=="item_375"),]$uni_lemma = "brush (action)"

new_items[which(new_items$uni_lemma=="hippo"),]$uni_lemma = "hippopotamus"
new_items[which(new_items$uni_lemma=="potato chip"),]$uni_lemma = "chips"
new_items[which(new_items$uni_lemma=="grape"),]$uni_lemma = "grapes"
new_items[which(new_items$uni_lemma=="fly"),]$uni_lemma = "fly (animal)"
new_items[which(new_items$uni_lemma=="kiwi fruit"),]$uni_lemma = "kiwi"
new_items[which(new_items$uni_lemma=="mister"),]$uni_lemma = "sir"
new_items[which(new_items$uni_lemma=="nuggets (food)"),]$uni_lemma = "nugget"
new_items[which(new_items$uni_lemma=="shrimp (animal)"),]$uni_lemma = "shrimp"
new_items[which(new_items$uni_lemma=="tie"),]$uni_lemma = "tie (action)"
new_items[which(new_items$uni_lemma=="which"),]$uni_lemma = "which (question)"
new_items[which(new_items$uni_lemma=="hurt"),]$uni_lemma = "hurt (description)"
new_items[which(new_items$uni_lemma=="where"),]$uni_lemma = "where (question)"
new_items[which(new_items$uni_lemma=="smile (action)"),]$uni_lemma = "smile"
new_items[which(new_items$uni_lemma=="seesaw (object)"),]$uni_lemma = "seesaw"
new_items[which(new_items$uni_lemma=="sandals"),]$uni_lemma = "sandal"
new_items[which(new_items$uni_lemma=="noodle"),]$uni_lemma = "noodles"
new_items[which(new_items$uni_lemma=="peekabo"),]$uni_lemma = "peekaboo"
new_items[which(new_items$uni_lemma=="night night"),]$uni_lemma = "good night"
new_items[which(new_items$WS=="item_76"),]$uni_lemma = "nail (body part)"
new_items[which(new_items$WS=="item_286"),]$uni_lemma = "nail (object)"
new_items[which(new_items$uni_lemma=="mop"),]$uni_lemma = "mop (object)"
new_items[which(new_items$uni_lemma=="excavator"),]$uni_lemma = "digger"
new_items[which(new_items$uni_lemma=="bat"),]$uni_lemma = "bat (object)"
new_items[which(new_items$uni_lemma=="phone"),]$uni_lemma = "telephone"
new_items[which(new_items$uni_lemma=="wardrobe"),]$uni_lemma = "closet"


new_items[which(new_items$uni_lemma==""),]
new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

new_ws <- update_instrument("Mandarin_Taiwanese", "WS", new_items %>% rename(itemID = WS))
# 621 new
new_wg <- update_instrument("Mandarin_Taiwanese", "WG", new_items %>% rename(itemID = WG))
# 7 new

