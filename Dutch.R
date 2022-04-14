library(wordbankr)
library(tidyverse)

language = "Dutch"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 1075 Dutch items"
# "66 missing uni_lemmas in original ( 0.06 % missing)"
# "95 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "44 uni_lemmas still missing ( 0.04 % missing)"
# "Review 18 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"