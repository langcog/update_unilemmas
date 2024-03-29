library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Kiswahili"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 763 Kiswahili items"
# "225 missing uni_lemmas in original ( 29 % missing)"
# "176 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "67 uni_lemmas still missing ( 9 % missing)"
# "Review 17 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$WS=="item_92"),]$uni_lemma = "ice" # not snow
new_items[which(new_items$WS=="item_100"),]$uni_lemma = "salt" # 
new_items[which(new_items$WS=="item_182"),]$uni_lemma = "dress (object)" # 
new_items[which(new_items$WS=="item_188"),]$uni_lemma = "clothes" # 
new_items[which(new_items$WS=="item_198"),]$uni_lemma = "t-shirt" # 
new_items[which(new_items$WS=="item_364"),]$uni_lemma = "child" # 
new_items[which(new_items$WS=="item_388"),]$uni_lemma = "sorry" # 
new_items[which(new_items$WS=="item_419"),]$uni_lemma = "do" # 
new_items[which(new_items$WS=="item_498"),]$uni_lemma = "bite" # 
new_items[which(new_items$WS=="item_508"),]$uni_lemma = "rotten" # 
new_items[which(new_items$WS=="item_512"),]$uni_lemma = "little (description)" # 
new_items[which(new_items$WS=="item_549"),]$uni_lemma = "ok" # 
new_items[which(new_items$WS=="item_692"),]$uni_lemma = "same" # 
new_items[which(new_items$WG=="item_9"),]$uni_lemma = "ouch" # 
new_items[which(new_items$WG=="item_15"),]$uni_lemma = "vroom" # car sound?
new_items[which(new_items$WG=="item_96"),]$uni_lemma = "pants" # 
new_items[which(new_items$WG=="item_206"),]$uni_lemma = "how are you" # 

new_items[which(new_items$uni_lemma=="bedsheet"),]$uni_lemma = "sheet"
new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police" 
new_items[which(new_items$uni_lemma=="carrots"),]$uni_lemma = "carrot"
new_items[which(new_items$uni_lemma=="durable"),]$uni_lemma = "tough"
new_items[which(new_items$uni_lemma=="tv"),]$uni_lemma = "TV"
new_items[which(new_items$uni_lemma=="village"),]$uni_lemma = "town"
new_items[which(new_items$uni_lemma=="sandals"),]$uni_lemma = "sandal"
new_items[which(new_items$uni_lemma=="feet"),]$uni_lemma = "foot"
new_items[which(new_items$uni_lemma=="call on phone"),]$uni_lemma = "call"
new_items[which(new_items$uni_lemma=="bat"),]$uni_lemma = "bat (animal)"
new_items[which(new_items$uni_lemma=="phone"),]$uni_lemma = "telephone"
new_items[which(new_items$uni_lemma=="back" & new_items$category=="body_parts"),]$uni_lemma = "back (body part)"
new_items[which(new_items$uni_lemma=="back"),]$uni_lemma = "back (preposition)"
new_items[which(new_items$uni_lemma=="keys"),]$uni_lemma = "key"

new_items[which(new_items$uni_lemma=="lips"),]$uni_lemma = "lip"
new_items[which(new_items$uni_lemma=="glue"),]$uni_lemma = "glue (object)"
new_items[which(new_items$uni_lemma=="wet"),]$uni_lemma = "wet (description)"

# ToDo: check empty uni-lemmas ("")
subset(new_items, uni_lemma=="")
new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA


# save updated instrument(s)
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "131 new uni-lemmas defined for Kiswahili"

new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
# "61 new uni-lemmas defined for Kiswahili"