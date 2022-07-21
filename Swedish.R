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
new_items[which(new_items$uni_lemma=="kind"),]$uni_lemma = "nice"

new_items[which(new_items$uni_lemma=="which"),]$uni_lemma = "which (connecting)"
new_items[which(new_items$uni_lemma=="not (routine)"),]$uni_lemma = "don't"
new_items[which(new_items$uni_lemma=="where"),]$uni_lemma = "where (conjunction)"
new_items[which(new_items$uni_lemma=="when"),]$uni_lemma = "when (conjunction)"
new_items[which(new_items$uni_lemma=="shop"),]$uni_lemma = "store"
new_items[which(new_items$uni_lemma=="pick (action)"),]$uni_lemma = "pick"
new_items[which(new_items$uni_lemma=="i"),]$uni_lemma = "I"
new_items[which(new_items$uni_lemma=="clothing"),]$uni_lemma = "clothes"
new_items[which(new_items$uni_lemma=="call on phone"),]$uni_lemma = "call"
new_items[which(new_items$uni_lemma=="back"),]$uni_lemma = "back (location)"
new_items[which(new_items$uni_lemma=="keys"),]$uni_lemma = "key"
new_items[which(new_items$uni_lemma=="how" & new_items$category=="connecting_words"),]$uni_lemma = "how (connecting"

new_items[which(new_items$uni_lemma=="skis"),]$uni_lemma = "ski (object)"
new_items[which(new_items$uni_lemma=="skates"),]$uni_lemma = "skate (object)" 
new_items[which(new_items$uni_lemma=="mittens"),]$uni_lemma = "mitten"
new_items[which(new_items$uni_lemma=="lips"),]$uni_lemma = "lip"
new_items[which(new_items$uni_lemma=="glue"),]$uni_lemma = "glue (object)"
new_items[which(new_items$uni_lemma=="block"),]$uni_lemma = "blocks"

new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instruments
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "294 new uni-lemmas defined for Swedish"
new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
# "2 new uni-lemmas defined for Swedish"
# "carrot" "TV" 
