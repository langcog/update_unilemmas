library(wordbankr)
library(tidyverse)

language = "English (American)"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 683 English (American) items"
# "0 missing uni_lemmas in original ( 0 % missing)"
# "1 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "0 uni_lemmas still missing ( 0 % missing)"
# "Review 1 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
# WS       WG        category definition gloss uni_lemma new_gloss new_uni_lemma                              notes
# item_291 item_190 furniture_rooms         TV    TV        TV        NA            tv most languages have it lower-cased

# capitalization
new_items[which(new_items$definition=="TV"),]$uni_lemma = "tv"