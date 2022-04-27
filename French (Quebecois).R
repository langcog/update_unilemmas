library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "French (Quebecois)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 700 French (Quebecois) items"
# "23 missing uni_lemmas in original ( 3 % missing)"
# "32 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "11 uni_lemmas still missing ( 2 % missing)"
# "Review 4 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
#  WS       WG   category definition gloss      uni_lemma new_gloss new_uni_lemma notes
#  item_82                toys       lego  lego           lego                  blocks      
# item_122          food_drink       noix  nuts            nut                    nuts      
# item_289 item_188    outside balançoire swing swing (object)           swing(object)      
# item_594 item_386   pronouns         je     I              i                       I  

# lego->blocks
new_items[which(new_items$definition=="lego"),]$uni_lemma = "blocks"

# 'nut' is plural on most forms..
new_items[which(new_items$definition=="noix"),]$uni_lemma = "nuts"

# disambiguation
new_items[which(new_items$definition=="balançoire"),]$uni_lemma = "swing (object)"

# capitalization
new_items[which(new_items$definition=="je"),]$uni_lemma = "I"


subset(new_items, uni_lemma=="")
new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

new_items[which(new_items$definition=="aller au magasin"),]$uni_lemma = "shopping"

# save updated instrument(s)
new_wg <- update_instrument("French_Quebecois", "WG", new_items %>% rename(itemID = WG))
# "6 new uni-lemmas defined for French_Quebecois"
new_ws <- update_instrument("French_Quebecois", "WS", new_items %>% rename(itemID = WS))
# "23 new uni-lemmas defined for French_Quebecois"
