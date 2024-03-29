library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "English (British)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 541 English (British) items"
# "6 missing uni_lemmas in original ( 1 % missing)"
# "85 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "4 uni_lemmas still missing ( 1 % missing)"
# "Review 1 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
#Oxford TEDS_Twos TEDS_Threes category definition gloss uni_lemma new_gloss new_uni_lemma notes
# item_388                    pronouns          I     I         i                    I      

# capitalization
new_items[which(new_items$definition=="I"),]$uni_lemma = "I"
new_items[which(new_items$definition=="chips"),]$uni_lemma = "french fries"
new_items[which(new_items$definition=="sweets"),]$uni_lemma = "sweets"

new_items[which(new_items$definition=="jug"),]$uni_lemma = NA # pitcher?
new_items[which(new_items$definition=="kate"),]$uni_lemma = NA # ??? ..skate? no category...

new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police" 
new_items[which(new_items$uni_lemma=="band-aid"),]$uni_lemma = "bandaid" 
new_items[which(new_items$uni_lemma=="blade"),]$uni_lemma = "knife" 
new_items[which(new_items$uni_lemma=="carrots"),]$uni_lemma = "carrot"
new_items[which(new_items$uni_lemma=="peculiar"),]$uni_lemma = "strange"
new_items[which(new_items$uni_lemma=="stamp"),]$uni_lemma = "stamp (action)" # or object?? (no category..)
new_items[which(new_items$uni_lemma=="stoller"),]$uni_lemma = "stroller"
new_items[which(new_items$uni_lemma=="tv"),]$uni_lemma = "TV"
new_items[which(new_items$uni_lemma=="tire"),]$uni_lemma = "tire (object)"
new_items[which(new_items$uni_lemma=="back"),]$uni_lemma = "back (preposition)"
new_items[which(new_items$uni_lemma=="keys"),]$uni_lemma = "key"

new_items[which(new_items$uni_lemma=="drum"),]$uni_lemma = "drum (object)"
new_items[which(new_items$uni_lemma=="block"),]$uni_lemma = "blocks"


#subset(new_items, uni_lemma=="")

# save updated instrument(s)
new_oxford <- update_instrument("EnglishBritish", "Oxford", new_items %>% rename(itemID = Oxford))
# "13 new uni-lemmas defined for EnglishBritish"
# "bye"     "call"    "chase"   "cuddle"  "cut"  "french fries"   "I"       "know"    "like"    "nasty"   "scratch" "store" "sweets"
new_twos <- update_instrument("English_British", "TEDS_Twos", new_items %>% rename(itemID = TEDS_Twos))
# "25 new uni-lemmas defined for English_British"
# "beside"            "chase"             "comb (object)"     "could"             "fish (animal)"     "fish (food)"      
# "fit"               "flag"              "game"              "if"                "last"              "like"             
# "listen"            "need"              "pour"              "shopping"          "swing (action)"    "swing (object)"   
# "taste"             "think"             "tray"              "wet (description)" "where (question)"  "wish"       "would"   
new_threes <- update_instrument("English_British", "TEDS_Threes", new_items %>% rename(itemID = TEDS_Threes))
# "58 new uni-lemmas defined for English_British"
# "about"      "accident"   "although"   "band-aid"   "because"    "before"     "blade"      "bored"     
# "camping"    "castle"     "circle"     "cowboy"     "deep"       "dinosaur"   "each"       "elbow"      "expensive" 
# "farmer"     "fasten"     "fence"      "forget"     "furniture"  "half"       "hate"       "hose"       "however"   
# "idea"       "kite"       "long"       "lost"       "material"   "measure"    "microscope" "might"      "need"      
# "nurse"      "nut"        "on top"     "pavement"   "peculiar"   "peel"       "promise"    "reindeer"   "salt"      
# "sneeze"     "soccer"     "stamp"      "their"      "then"       "think"      "tire"       "tricycle"   "trolley"   
# "vanilla"    "vegetable"  "week"       "were"       "yourself"  

new_oxfordshort <- update_instrument("EnglishBritish", "OxfordShort", new_items %>% rename(itemID = OxfordShort))
