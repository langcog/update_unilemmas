library(wordbankr)
library(tidyverse)

language = "English (British)"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 541 English (British) items"
# "6 missing uni_lemmas in original ( 1 % missing)"
# "85 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "4 uni_lemmas still missing ( 1 % missing)"
# "Review 1 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
#Oxford TEDS_Twos TEDS_Threes category definition gloss uni_lemma new_gloss new_uni_lemma notes
# item_388                    pronouns          I     I         i                    I      

# capitalization
new_items[which(new_items$definition=="I"),]$uni_lemma = "I"