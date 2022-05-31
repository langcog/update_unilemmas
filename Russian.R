library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Russian"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 762 Russian items"
# "0 missing uni_lemmas in original ( 0 % missing)"
# "32 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "0 uni_lemmas still missing ( 0 % missing)"
# "Review 32 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$WS=="item_12"),]$uni_lemma = "buzz" # not bzzz
new_items[which(new_items$WS=="item_17"),]$uni_lemma = "ribbit" # not croak
new_items[which(new_items$WS=="item_211"),]$uni_lemma = "underwear" # not underpants
new_items[which(new_items$WS=="item_287"),]$uni_lemma = "TV" # capitalize
new_items[which(new_items$WS=="item_468"),]$uni_lemma = "lie down" # disambig 'lie'
new_items[which(new_items$WS=="item_627"),]$uni_lemma = "I" # capitalize
new_items[which(new_items$WS=="item_583"),]$uni_lemma = "painful" # vs. painfully
new_items[which(new_items$WS=="item_584"),]$uni_lemma = "quick" # vs. quickly/fast
new_items[which(new_items$WS=="item_585"),]$uni_lemma = "cheerful" # vs. cheerfully
new_items[which(new_items$WS=="item_586"),]$uni_lemma = "yummy" # vs. tastily / tasty
new_items[which(new_items$WS=="item_588"),]$uni_lemma = "bitter" # vs. bitterly
new_items[which(new_items$WS=="item_589"),]$uni_lemma = "hot"
new_items[which(new_items$WS=="item_590"),]$uni_lemma = "loud"
new_items[which(new_items$WS=="item_591"),]$uni_lemma = "dirty"
new_items[which(new_items$WS=="item_592"),]$uni_lemma = "sour"
new_items[which(new_items$WS=="item_593"),]$uni_lemma = "beautiful"
new_items[which(new_items$WS=="item_594"),]$uni_lemma = "wet"
new_items[which(new_items$WS=="item_595"),]$uni_lemma = "soft"
new_items[which(new_items$WS=="item_598"),]$uni_lemma = "careful"
new_items[which(new_items$WS=="item_599"),]$uni_lemma = "bad"
new_items[which(new_items$WS=="item_600"),]$uni_lemma = "strong"
new_items[which(new_items$WS=="item_601"),]$uni_lemma = "sweet"
new_items[which(new_items$WS=="item_602"),]$uni_lemma = "very" 
new_items[which(new_items$WS=="item_603"),]$uni_lemma = "dry"
new_items[which(new_items$WS=="item_604"),]$uni_lemma = "dark"
new_items[which(new_items$WS=="item_605"),]$uni_lemma = "warm"
new_items[which(new_items$WS=="item_606"),]$uni_lemma = "quiet"
new_items[which(new_items$WS=="item_607"),]$uni_lemma = "heavy"
new_items[which(new_items$WS=="item_608"),]$uni_lemma = "cold"
new_items[which(new_items$WS=="item_609"),]$uni_lemma = "good" # or 'well'
new_items[which(new_items$WS=="item_610"),]$uni_lemma = "clean"
new_items[which(new_items$WS=="item_727"),]$uni_lemma = "or" # vs. or else
new_items[which(new_items$uni_lemma=="eyelashes"),]$uni_lemma = "eyelash"
new_items[which(new_items$uni_lemma=="eyebrows"),]$uni_lemma = "eyebrow" 
new_items[which(new_items$uni_lemma=="back (object)"),]$uni_lemma = "back (body part)" 
new_items[which(new_items$uni_lemma=="country house"),]$uni_lemma = "cabin" 
new_items[which(new_items$uni_lemma=="cheerful"),]$uni_lemma = "happy" 
new_items[which(new_items$uni_lemma=="carrots"),]$uni_lemma = "carrot"
new_items[which(new_items$uni_lemma=="in order to"),]$uni_lemma = "to"
new_items[which(new_items$uni_lemma=="[possessive]"),]$uni_lemma = "at" # "at/in "for example, at Anya's place" 
new_items[which(new_items$uni_lemma=="woods"),]$uni_lemma = "forest"
new_items[which(new_items$uni_lemma=="which (conjunction)"),]$uni_lemma = "which (connecting)"
new_items[which(new_items$uni_lemma=="vitamins"),]$uni_lemma = "vitamin"
new_items[which(new_items$uni_lemma=="underwear"),]$uni_lemma = "underpants"
new_items[which(new_items$uni_lemma=="tire"),]$uni_lemma = "tire (action)"
new_items[which(new_items$uni_lemma=="clean"),]$uni_lemma = "clean (description)"
new_items[which(new_items$uni_lemma=="stomp stomp"),]$uni_lemma = "stomp"
new_items[which(new_items$uni_lemma=="sss"),]$uni_lemma = "hiss"
new_items[which(new_items$uni_lemma=="brother's name"),]$uni_lemma = "brother" # OK?
new_items[which(new_items$uni_lemma=="sister's name"),]$uni_lemma = "sister" # OK?
new_items[which(new_items$uni_lemma=="sandals"),]$uni_lemma = "sandal"
new_items[which(new_items$uni_lemma=="rake"),]$uni_lemma = "rake (object)"





# save updated instrument(s)
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# 17 new uni-lemmas defined for Russian

new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
# 15 new uni-lemmas
