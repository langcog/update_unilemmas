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
new_items[which(new_items$uni_lemma=="play house"),]$uni_lemma = "playhouse"
new_items[which(new_items$uni_lemma=="tie"),]$uni_lemma = "tie (action)"
new_items[which(new_items$uni_lemma=="work"),]$uni_lemma = "work (action)"
new_items[which(new_items$uni_lemma=="when"),]$uni_lemma = "when (question)"
new_items[which(new_items$uni_lemma=="tv"),]$uni_lemma = "TV"
new_items[which(new_items$uni_lemma=="village"),]$uni_lemma = "town"
new_items[which(new_items$uni_lemma=="slide"),]$uni_lemma = "slide (action)"
new_items[which(new_items$uni_lemma=="open"),]$uni_lemma = "open (action)"
new_items[which(new_items$uni_lemma=="hairpin"),]$uni_lemma = "hair clip"
new_items[which(new_items$uni_lemma=="earrings"),]$uni_lemma = "earring" 
new_items[which(new_items$uni_lemma=="dry"),]$uni_lemma = "dry (description)"
new_items[which(new_items$uni_lemma=="keys"),]$uni_lemma = "key"

new_items[which(new_items$uni_lemma=="gloves"),]$uni_lemma = "glove"
new_items[which(new_items$uni_lemma=="drum"),]$uni_lemma = "drum (object)"
new_items[which(new_items$uni_lemma=="iron"),]$uni_lemma = "iron (object)"
new_items[which(new_items$uni_lemma=="wet"),]$uni_lemma = "wet (description)"
new_items[which(new_items$uni_lemma=="closed (description)"),]$uni_lemma = "closed"
new_items[which(new_items$uni_lemma=="wanna"),]$uni_lemma = "want"

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
