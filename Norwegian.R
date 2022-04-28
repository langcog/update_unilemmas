library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Norwegian"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 745 Norwegian items"
# "333 missing uni_lemmas in original ( 45 % missing)"
# "389 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "3 uni_lemmas still missing ( 0 % missing)"
# "Review 54 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

# ToDo: reject a lot of the new uni-lemmas that don't match old (e.g. bunny, not rabbit)
new_items[which(new_items$definition=="kanin"),]$uni_lemma = "bunny"
new_items[which(new_items$definition=="kattunge"),]$uni_lemma = "kitty"
new_items[which(new_items$definition=="veps"),]$uni_lemma = "wasp" # wasp / bee?
new_items[which(new_items$definition=="klosser"),]$uni_lemma = "blocks"
new_items[which(new_items$definition=="fargeblyant"),]$uni_lemma = "pen/pencil" # colored pencil..maybe crayon?
new_items[which(new_items$definition=="corn flakes"),]$uni_lemma = "cheerios" # cheerios is our generic
new_items[which(new_items$definition=="gulrot"),]$uni_lemma = "carrot"
new_items[which(new_items$definition=="knapper"),]$uni_lemma = "button (object)"
new_items[which(new_items$definition=="regntøy"),]$uni_lemma = "coat" # 'rainwear'
new_items[which(new_items$definition=="støvler"),]$uni_lemma = "boot"
new_items[which(new_items$definition=="votter"),]$uni_lemma = "mitten"
new_items[which(new_items$definition=="mage"),]$uni_lemma = "tummy"
new_items[which(new_items$definition=="tenner"),]$uni_lemma = "tooth"
new_items[which(new_items$definition=="lommebok"),]$uni_lemma = "wallet" # not purse..
new_items[which(new_items$definition=="veske"),]$uni_lemma = "bag"
new_items[which(new_items$definition=="trapp"),]$uni_lemma = "stairs"
new_items[which(new_items$definition=="TV"),]$uni_lemma = "TV"
new_items[which(new_items$definition=="butikk"),]$uni_lemma = "store"
new_items[which(new_items$definition=="jeg"),]$uni_lemma = "I"
new_items[which(new_items$definition=="pappa"),]$uni_lemma = "daddy"

# ToDo: finish...so many of them :/

new_items[which(new_items$definition=="plastilina"),]$uni_lemma = "play dough"
new_items[which(new_items$definition=="matpakke"),]$uni_lemma = "lunchbox"

new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instruments
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "302 new uni-lemmas defined for Norwegian"
new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
# "8 new uni-lemmas defined for Norwegian"
# "blocks" "boot"   "carrot" "I"      "mitten" "TV"     "wallet" "wasp"  