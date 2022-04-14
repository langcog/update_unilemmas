library(wordbankr)
library(tidyverse)

language = "Danish"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 727 Danish items"
# "304 missing uni_lemmas in original ( 0.42 % missing)"
# "255 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "55 uni_lemmas still missing ( 0.08 % missing)"
# "Review 2 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
# WS       WG category        definition                  gloss            uni_lemma new_gloss     new_uni_lemma
# item_377 item_246   people dagplejemors navn day care mother's name babysitter<92>s name           babysitter's name
# item_623 item_368 pronouns               jeg                      I                    i                           I