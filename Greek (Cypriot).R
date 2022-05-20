library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Greek (Cypriot)"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 818 Greek (Cypriot) items"
# "293 missing uni_lemmas in original ( 36 % missing)"
# "217 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "80 uni_lemmas still missing ( 10 % missing)"
# "Review 4 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$WS=="item_2"),]$uni_lemma = "ribbit" # 'quack' was wrong..
new_items[which(new_items$WS=="item_170"),]$uni_lemma = "green beans" # form also has beans, so keep green beans
new_items[which(new_items$WS=="item_299"),]$uni_lemma = "TV" # capitalize
new_items[which(new_items$WS=="item_682"),]$uni_lemma = "I" # capitalize

#new_items[which(new_items$uni_lemma=="light blue"),]$uni_lemma = "blue" 
new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police" 
new_items[which(new_items$uni_lemma=="tasty"),]$uni_lemma = "yummy"
new_items[which(new_items$uni_lemma=="bye bye"),]$uni_lemma = "bye"

new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instrument(s)
new_ws <- update_instrument("Greek_Cypriot", "WS", new_items %>% rename(itemID = WS))
# "132 new uni-lemmas defined for Greek_Cypriot"
