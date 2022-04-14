library(wordbankr)
library(tidyverse)

language = "English (Australian)"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 558 English (Australian) items"
# "107 missing uni_lemmas in original ( 0.19 % missing)"
# "101 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "7 uni_lemmas still missing ( 0.01 % missing)"
# "Review 1 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
#WS category definition  gloss uni_lemma new_gloss new_uni_lemma notes
# item_82     toys     puzzle puzzle   present        NA        puzzle    NA

# fix error
new_items[which(new_items$definition=="puzzle"),]$uni_lemma = "puzzle"
