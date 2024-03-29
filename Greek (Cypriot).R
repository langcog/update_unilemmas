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
new_items[which(new_items$uni_lemma=="carrots"),]$uni_lemma = "carrot"
new_items[which(new_items$uni_lemma=="lentil"),]$uni_lemma = "beans"
new_items[which(new_items$uni_lemma=="sink (object)"),]$uni_lemma = "sink"
new_items[which(new_items$uni_lemma=="village"),]$uni_lemma = "town"
new_items[which(new_items$uni_lemma=="swing"),]$uni_lemma = "swing (action)"
new_items[which(new_items$WS=="item_104"),]$uni_lemma = "sweets" # noun (food), not adj
new_items[which(new_items$uni_lemma=="some more"),]$uni_lemma = "more"
new_items[which(new_items$uni_lemma=="flowerpot"),]$uni_lemma = "flower pot" 
new_items[which(new_items$uni_lemma=="call on phone"),]$uni_lemma = "call"
new_items[which(new_items$uni_lemma=="wardrobe"),]$uni_lemma = "closet"
new_items[which(new_items$uni_lemma=="keys"),]$uni_lemma = "key"

new_items[which(new_items$uni_lemma=="gloves"),]$uni_lemma = "glove"
new_items[which(new_items$uni_lemma=="lips"),]$uni_lemma = "lip"
new_items[which(new_items$uni_lemma=="glue"),]$uni_lemma = "glue (object)"
new_items[which(new_items$uni_lemma=="block"),]$uni_lemma = "blocks"

new_items[which(new_items$uni_lemma=="cabinet"),]$uni_lemma = "cupboard"


new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instrument(s)
new_ws <- update_instrument("Greek_Cypriot", "WS", new_items %>% rename(itemID = WS))
# "132 new uni-lemmas defined for Greek_Cypriot"
