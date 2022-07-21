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

new_items[which(new_items$uni_lemma=="violet"),]$uni_lemma = "purple"
new_items[which(new_items$uni_lemma=="underwear"),]$uni_lemma = "underpants"
new_items[which(new_items$definition=="despacio"),]$uni_lemma = "slowly" # (better than 'slow')
new_items[which(new_items$uni_lemma=="shut up"),]$uni_lemma = "quiet (action)"
new_items[which(new_items$uni_lemma=="shovel (object)"),]$uni_lemma = "shovel"
new_items[which(new_items$uni_lemma=="seal"),]$uni_lemma = "seal (animal)"
new_items[which(new_items$uni_lemma=="plant (object)"),]$uni_lemma = "plant"
new_items[which(new_items$uni_lemma=="okay"),]$uni_lemma = "ok"
new_items[which(new_items$uni_lemma=="little"),]$uni_lemma = "little (description)"
new_items[which(new_items$uni_lemma=="eat breakfast"),]$uni_lemma = "breakfast (action)"
new_items[which(new_items$uni_lemma=="dry"),]$uni_lemma = "dry (description)"
new_items[which(new_items$uni_lemma=="clothing"),]$uni_lemma = "clothes"
new_items[which(new_items$uni_lemma=="bang"),]$uni_lemma = "bang bang"

new_items[which(new_items$uni_lemma=="skate"),]$uni_lemma = "skate (action)" 
new_items[which(new_items$uni_lemma=="skates"),]$uni_lemma = "skate (object)" 
new_items[which(new_items$uni_lemma=="lips"),]$uni_lemma = "lip"
new_items[which(new_items$uni_lemma=="drum"),]$uni_lemma = "drum (object)"
new_items[which(new_items$uni_lemma=="iron"),]$uni_lemma = "iron (object)"
new_items[which(new_items$uni_lemma=="cut (action)"),]$uni_lemma = "cut"
new_items[which(new_items$uni_lemma=="burn (action)"),]$uni_lemma = "burn"
new_items[which(new_items$uni_lemma=="wet"),]$uni_lemma = "wet (description)"


new_items[which(new_items$uni_lemma==""),] # 27 undefined uni-lemmas


new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA


# save updated instruments
new_ws <- update_instrument("Spanish_Argentinian", "WS", new_items %>% rename(itemID = WS))
# "186 new uni-lemmas defined for Spanish_Argentinian"
