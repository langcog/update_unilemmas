library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Italian"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 715 Italian items"
# "287 missing uni_lemmas in original ( 40 % missing)"
# "278 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "14 uni_lemmas still missing ( 2 % missing)"
# "Review 5 suggested new_uni_lemmas

new_items[which(new_items$WS=="item_43"),]$uni_lemma = "tights" # 'sock' too generic
new_items[which(new_items$WS=="item_45"),]$uni_lemma = "button (object)" # disambig
new_items[which(new_items$WS=="item_291"),]$uni_lemma = "TV" # caps
new_items[which(new_items$WS=="item_378"),]$uni_lemma = "bravo" # 
new_items[which(new_items$WS=="item_579"),]$uni_lemma = "I" # caps

new_items[which(new_items$uni_lemma=="earth"),]$uni_lemma = "soil" 
new_items[which(new_items$uni_lemma=="photograph"),]$uni_lemma = "photo" 
new_items[which(new_items$uni_lemma=="cover"),]$uni_lemma = "cover (action)"
new_items[which(new_items$uni_lemma=="gasoline"),]$uni_lemma = "gas"
new_items[which(new_items$uni_lemma=="carrots"),]$uni_lemma = "carrot"
new_items[which(new_items$uni_lemma=="suspeners"),]$uni_lemma = "suspenders"
new_items[which(new_items$uni_lemma=="iron (object)"),]$uni_lemma = "iron"

# ToDo: check empty uni-lemmas ("")
new_items[which(new_items$uni_lemma==""),]
new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instrument(s)
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "257 new uni-lemmas defined for Italian"

new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
#  "5 new uni-lemmas defined for Italian"
