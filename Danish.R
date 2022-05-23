library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Danish"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 727 Danish items"
# "304 missing uni_lemmas in original ( 42 % missing)"
# "255 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "55 uni_lemmas still missing ( 8 % missing)"
# "Review 2 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
# WS       WG category        definition                  gloss            uni_lemma new_gloss     new_uni_lemma
# item_377 item_246   people dagplejemors navn day care mother's name babysitter<92>s name           babysitter's name
# item_623 item_368 pronouns               jeg                      I                    i                           I

new_items[which(new_items$definition=="jeg"),]$uni_lemma = "I"
new_items[which(new_items$definition=="dagplejemors navn"),]$uni_lemma = "babysitter's name"

new_items[which(new_items$uni_lemma=="nuts"),]$uni_lemma = "nut"
new_items[which(new_items$uni_lemma=="carrots"),]$uni_lemma = "carrot"

new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instrument(s)
new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
# "2 new uni-lemmas defined for Danish"
# "I"  "TV"
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "215 new uni-lemmas defined for Danish"