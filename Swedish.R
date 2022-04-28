library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Swedish"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 752 Swedish items"
# "329 missing uni_lemmas in original ( 44 % missing)"
# "324 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "16 uni_lemmas still missing ( 2 % missing)"
# "Review 2 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
#WS       WG        category definition  gloss uni_lemma new_gloss new_uni_lemma notes
# item_135  item_78      food_drink      morot carrot   carrots                  carrot      
#          item_151 furniture_rooms         TV     TV        tv                      TV     
new_items[which(new_items$definition=="morot"),]$uni_lemma = "carrot" # singular
new_items[which(new_items$definition=="TV"),]$uni_lemma = "TV" # upper case

# some empty
new_items[which(new_items$uni_lemma==""),]

new_items[which(new_items$definition=="ringa"),]$uni_lemma = "call on phone"
new_items[which(new_items$definition=="sitta pottan"),]$uni_lemma = "go potty"

new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instruments
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "294 new uni-lemmas defined for Swedish"
new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
# "2 new uni-lemmas defined for Swedish"
# "carrot" "TV" 
