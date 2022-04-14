library(wordbankr)
library(tidyverse)

language = "Cantonese"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 804 Cantonese items"
# "42 missing uni_lemmas in original ( 0.05 % missing)"
# "1 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "42 uni_lemmas still missing ( 0.05 % missing)"
# "Review 1 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
# WS category definition gloss uni_lemma new_gloss new_uni_lemma notes
#  1 item_339     toys  積木/Lego  <NA>      lego        NA        blocks    NA