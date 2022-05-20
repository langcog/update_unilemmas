library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Latvian"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 806 Latvian items"
# "23 missing uni_lemmas in original ( 3 % missing)"
# "146 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "11 uni_lemmas still missing ( 1 % missing)"
# "Review 127 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$WS=="item_1"),]$uni_lemma = "ouch"
new_items[which(new_items$WS=="item_3"),]$uni_lemma = "vroom"
new_items[which(new_items$WS=="item_8"),]$uni_lemma = "cockadoodledoo"
new_items[which(new_items$WS=="item_10"),]$uni_lemma = "coo coo"
new_items[which(new_items$WS=="item_11"),]$uni_lemma = "ribbit"
new_items[which(new_items$WS=="item_115"),]$uni_lemma = "hot chocolate" # or cocoa?
new_items[which(new_items$WS=="item_127"),]$uni_lemma = "pasta"
new_items[which(new_items$WS=="item_129"),]$uni_lemma = "pudding"
new_items[which(new_items$WS=="item_131"),]$uni_lemma = "blueberry"
new_items[which(new_items$WS=="item_137"),]$uni_lemma = "dumpling"
new_items[which(new_items$WS=="item_142"),]$uni_lemma = "raisin"
new_items[which(new_items$WS=="item_146"),]$uni_lemma = "mushroom"
new_items[which(new_items$WS=="item_371"),]$uni_lemma = "babysitter"
new_items[which(new_items$WS=="item_372"),]$uni_lemma = "child's own name"
new_items[which(new_items$WS=="item_378"),]$uni_lemma = "friend"
new_items[which(new_items$WS=="item_379"),]$uni_lemma = "friend"
new_items[which(new_items$WS=="item_409"),]$uni_lemma = "hello"
new_items[which(new_items$WS=="item_426"),]$uni_lemma = "fear"
new_items[which(new_items$WS=="item_450"),]$uni_lemma = "dress (action)"
new_items[which(new_items$WS=="item_493"),]$uni_lemma = "hurt"
new_items[which(new_items$WS=="item_502"),]$uni_lemma = "wipe" # or sweep
new_items[which(new_items$WS=="item_517"),]$uni_lemma = "brush (action)" # or comb
new_items[which(new_items$WS=="item_520"),]$uni_lemma = "say" # or tell
new_items[which(new_items$WS=="item_555"),]$uni_lemma = "calm"
new_items[which(new_items$WS=="item_564"),]$uni_lemma = "nude" # or naked
new_items[which(new_items$WS=="item_573"),]$uni_lemma = "pretty" # or beautiful
new_items[which(new_items$WS=="item_582"),]$uni_lemma = "far away" # far?

new_items[which(new_items$WS=="item_589"),]$uni_lemma = "light" # or easy
new_items[which(new_items$WS=="item_610"),]$uni_lemma = "" # pronouns..
new_items[which(new_items$WS=="item_611"),]$uni_lemma = ""
new_items[which(new_items$WS=="item_612"),]$uni_lemma = ""
new_items[which(new_items$WS=="item_613"),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""
new_items[which(new_items$WS==""),]$uni_lemma = ""

new_items[which(new_items$WS=="item_337"),]$uni_lemma = "yummy"
new_items[which(new_items$WS=="item_342"),]$uni_lemma = "good"
# ToDo: finish, or perhaps edit Google spreadsheet directly...
