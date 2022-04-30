library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Slovak"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 689 Slovak items"
# "257 missing uni_lemmas in original ( 37 % missing)"
# "204 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "72 uni_lemmas still missing ( 10 % missing)"
# "Review 11 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"


new_items[which(new_items$definition=="kakao / granko"),]$uni_lemma = "cocoa" # or "hot chocolate" ?
new_items[which(new_items$definition=="televízor"),]$uni_lemma = "TV" # capitalize
new_items[which(new_items$definition=="ležať / ľahnúť"),]$uni_lemma = "lay" # was 'lie'
new_items[which(new_items$definition=="otvoriť / zatvoriť"),]$uni_lemma = "close (action)" # disambig 'close'
new_items[which(new_items$definition=="volať"),]$uni_lemma = "call" # vs. 'shout'
new_items[which(new_items$definition=="vybrať"),]$uni_lemma = "pick (action)" # was 'take out'
new_items[which(new_items$definition=="zamknúť"),]$uni_lemma = "lock (action)" # disambig 'lock'
new_items[which(new_items$definition=="vzadu / dozadu"),]$uni_lemma = "back (location)" # disambig 'back'
new_items[which(new_items$definition=="koľko?"),]$uni_lemma = "how" # was 'how much'
new_items[which(new_items$definition=="kto to je?"),]$uni_lemma = "who" # was 'who's there?'
new_items[which(new_items$definition=="Dzdz (včela)"),]$uni_lemma = "buzz" # was 'bzzz' 


new_items[which(new_items$uni_lemma==""),] 
# ToDo: many undefined uni-lemmas, many sounds we need a native speaker to go back over!
# (and action_words, people, household, toys, vehicles...)

new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA


# save updated instruments
new_ws <- update_instrument("Slovak", "WS", new_items %>% rename(itemID = WS))
# "167 new uni-lemmas defined for Slovak"
new_wg <- update_instrument("Slovak", "WG", new_items %>% rename(itemID = WG))
# "56 new uni-lemmas defined for Slovak"