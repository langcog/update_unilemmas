library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Turkish"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 746 Turkish items"
# "306 missing uni_lemmas in original ( 41 % missing)"
# "290 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "27 uni_lemmas still missing ( 4 % missing)"
# "Review 4 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$definition=="Çıkar"),]$uni_lemma = "remove"
new_items[which(new_items$definition=="Kaldır"),]$uni_lemma = "lift (action)" # disambiguate
new_items[which(new_items$definition=="Yat"),]$uni_lemma = "lie down"
new_items[which(new_items$definition=="Ben"),]$uni_lemma = "I" # capitalize
new_items[which(new_items$uni_lemma=="photograph"),]$uni_lemma = "photo" 
new_items[which(new_items$uni_lemma=="carrots"),]$uni_lemma = "carrot"


# some empty
new_items[which(new_items$definition=="Oku"),]$uni_lemma = "read"
new_items[which(new_items$definition=="Pişir"),]$uni_lemma = "cook"

new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instruments
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "249 new uni-lemmas defined for Turkish"
new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
# "7 new uni-lemmas defined for Turkish"
# "I"             "lie down"      "lift (action)" "nut"           "open"          "remove"        "shh" 
