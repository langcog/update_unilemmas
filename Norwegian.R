library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Norwegian"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 745 Norwegian items"
# "333 missing uni_lemmas in original ( 45 % missing)"
# "388 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "8 uni_lemmas still missing ( 1 % missing)"
# "Review 44 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

# ToDo: reject a lot of the new uni-lemmas that don't match old (e.g. bunny, not rabbit)
new_items[which(new_items$definition=="kanin"),]$uni_lemma = "bunny"
new_items[which(new_items$definition=="kattunge"),]$uni_lemma = "kitty"
new_items[which(new_items$definition=="veps"),]$uni_lemma = "wasp" # wasp / bee?
new_items[which(new_items$definition=="klosser"),]$uni_lemma = "blocks"
new_items[which(new_items$definition=="fargeblyant"),]$uni_lemma = "pen/pencil" # colored pencil..maybe crayon?
new_items[which(new_items$definition=="corn flakes"),]$uni_lemma = "cheerios" # cheerios is our generic
new_items[which(new_items$definition=="gulrot"),]$uni_lemma = "carrot"
new_items[which(new_items$definition=="knapper"),]$uni_lemma = "button (object)"
new_items[which(new_items$definition=="regntøy"),]$uni_lemma = "coat" # 'rainwear'
new_items[which(new_items$definition=="støvler"),]$uni_lemma = "boot"
new_items[which(new_items$definition=="votter"),]$uni_lemma = "mitten"
new_items[which(new_items$definition=="mage"),]$uni_lemma = "tummy"
new_items[which(new_items$definition=="tenner"),]$uni_lemma = "tooth"
new_items[which(new_items$definition=="lommebok"),]$uni_lemma = "wallet" # not purse..
new_items[which(new_items$definition=="veske"),]$uni_lemma = "bag"
new_items[which(new_items$definition=="trapp"),]$uni_lemma = "stairs"
new_items[which(new_items$definition=="TV"),]$uni_lemma = "TV"
new_items[which(new_items$definition=="butikk"),]$uni_lemma = "store"
new_items[which(new_items$definition=="jeg"),]$uni_lemma = "I"
new_items[which(new_items$definition=="pappa"),]$uni_lemma = "daddy"
new_items[which(new_items$definition=="mennesker"),]$uni_lemma = "person"
new_items[which(new_items$definition=="bade"),]$uni_lemma = "bath"
new_items[which(new_items$definition=="sovetid"),]$uni_lemma = "nap" # or 'bedtime'
new_items[which(new_items$definition=="hente"),]$uni_lemma = "get" # or 'fetch'
new_items[which(new_items$definition=="huske (action)"),]$uni_lemma = "remember" # not 'swing'
new_items[which(new_items$definition=="legge"),]$uni_lemma = "put" # or lay
new_items[which(new_items$definition=="rydde"),]$uni_lemma = "clean (action)" 
new_items[which(new_items$definition=="dra"),]$uni_lemma = "go" # or leave
new_items[which(new_items$definition=="ødelegge"),]$uni_lemma = "break"
new_items[which(new_items$definition=="ekkelt"),]$uni_lemma = "yucky" # or disgusting
new_items[which(new_items$definition=="frekk"),]$uni_lemma = "bad" # or rude
new_items[which(new_items$definition=="hard"),]$uni_lemma = "hard"
new_items[which(new_items$definition=="ødelagt"),]$uni_lemma = "broken"
new_items[which(new_items$definition=="slem"),]$uni_lemma = "naughty" # or mean
new_items[which(new_items$definition=="varm"),]$uni_lemma = "hot"
new_items[which(new_items$definition=="min"),]$uni_lemma = "my"
new_items[which(new_items$definition=="av"),]$uni_lemma = "of"
new_items[which(new_items$definition=="ute (location)"),]$uni_lemma = "outside" # or out
new_items[which(new_items$definition=="alle"),]$uni_lemma = "all"
new_items[which(new_items$definition=="noe"),]$uni_lemma = "something" # or anything
new_items[which(new_items$definition=="noen"),]$uni_lemma = "any" # some or any
new_items[which(new_items$definition=="(farge)blyant"),]$uni_lemma = "crayon" # (color) pencil
new_items[which(new_items$definition=="grei"),]$uni_lemma = "kind"
new_items[which(new_items$definition=="sliten"),]$uni_lemma = "tired"

new_items[which(new_items$definition=="plastilina"),]$uni_lemma = "play dough"
new_items[which(new_items$definition=="matpakke"),]$uni_lemma = "lunchbox"
new_items[which(new_items$uni_lemma=="gift"),]$uni_lemma = "present"
new_items[which(new_items$uni_lemma=="kind"),]$uni_lemma = "nice"

new_items[which(new_items$uni_lemma=="brawl "),]$uni_lemma = "fight"
new_items[which(new_items$uni_lemma=="cinema "),]$uni_lemma = "movie"
new_items[which(new_items$uni_lemma=="PC"),]$uni_lemma = "computer"
new_items[which(new_items$uni_lemma=="afterwards "),]$uni_lemma = "after"
new_items[which(new_items$uni_lemma=="breathing "),]$uni_lemma = "breathe"
new_items[which(new_items$uni_lemma=="crispbread"),]$uni_lemma = "cracker"
new_items[which(new_items$uni_lemma=="at home "),]$uni_lemma = "home"
new_items[which(new_items$uni_lemma=="meatballs"),]$uni_lemma = "meatball"
new_items[which(new_items$uni_lemma=="on the outside"),]$uni_lemma = "outside"
new_items[which(new_items$uni_lemma=="pet names"),]$uni_lemma = "pet's name"
new_items[which(new_items$uni_lemma=="paint "),]$uni_lemma = "paint (action)"
new_items[which(new_items$uni_lemma=="dress "),]$uni_lemma = "dress (action)"
new_items[which(new_items$uni_lemma=="attempt "),]$uni_lemma = "try"
new_items[which(new_items$uni_lemma=="work "),]$uni_lemma = "work (action)"
new_items[which(new_items$uni_lemma=="weird"),]$uni_lemma = "strange"
new_items[which(new_items$uni_lemma=="wanted"),]$uni_lemma = "want"
new_items[which(new_items$uni_lemma=="wake up "),]$uni_lemma = "wake"
new_items[which(new_items$uni_lemma=="underwear"),]$uni_lemma = "underpants"
new_items[which(new_items$uni_lemma=="spin around "),]$uni_lemma = "ring around the rosie"
new_items[which(new_items$uni_lemma=="slide "),]$uni_lemma = "slide (action)"
new_items[which(new_items$uni_lemma=="sandals"),]$uni_lemma = "sandal"
new_items[which(new_items$uni_lemma=="orange"),]$uni_lemma = "orange (description)"
new_items[which(new_items$uni_lemma=="burger "),]$uni_lemma = "hamburger"
new_items[which(new_items$uni_lemma=="had to "),]$uni_lemma = "has to"
new_items[which(new_items$uni_lemma=="button (object)"),]$uni_lemma = "button"
new_items[which(new_items$WS=="item_208"),]$uni_lemma = "back (body part)"
new_items[which(new_items$WS=="item_671"),]$uni_lemma = "back (location)"
new_items[which(new_items$uni_lemma=="keys"),]$uni_lemma = "key"

new_items[which(new_items$definition=="strømper"),]$uni_lemma = "tights"
new_items[which(new_items$uni_lemma=="lips"),]$uni_lemma = "lip"
new_items[which(new_items$uni_lemma=="glue "),]$uni_lemma = "glue (object)"
new_items[which(new_items$uni_lemma=="jigsaw puzzle "),]$uni_lemma = "puzzle"
new_items[which(new_items$uni_lemma=="hurt"),]$uni_lemma = "hurt (action)"

new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instruments
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "305 new uni-lemmas defined for Norwegian"
new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
# "13 new uni-lemmas defined for Norwegian"
# "blocks"    "boot"      "carrot"    "crayon"    "I"         "kind"      "mitten"    "of"        "remember"  "something"
# "TV"        "wallet"    "wasp"   