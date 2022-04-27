library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "English (American)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 683 English (American) items"
# "0 missing uni_lemmas in original ( 0 % missing)"
# "0 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "0 uni_lemmas still missing ( 0 % missing)"

# save updated instrument(s)
new_ws <- update_instrument("English", "WS", new_items %>% rename(itemID = WS))
# "1 new uni-lemmas defined for English"
# "pastry"

# ToDo: check why don't itemIDs/definitions match??
new_wg <- update_instrument("English", "WG", new_items %>% rename(itemID = WG))
# "All itemIDs accounted for in new file: FALSE"
# "All definitions accounted for in new file: FALSE"
# "2 new uni-lemmas defined for English"
# "I"  "TV"