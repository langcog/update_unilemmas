library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Korean"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 720 Korean items"
# "259 missing uni_lemmas in original ( 36 % missing)"
# "242 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "44 uni_lemmas still missing ( 6 % missing)"
# "Review 24 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$WS=="item_98"),]$uni_lemma = "underwear" # not underpants
new_items[which(new_items$WS=="item_129"),]$uni_lemma = "pasta" # vs. noodles
new_items[which(new_items$WS=="item_183"),]$uni_lemma = "back (body part)" # disambig
new_items[which(new_items$WS=="item_230"),]$uni_lemma = "key" # singular
new_items[which(new_items$WS=="item_237"),]$uni_lemma = "wallet" # vs. purse
new_items[which(new_items$WS=="item_315"),]$uni_lemma = "again"
new_items[which(new_items$WS=="item_326"),]$uni_lemma = "police" # not policeman
new_items[which(new_items$WS=="item_382"),]$uni_lemma = "remove" # vs. take out
new_items[which(new_items$WS=="item_395"),]$uni_lemma = "fall down" # vs. fall
new_items[which(new_items$WS=="item_400"),]$uni_lemma = "lie down" # vs. lie
new_items[which(new_items$WS=="item_534"),]$uni_lemma = "hot (temperature)"
new_items[which(new_items$WS=="item_537"),]$uni_lemma = "yummy" # vs. tasty
new_items[which(new_items$WS=="item_549"),]$uni_lemma = "dislike"
new_items[which(new_items$WS=="item_556"),]$uni_lemma = "there is"
new_items[which(new_items$WS=="item_558"),]$uni_lemma = "fun"
new_items[which(new_items$WS=="item_565"),]$uni_lemma = "kind"
new_items[which(new_items$WS=="item_595"),]$uni_lemma = "at" # at/in
new_items[which(new_items$WS=="item_604"),]$uni_lemma = "back (location)"
new_items[which(new_items$WS=="item_607"),]$uni_lemma = "below"
new_items[which(new_items$WS=="item_630"),]$uni_lemma = "I" # capitalize
new_items[which(new_items$WG=="item_12"),]$uni_lemma = "buzz" # vs. bzzz
new_items[which(new_items$WG=="item_97"),]$uni_lemma = "meal" 
new_items[which(new_items$WG=="item_148"),]$uni_lemma = "inside"
new_items[which(new_items$WG=="item_238"),]$uni_lemma = "won't do" # I won't..

new_items[which(new_items$uni_lemma=="well"),]$uni_lemma = "well (modifier)" 

# ToDo: check blanks ("") and "at/in/on"
subset(new_items, uni_lemma=="")
new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instrument(s)
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "195 new uni-lemmas defined for Korean"

new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
# "42 new uni-lemmas defined for Korean"