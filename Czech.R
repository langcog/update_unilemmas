library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Czech"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 553 Czech items"
# "75 missing uni_lemmas in original ( 14 % missing)"
# "47 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "28 uni_lemmas still missing ( 5 % missing)"
# "Review 0 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"


new_items[which(new_items$definition=="policajti"),]$uni_lemma = "police car" 
new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police" 
new_items[which(new_items$uni_lemma=="carrots"),]$uni_lemma = "carrot"
new_items[which(new_items$uni_lemma=="shhh"),]$uni_lemma = "shh"

new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instrument(s)
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "46 new uni-lemmas defined for Czech"
# ""              "around"        "beard"         "beer"          "behind"        "branch"        "bun"          
# "by"            "dishwasher"    "dumpling"      "earring"       "fish (animal)" "fish (food)"   "for"          
# "forest"        "from"          "glue"          "guitar"        "gum"           "helicopter"    "hose"         
# "in"            "lawn mower"    "mailman"       "must"          "newspaper"     "next to"       "nut"          
# "on"            "outside"       "pour"          "put"           "shhh"          "sidewalk"      "snail"        
# "stay"          "stomp"         "strawberry"    "to"     "town"    "TV"      "under"         "with"    "wrong"     