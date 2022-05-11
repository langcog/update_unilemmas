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
new_items[which(new_items$WS=="item_81"),]$uni_lemma = "sandbox"
new_items[which(new_items$WS=="item_84"),]$uni_lemma = "blocks"
new_items[which(new_items$WS=="item_91"),]$uni_lemma = "play dough"
new_items[which(new_items$WS=="item_105"),]$uni_lemma = "hot dog"
new_items[which(new_items$WS=="item_115"),]$uni_lemma = "hot chocolate" # or cocoa?
new_items[which(new_items$WS=="item_127"),]$uni_lemma = "pasta"
new_items[which(new_items$WS=="item_129"),]$uni_lemma = "pudding"
new_items[which(new_items$WS=="item_131"),]$uni_lemma = "blueberry"
new_items[which(new_items$WS=="item_137"),]$uni_lemma = "dumpling"
new_items[which(new_items$WS=="item_142"),]$uni_lemma = "raisin"
new_items[which(new_items$WS=="item_146"),]$uni_lemma = "mushroom"
new_items[which(new_items$WS=="item_147"),]$uni_lemma = "cottage cheese"
new_items[which(new_items$WS=="item_157"),]$uni_lemma = "berry"
new_items[which(new_items$WS=="item_159"),]$uni_lemma = "chicken (food)"
new_items[which(new_items$WS=="item_164"),]$uni_lemma = "shoe"
new_items[which(new_items$WS=="item_166"),]$uni_lemma = "pants"
new_items[which(new_items$WS=="item_168"),]$uni_lemma = "boot"
new_items[which(new_items$WS=="item_170"),]$uni_lemma = "mitten"
new_items[which(new_items$WS=="item_171"),]$uni_lemma = "slipper"
new_items[which(new_items$WS=="item_173"),]$uni_lemma = "jacket"
new_items[which(new_items$WS=="item_175"),]$uni_lemma = "sneaker"
new_items[which(new_items$WS=="item_176"),]$uni_lemma = "dress (object)"
new_items[which(new_items$WS=="item_182"),]$uni_lemma = "diaper"
new_items[which(new_items$WS=="item_184"),]$uni_lemma = "glove"
new_items[which(new_items$WS=="item_186"),]$uni_lemma = "sandal"
new_items[which(new_items$WS=="item_190"),]$uni_lemma = "boot"
new_items[which(new_items$WS=="item_193"),]$uni_lemma = "eye"
new_items[which(new_items$WS=="item_194"),]$uni_lemma = "ear"
# ToDo: finish, or perhaps edit Google spreadsheet directly...
