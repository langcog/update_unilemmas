library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Spanish (Argentinian)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 699 Spanish (Argentinian) items"
# "232 missing uni_lemmas in original ( 33 % missing)"
# "215 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "27 uni_lemmas still missing ( 4 % missing)"
# "Review 9 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$definition=="atún"),]$uni_lemma = "tuna" 
new_items[which(new_items$definition=="pescado"),]$uni_lemma = "fish (food)" 
new_items[which(new_items$definition=="televisión/tele"),]$uni_lemma = "TV" 
new_items[which(new_items$definition=="piedra"),]$uni_lemma = "stone" 
new_items[which(new_items$definition=="tierra/barro"),]$uni_lemma = "soil" 
new_items[which(new_items$definition=="acostar(se)"),]$uni_lemma = "stone" 
new_items[which(new_items$definition=="llorar"),]$uni_lemma = "cry" 
new_items[which(new_items$definition=="bajar(se)"),]$uni_lemma = "descend" 
new_items[which(new_items$definition=="cenar"),]$uni_lemma = "dine" 
new_items[which(new_items$uni_lemma=="paint"),]$uni_lemma = "paint (action)"

new_items[which(new_items$definition=="camión de bomberos"),]$uni_lemma = "firetruck" 

new_items[which(new_items$uni_lemma=="roller skates"),]$uni_lemma = "skates"

new_items[which(new_items$uni_lemma==""),] # 27 undefined uni-lemmas


new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA


# save updated instruments
new_ws <- update_instrument("Spanish_Argentinian", "WS", new_items %>% rename(itemID = WS))
# "186 new uni-lemmas defined for Spanish_Argentinian"
