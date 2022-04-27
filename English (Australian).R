library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "English (Australian)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 558 English (Australian) items"
# "107 missing uni_lemmas in original ( 19 % missing)"
# "101 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "7 uni_lemmas still missing ( 1 % missing)"
# "Review 1 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
#WS category definition  gloss uni_lemma new_gloss new_uni_lemma notes
# item_82     toys     puzzle puzzle   present        NA        puzzle    NA

# fix error
new_items[which(new_items$definition=="puzzle"),]$uni_lemma = "puzzle"

# save updated instrument(s)
new_ws <- update_instrument("Australian", "WS", new_items %>% rename(itemID = WS))
# "97 new uni-lemmas defined for Australian"
# ""               "ankle"          "awake"          "basket"         "bat (object)"   "belt"           "bench"         
# "better"         "brown"          "build"          "call"           "call on phone"  "chase"          "chips"         
# "cook"           "corn"           "cowboy"         "cuddle"         "cut"            "farm"           "firefighter"   
# "first"          "fit"            "fix"            "flag"           "game"           "gas station"    "give me five"  
# "glue"           "gum"            "hamburger"      "hate"           "helicopter"     "hose"           "ice"           
# "knock"          "know"           "koala"          "last"           "lawn mower"     "like"           "lips"          
# "listen"         "long"           "mailman"        "mango"          "mop"            "movie"          "muffin"        
# "napkin"         "nasty"          "noisy"          "nurse"          "nut"            "paper"          "pastry"        
# "peanut butter"  "pick"           "picnic"         "pineapple"      "play dough"     "poor"           "popcorn"       
# "pour"           "pumpkin"        "puzzle"         "quiet"          "salt"           "sandbox"        "scratch"       
# "share"          "shed"           "shopping"       "shoulder"       "sidewalk"       "slide (action)" "snack"         
# "sprinkler"      "stay"           "sticky"         "store"          "story"          "strawberry"     "stuck"         
# "tape (object)"  "taste"          "think"          "town"           "tray"           "tuna"           "vanilla"       
# "vitamin"        "waves"          "windy"          "wish"           "wombat"         "zebra" 