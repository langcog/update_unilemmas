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

new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police" 
new_items[which(new_items$uni_lemma=="eyebrows"),]$uni_lemma = "eyebrow" 
new_items[which(new_items$uni_lemma=="color"),]$uni_lemma = "color (action)"
new_items[which(new_items$uni_lemma=="merry-go-round"),]$uni_lemma = "carousel"
new_items[which(new_items$uni_lemma=="cd"),]$uni_lemma = "CD"
new_items[which(new_items$uni_lemma=="carrots"),]$uni_lemma = "carrot"
new_items[which(new_items$uni_lemma=="hold on"),]$uni_lemma = "hold"
new_items[which(new_items$uni_lemma=="shake (hands)"),]$uni_lemma = "shake"
new_items[which(new_items$uni_lemma=="even if"),]$uni_lemma = "even"
new_items[which(new_items$uni_lemma=="go in"),]$uni_lemma = "enter"
new_items[which(new_items$WS=="item_254"),]$uni_lemma = "tie (object)"
new_items[which(new_items$WS=="item_597"),]$uni_lemma = "tie (action)"
new_items[which(new_items$uni_lemma=="helper's name"),]$uni_lemma = "babysitter's name"
new_items[which(new_items$uni_lemma=="underwear"),]$uni_lemma = "underpants"
new_items[which(new_items$uni_lemma=="tidy (action)"),]$uni_lemma = "clean (action)"
new_items[which(new_items$uni_lemma=="piece of"),]$uni_lemma = "piece"
new_items[which(new_items$uni_lemma=="mushrooms"),]$uni_lemma = "mushroom"
new_items[which(new_items$uni_lemma=="mop"),]$uni_lemma = "mop (object)"
new_items[which(new_items$uni_lemma=="bi boo (siren)"),]$uni_lemma = "wee woo"
new_items[which(new_items$uni_lemma=="call on phone"),]$uni_lemma = "call"




new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instrument(s)

new_instr <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "10 new uni-lemmas defined for Cantonese"
#  "blocks"    "corn"      "crab"    "nut"     "shrimp"  "TV"  "vegetable"

# should "" be NA? I think it's okay