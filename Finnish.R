library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Finnish"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 604 Finnish items"
# "155 missing uni_lemmas in original ( 26 % missing)"
# "150 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "16 uni_lemmas still missing ( 3 % missing)"
# "Review 7 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$definition=="muro"),]$uni_lemma = "cereal"
new_items[which(new_items$definition=="lapaset"),]$uni_lemma = "mitten"
new_items[which(new_items$definition=="televisio"),]$uni_lemma = "TV"
new_items[which(new_items$definition=="avaimet"),]$uni_lemma = "key"
new_items[which(new_items$definition=="valokuva"),]$uni_lemma = "photo"
new_items[which(new_items$definition=="puisto"),]$uni_lemma = "park"
new_items[which(new_items$definition=="minä"),]$uni_lemma = "I"


subset(new_items, uni_lemma=="")

new_items[which(new_items$definition=="lakritsa"),]$uni_lemma = "licorice"
new_items[which(new_items$definition=="limonadi"),]$uni_lemma = "lemonade" # juice?
new_items[which(new_items$definition=="viili"),]$uni_lemma = NA # buttermilk? ("nordic kind of sour milk")
new_items[which(new_items$uni_lemma=="carrots"),]$uni_lemma = "carrot"

# save updated instrument(s)

# ToDo: also WG, but we're missing the old_instruments/[Finnish_WG].csv file!
#new_wg <- update_instrument("Finnish", "WG", new_items %>% rename(itemID = WG))

new_ws <- update_instrument("Finnish", "WS", new_items %>% rename(itemID = WS))
# "37 new uni-lemmas defined for Finnish"
new_ws_short <- update_instrument("Finnish", "WS_Short", new_items %>% rename(itemID = WS_short))
# "7 new uni-lemmas defined for Finnish"
# "boat"    "but"     "few"     "open"    "present" "puzzle"  "then"  