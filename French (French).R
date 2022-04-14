library(wordbankr)
library(tidyverse)

language = "French (French)"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 764 French (French) items"
# "204 missing uni_lemmas in original ( 0.27 % missing)"
# "176 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "34 uni_lemmas still missing ( 0.04 % missing)"
# "Review 2 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
#WS       WG   category definition   gloss uni_lemma new_gloss new_uni_lemma notes
# item_300 item_544 food_drink    compote compote   compote                     jam      
# item_672 item_439   pronouns         je       i         i                       I  

# jam close enough to compote for George
new_items[which(new_items$definition=="compote"),]$uni_lemma = "jam"

# capitalization
new_items[which(new_items$definition=="je"),]$uni_lemma = "I"