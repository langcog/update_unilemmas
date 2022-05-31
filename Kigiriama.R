library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Kigiriama"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 773 Kigiriama items"
# "428 missing uni_lemmas in original ( 55 % missing)"
# "303 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "144 uni_lemmas still missing ( 19 % missing)"
# "Review 14 suggested new_uni_lemmas

new_items[which(new_items$WS=="item_1"),]$uni_lemma = "baa baa" # sound, not animal
new_items[which(new_items$WS=="item_4"),]$uni_lemma = "quack quack" # sound, not animal
new_items[which(new_items$WS=="item_5"),]$uni_lemma = "hee haw" # sound, not animal
new_items[which(new_items$WS=="item_6"),]$uni_lemma = "woof woof" # sound, not animal
new_items[which(new_items$WS=="item_12"),]$uni_lemma = "baa baa" # goat -- close enough to sheep?
new_items[which(new_items$uni_lemma=="bedsheet"),]$uni_lemma = "sheet"
new_items[which(new_items$uni_lemma=="nap (action)"),]$uni_lemma = "nap"
new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police" 
new_items[which(new_items$uni_lemma=="marketplace"),]$uni_lemma = "market" 
new_items[which(new_items$uni_lemma=="longlasting"),]$uni_lemma = "tough" # or durable  
new_items[which(new_items$uni_lemma=="palm (body part)"),]$uni_lemma = "palm" 
new_items[which(new_items$uni_lemma=="sink (object)"),]$uni_lemma = "sink"
new_items[which(new_items$uni_lemma=="dress"),]$uni_lemma = "dress (object)"
new_items[which(new_items$uni_lemma=="work"),]$uni_lemma = "work (action)"
new_items[which(new_items$uni_lemma=="what (question)"),]$uni_lemma = "what"
new_items[which(new_items$uni_lemma=="underwear"),]$uni_lemma = "underpants"
new_items[which(new_items$uni_lemma=="peep peep"),]$uni_lemma = "tweet tweet"
new_items[which(new_items$uni_lemma=="tortoise"),]$uni_lemma = "turtle"
new_items[which(new_items$uni_lemma=="sweet"),]$uni_lemma = "sweets" # food (noun, not adj)
new_items[which(new_items$uni_lemma=="sandals"),]$uni_lemma = "sandal"
new_items[which(new_items$uni_lemma=="light"),]$uni_lemma = "light (object)"


# ToDo: check empty uni-lemmas ("")
new_items[which(new_items$uni_lemma==""),]
new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instrument(s)
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "527 new uni-lemmas defined for Kigiriama"

new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
# "253 new uni-lemmas defined for Kigiriama"
