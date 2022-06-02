library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Spanish (Peruvian)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 648 Spanish (Peruvian) items"
# "22 missing uni_lemmas in original ( 3 % missing)"
# "0 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "0 uni_lemmas still missing ( 0 % missing)"

#new_items[which(new_items$definition=="tv"),]$uni_lemma = "TV"
new_items[which(new_items$uni_lemma=="earth"),]$uni_lemma = "sand" # or soil ?



# save updated instruments
new_ws <- update_instrument("Spanish_Peruvian", "WS", new_items %>% rename(itemID = WS))
# "148 new uni-lemmas defined for Spanish_Peruvian"

new_wg <- update_instrument("Spanish_Peruvian", "WG", new_items %>% rename(itemID = WG))
# "56 new uni-lemmas defined for Spanish_Peruvian"
