library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Mandarin (Taiwanese)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 696 Mandarin (Taiwanese) items"
# "63 missing uni_lemmas in original ( 9 % missing)"
# "48 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "15 uni_lemmas still missing ( 2 % missing)"


new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

new_ws <- update_instrument("Mandarin_Taiwanese", "WS", new_items %>% rename(itemID = WS))
# 621 new
new_wg <- update_instrument("Mandarin_Taiwanese", "WG", new_items %>% rename(itemID = WG))
# 7 new

