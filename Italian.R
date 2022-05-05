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

# ToDo: check empty uni-lemmas ("")

# save updated instrument(s)
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "257 new uni-lemmas defined for Italian"

new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
#  "5 new uni-lemmas defined for Italian"
