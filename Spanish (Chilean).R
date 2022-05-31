library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Spanish (Chilean)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 457 Spanish (Chilean) items"
# "39 missing uni_lemmas in original ( 9 % missing)"
# "30 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "16 uni_lemmas still missing ( 4 % missing)"
# "Review 7 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$definition=="zanahoria"),]$uni_lemma = "carrot" # singular
new_items[which(new_items$definition=="aros"),]$uni_lemma = "earring" # singular
new_items[which(new_items$definition=="botas"),]$uni_lemma = "boot" # singular
new_items[which(new_items$definition=="fotos"),]$uni_lemma = "photo" # singular
new_items[which(new_items$definition=="luz"),]$uni_lemma = "light (object)" 
new_items[which(new_items$definition=="llaves"),]$uni_lemma = "key" # singular
new_items[which(new_items$definition=="nana"),]$uni_lemma = "babysitter" # or housekeeper?

new_items[which(new_items$uni_lemma=="orange (fruit)"),]$uni_lemma = "orange (food)"
new_items[which(new_items$uni_lemma=="feet"),]$uni_lemma = "foot"

new_items[which(new_items$uni_lemma==""),] # 27 undefined uni-lemmas


new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA


# save updated instruments
new_wg <- update_instrument("Spanish_Chilean", "WG", new_items %>% rename(itemID = WG))
# "22 new uni-lemmas defined for Spanish_Chilean"
