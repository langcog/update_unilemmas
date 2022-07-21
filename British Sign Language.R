library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "British Sign Language"
outdir = "final_instruments/"

old_items <- get_item_data(language = language, db_args=db_args) %>%
  filter(item_kind=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 548 British Sign Language items"
# "129 missing uni_lemmas in original ( 24 % missing)"
# "99 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "30 uni_lemmas still missing ( 5 % missing)"
# "Review 0 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police" 
new_items[which(new_items$uni_lemma=="carrots"),]$uni_lemma = "carrot"
new_items[which(new_items$uni_lemma=="skate (action)"),]$uni_lemma = "skate"
new_items[which(new_items$uni_lemma=="hurt"),]$uni_lemma = "hurt (description)"
new_items[which(new_items$uni_lemma=="tv"),]$uni_lemma = "TV"
new_items[which(new_items$uni_lemma=="pick (action)"),]$uni_lemma = "pick"
new_items[which(new_items$uni_lemma=="feet"),]$uni_lemma = "foot"
new_items[which(new_items$uni_lemma=="keys"),]$uni_lemma = "key"
new_items[which(new_items$uni_lemma=="back"),]$uni_lemma = "back (preposition)"

new_items[which(new_items$uni_lemma=="skate"),]$uni_lemma = "skate (action)" 
new_items[which(new_items$uni_lemma=="gloves"),]$uni_lemma = "glove"
new_items[which(new_items$uni_lemma=="lips"),]$uni_lemma = "lip"

# now join and re-save in raw_data/instruments format, e.g.
# https://github.com/langcog/wordbank/blob/master/raw_data/BSL_WG/%5BBSL_WG%5D.csv

# load original instrument(s) file, as get_item_data doesn't have all the needed columns
#instr_name = "[BSL_WG].csv"

new_instr <- update_instrument("BSL", "WG", new_items %>% rename(itemID = WG))
# ""               "and"            "bandaid"        "basement"       "basket"         "bat (object)"   "beans"         
# "because"        "before"         "behind"         "belt"           "beside"         "brown"          "build"         
# "but"            "camping"        "candy"          "chase"          "chips"          "choose"         "circus"        
# "cook"           "corn"           "cowboy"         "cut"            "dryer"          "each"           "earring"       
# "farm"           "firefighter"    "fit"            "fix"            "flag"           "forest"         "french fries"  
# "game"           "gas station"    "gum"            "hamburger"      "hate"           "helicopter"     "hose"          
# "ice"            "if"             "knock"          "last"           "lawn mower"     "like"           "lips"          
# "long"           "mailman"        "mop (object)"   "napkin"         "need"           "noisy"          "nurse"         
# "nut"            "pastry"         "peanut butter"  "pen/pencil"     "pick (action)"  "picnic"         "poor"          
# "pour"           "puzzle"         "quiet"          "ride"           "robot"          "salad"          "salt"          
# "share"          "shopping"       "shoulder"       "skate (action)" "sled"           "slide (action)" "snowman"       
# "so"             "sorry"          "sticky"         "store"          "story"          "strawberry"     "stuck"         
# "tape (object)"  "taste"          "their"          "then"           "think"          "town"           "vanilla"       
# "vitamin"        "wake"           "want"           "will"           "windy"          "work (place)"   "yourself"  
