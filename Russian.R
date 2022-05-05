library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Russian"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 762 Russian items"
# "0 missing uni_lemmas in original ( 0 % missing)"
# "32 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "0 uni_lemmas still missing ( 0 % missing)"
# "Review 32 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$WS=="item_12"),]$uni_lemma = "buzz" # not bzzz
new_items[which(new_items$WS=="item_17"),]$uni_lemma = "ribbit" # not croak
new_items[which(new_items$WS=="item_211"),]$uni_lemma = "underwear" # not underpants
new_items[which(new_items$WS=="item_287"),]$uni_lemma = "TV" # capitalize
new_items[which(new_items$WS=="item_468"),]$uni_lemma = "lie down" # disambig 'lie'
new_items[which(new_items$WS=="item_627"),]$uni_lemma = "I" # capitalize
#new_items[which(new_items$WS==""),]$uni_lemma = ""
#new_items[which(new_items$WS==""),]$uni_lemma = ""
#new_items[which(new_items$WS==""),]$uni_lemma = ""
# ToDo: finish


# ToDo: check empty uni-lemmas ("")

# save updated instrument(s)
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# 5 new

new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
# 6 new
