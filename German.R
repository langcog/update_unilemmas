library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "German"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 588 German items"
# "133 missing uni_lemmas in original ( 23 % missing)"
# "131 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "9 uni_lemmas still missing ( 2 % missing)"
# "Review 7 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

subset(new_items, uni_lemma=="")

new_items[which(new_items$definition=="Dreirad"),]$uni_lemma = "tricycle" 
new_items[which(new_items$definition=="Waschpulver"),]$uni_lemma = "detergent"  
new_items[which(new_items$definition=="Arzt"),]$uni_lemma = "doctor"  

# 320 item_320 games_routines     tag       good day   --> 'hello' ?

new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA


# singularization
new_items[which(new_items$definition=="Stiefel"),]$uni_lemma = "boot" 
new_items[which(new_items$definition=="Handschuhe"),]$uni_lemma = "glove" 

new_items[which(new_items$definition=="Fernseher"),]$uni_lemma = "TV" # capitalized 

new_items[which(new_items$definition=="nach draußen"),]$uni_lemma = "outside" # was 'out'

new_items[which(new_items$definition=="über"),]$uni_lemma = "about" # was above..

new_items[which(new_items$definition=="jeder"),]$uni_lemma = "each" # was beach, which is wrong..

new_items[which(new_items$definition=="keine"),]$uni_lemma = "none" # was 'no'

new_items[which(new_items$uni_lemma=="lift"),]$uni_lemma = "lift (action)"

new_items[which(new_items$uni_lemma=="feet"),]$uni_lemma = "foot"

new_items[which(new_items$uni_lemma=="cacao"),]$uni_lemma = "cocoa"
new_items[which(new_items$uni_lemma=="call on phone"),]$uni_lemma = "call"
new_items[which(new_items$uni_lemma=="back"),]$uni_lemma = "back (location)"
new_items[which(new_items$uni_lemma=="keys"),]$uni_lemma = "key"



# save updated instrument(s)
new_ws <- update_instrument("German", "WS", new_items %>% rename(itemID = WS))
# "122 new uni-lemmas defined for German"