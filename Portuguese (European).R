library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Portuguese (European)"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 664 Portuguese (European) items"
# "148 missing uni_lemmas in original ( 22 % missing)"
# "113 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "40 uni_lemmas still missing ( 6 % missing)"
# "Review 4 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$WS=="item_309"),]$uni_lemma = "TV" # capitalize
new_items[which(new_items$WS=="item_371"),]$uni_lemma = "man" # 
new_items[which(new_items$WS=="item_439"),]$uni_lemma = "lie down" # disambig 'lie'
new_items[which(new_items$WS=="item_561"),]$uni_lemma = "I" # capitalize

# ToDo: look at blanks
subset(new_items, uni_lemma=="")

# save updated instrument(s)
new_wg <- update_instrument("Portuguese_European", "WG", new_items %>% rename(itemID = WG))
# "287 new uni-lemmas defined for Portuguese_European"
new_ws <- update_instrument("Portuguese_European", "WS", new_items %>% rename(itemID = WS))
# "525 new uni-lemmas defined for Portuguese_European"
