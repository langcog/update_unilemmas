library(wordbankr)
library(tidyverse)

language = "Czech"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 553 Czech items"
# "75 missing uni_lemmas in original ( 14 % missing)"
# "47 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "28 uni_lemmas still missing ( 5 % missing)"
# "Review 0 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"