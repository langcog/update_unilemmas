library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Spanish (European)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 661 Spanish (European) items"
# "31 missing uni_lemmas in original ( 5 % missing)"
# "4 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "31 uni_lemmas still missing ( 5 % missing)" 
# "Review 4 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"


new_items[which(new_items$definition=="guantes"),]$uni_lemma = "glove" # plural->singular 
new_items[which(new_items$definition=="pendientes"),]$uni_lemma = "earring" # plural->singular
new_items[which(new_items$definition=="zapatilla/s"),]$uni_lemma = "sneaker" # plural->singular
new_items[which(new_items$definition=="yo"),]$uni_lemma = "I" # uppercase 

new_items[which(new_items$definition=="uvas"),]$uni_lemma = "grapes" # most forms use plural 

new_items[which(new_items$uni_lemma==""),] # 31 undefined uni-lemmas
# many of which are games/routines (e.g., palmas palmitas -> high five?? is 'pupa' go potty?)
# sounds (e.g., we need a siren noise (wee-ooo?): Spanish: "nino-nino (sirena)"),
# or food/drink (e.g., puré, colacao, and nesquic (cocoa? close enough?))
# wolf noise: "auuuu (lobo)"
# beee <- is this goat, or sheep?

new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

new_items[which(new_items$definition=="colacao"),]$uni_lemma = "cocoa" # close enough? or nesquic better? 
new_items[which(new_items$uni_lemma=="which"),]$uni_lemma = "which (question)"
new_items[which(new_items$uni_lemma=="where"),]$uni_lemma = "where (question)"
new_items[which(new_items$uni_lemma=="bogeyman"),]$uni_lemma = "boogeyman"
new_items[which(new_items$uni_lemma=="bathe (action)"),]$uni_lemma = "bathe"
new_items[which(new_items$uni_lemma=="cook (action)"),]$uni_lemma = "cook"
new_items[which(new_items$uni_lemma=="fit (action)"),]$uni_lemma = "fit"
new_items[which(new_items$uni_lemma=="fish"),]$uni_lemma = "fish (food)"
new_items[which(new_items$uni_lemma=="eat (action)"),]$uni_lemma = "eat"
new_items[which(new_items$uni_lemma=="eat dinner"),]$uni_lemma = "dine"
new_items[which(new_items$uni_lemma=="cover"),]$uni_lemma = "cover (action)"
new_items[which(new_items$uni_lemma=="countryside"),]$uni_lemma = "country"
new_items[which(new_items$uni_lemma=="kisses"),]$uni_lemma = "kiss"
new_items[which(new_items$uni_lemma=="grow (action)"),]$uni_lemma = "grow"
new_items[which(new_items$uni_lemma=="lentils"),]$uni_lemma = "beans"
new_items[which(new_items$uni_lemma=="sleep (action)"),]$uni_lemma = "sleep"
new_items[which(new_items$uni_lemma=="remote"),]$uni_lemma = "remote control"
new_items[which(new_items$uni_lemma=="sink (object)"),]$uni_lemma = "sink"
new_items[which(new_items$uni_lemma=="paint"),]$uni_lemma = "paint (action)"
new_items[which(new_items$uni_lemma=="dress"),]$uni_lemma = "dress (object)"
new_items[which(new_items$uni_lemma=="shower (object)"),]$uni_lemma = "shower"
new_items[which(new_items$uni_lemma=="not that"),]$uni_lemma = "don't"
new_items[which(new_items$uni_lemma=="work"),]$uni_lemma = "work (action)"
new_items[which(new_items$uni_lemma=="when"),]$uni_lemma = "when (question)"
new_items[which(new_items$uni_lemma=="washer"),]$uni_lemma = "washing machine"
new_items[which(new_items$uni_lemma=="toy"),]$uni_lemma = "toy (object)"
new_items[which(new_items$uni_lemma=="swing"),]$uni_lemma = "swing (object)"

# save updated instruments
new_ws <- update_instrument("Spanish_European", "WS", new_items %>% rename(itemID = WS))
# "510 new uni-lemmas defined for Spanish_European"
new_wg <- update_instrument("Spanish_European", "WG", new_items %>% rename(itemID = WG))
# "16 new uni-lemmas defined for Spanish_European"
# "all done"         "brush (object)"   "clip clop"        "dress (action)"   "earring"         
# "for me"           "goal"             "I"                "lower (action)"   "nasty"            "on (description)"
# "poop"             "scared"           "see (action)"     "sneaker"          "wow"             
