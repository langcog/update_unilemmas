library(wordbankr)
library(tidyverse)

language = "French (French)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 764 French (French) items"
# "204 missing uni_lemmas in original ( 27 % missing)"
# "176 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "34 uni_lemmas still missing ( 4 % missing)"
# "Review 2 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
#WS       WG   category definition   gloss uni_lemma new_gloss new_uni_lemma notes
# item_300 item_544 food_drink    compote compote   compote                     jam      
# item_672 item_439   pronouns         je       i         i                       I  

# jam close enough to compote for George
new_items[which(new_items$definition=="compote"),]$uni_lemma = "jam"

# capitalization
new_items[which(new_items$definition=="je"),]$uni_lemma = "I"

subset(new_items, uni_lemma=="")
# ToDo: go back to spreadsheet -- missing e.g. 'baa baa' and 'woof woof'

# save updated instrument(s)
new_wg <- update_instrument("French_French", "WG", new_items %>% rename(itemID = WG))
# "128 new uni-lemmas defined for French_French"
new_ws <- update_instrument("French_French", "WS", new_items %>% rename(itemID = WS))
# "129 new uni-lemmas defined for French_French"
