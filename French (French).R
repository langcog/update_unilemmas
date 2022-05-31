library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "French (French)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 764 French (French) items"
# "204 missing uni_lemmas in original ( 27 % missing)"
# "176 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "25 uni_lemmas still missing ( 3 % missing)"
# "Review 2 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
#WS       WG   category definition   gloss uni_lemma new_gloss new_uni_lemma notes
# item_300 item_544 food_drink    compote compote   compote                     jam      
# item_672 item_439   pronouns         je       i         i                       I  

# jam close enough to compote for George
new_items[which(new_items$definition=="compote"),]$uni_lemma = "jam"

new_items[which(new_items$uni_lemma=="nuts"),]$uni_lemma = "nut"

# capitalization
new_items[which(new_items$definition=="je"),]$uni_lemma = "I"
new_items[which(new_items$uni_lemma=="carrots"),]$uni_lemma = "carrot"
new_items[which(new_items$uni_lemma=="skate (action)"),]$uni_lemma = "skate"
new_items[which(new_items$uni_lemma=="tv"),]$uni_lemma = "TV"
new_items[which(new_items$uni_lemma=="sneakers"),]$uni_lemma = "sneaker"
new_items[which(new_items$uni_lemma=="photos"),]$uni_lemma = "photo"
new_items[which(new_items$uni_lemma=="mop"),]$uni_lemma = "mop (object)"


subset(new_items, uni_lemma=="")

# save updated instrument(s)
new_wg <- update_instrument("French_French", "WG", new_items %>% rename(itemID = WG))
# "133 new uni-lemmas defined for French_French"
new_ws <- update_instrument("French_French", "WS", new_items %>% rename(itemID = WS))
# "135 new uni-lemmas defined for French_French"
