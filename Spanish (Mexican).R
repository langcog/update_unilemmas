library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Spanish (Mexican)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 743 Spanish (Mexican) items"
# "97 missing uni_lemmas in original ( 13 % missing)"
# "251 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "14 uni_lemmas still missing ( 2 % missing)"
# "Review 19 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"


new_items[which(new_items$definition=="chícharo"),]$uni_lemma = "peas" # singular exception..
new_items[which(new_items$definition=="ejotes"),]$uni_lemma = "beans" # green beans, but beans not in form
new_items[which(new_items$definition=="espagueti"),]$uni_lemma = "pasta" # use more widespread uni-lemma
new_items[which(new_items$definition=="papitas"),]$uni_lemma = "chips" 
new_items[which(new_items$definition=="uvas"),]$uni_lemma = "grape" 
new_items[which(new_items$definition=="patines"),]$uni_lemma = "skates" 
new_items[which(new_items$definition=="lavabo"),]$uni_lemma = "sink (object)" 
new_items[which(new_items$definition=="televisión"),]$uni_lemma = "TV" 
new_items[which(new_items$definition=="cine"),]$uni_lemma = "movie" # we don't want to use theater or cinema?
new_items[which(new_items$definition=="patio (espacio abierto o jardín)"),]$uni_lemma = "yard" 
new_items[which(new_items$definition=="levantar(se)"),]$uni_lemma = "stand" # or lift (action)
new_items[which(new_items$definition=="parar(se)"),]$uni_lemma = "stand" 
new_items[which(new_items$definition=="cenar"),]$uni_lemma = "dine" 
new_items[which(new_items$definition=="cerrar"),]$uni_lemma = "close (action)" 
new_items[which(new_items$definition=="ella"),]$uni_lemma = "she" 
new_items[which(new_items$definition=="tuya"),]$uni_lemma = "yours" 
new_items[which(new_items$definition=="tuyas"),]$uni_lemma = "yours" 
new_items[which(new_items$definition=="tuyo"),]$uni_lemma = "yours" 
new_items[which(new_items$definition=="tuyos"),]$uni_lemma = "yours" 

new_items[which(new_items$uni_lemma=="tuna (food)"),]$uni_lemma = "tuna" # to match other forms, no need to disambiguate

new_items[which(new_items$definition=="uvas"),]$uni_lemma = "grapes" # most forms use plural 
new_items[which(new_items$uni_lemma=="earth"),]$uni_lemma = "soil" 
new_items[which(new_items$uni_lemma=="well"),]$uni_lemma = "well (modifier)" 
new_items[which(new_items$uni_lemma=="bookcase"),]$uni_lemma = "bookshelf" 
new_items[which(new_items$uni_lemma=="lay down"),]$uni_lemma = "lie down" 
new_items[which(new_items$uni_lemma=="salsa"),]$uni_lemma = "sauce" 
new_items[which(new_items$uni_lemma=="ranch"),]$uni_lemma = "farm" 
new_items[which(new_items$uni_lemma=="skinny"),]$uni_lemma = "thin" 
new_items[which(new_items$uni_lemma=="sink (object)"),]$uni_lemma = "sink"
new_items[which(new_items$uni_lemma=="when"),]$uni_lemma = "when (question)"
new_items[which(new_items$uni_lemma=="silence (action)"),]$uni_lemma = "quiet (action)"
new_items[which(new_items$uni_lemma=="shovel (object)"),]$uni_lemma = "shovel"
new_items[which(new_items$uni_lemma=="seal"),]$uni_lemma = "seal (animal)"
new_items[which(new_items$uni_lemma=="plant (object)"),]$uni_lemma = "plant"
new_items[which(new_items$uni_lemma=="earrings"),]$uni_lemma = "earring" 
new_items[which(new_items$uni_lemma=="eat breakfast"),]$uni_lemma = "breakfast (action)"
new_items[which(new_items$uni_lemma=="clothing"),]$uni_lemma = "clothes"
new_items[which(new_items$uni_lemma=="bat"),]$uni_lemma = "bat (object)"
new_items[which(new_items$uni_lemma=="cassette"),]$uni_lemma = "tape (object)"
new_items[which(new_items$uni_lemma=="bang"),]$uni_lemma = "bang bang"
new_items[which(new_items$uni_lemma=="keys"),]$uni_lemma = "key"

new_items[which(new_items$uni_lemma=="skate"),]$uni_lemma = "skate (action)" 
new_items[which(new_items$uni_lemma=="skates"),]$uni_lemma = "skate (object)" 
new_items[which(new_items$uni_lemma=="lips"),]$uni_lemma = "lip"
new_items[which(new_items$uni_lemma=="drum"),]$uni_lemma = "drum (object)"
new_items[which(new_items$uni_lemma=="iron"),]$uni_lemma = "iron (object)"
new_items[which(new_items$uni_lemma=="burn (action)"),]$uni_lemma = "burn"
new_items[which(new_items$uni_lemma=="close (action)"),]$uni_lemma = "close"
new_items[which(new_items$uni_lemma=="wet"),]$uni_lemma = "wet (description)"
new_items[which(new_items$uni_lemma=="wanna"),]$uni_lemma = "want"


# save updated instruments
new_ws <- update_instrument("Spanish_Mexican", "WS", new_items %>% rename(itemID = WS))
# "244 new uni-lemmas defined for Spanish_Mexican"
new_wg <- update_instrument("Spanish_Mexican", "WG", new_items %>% rename(itemID = WG))
# "11 new uni-lemmas defined for Spanish_Mexican"
# "close (action)" "dine"           "grape"          "I"              "photo"          "plant (object)" "she"           
# "sink (object)"  "stand"          "TV"             "yours"   