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

# pronouns from here to line 64
new_items[which(new_items$WS=="item_610"),]$uni_lemma = "you" # pronouns..
new_items[which(new_items$WS=="item_611"),]$uni_lemma = "you" # replace all of these with Alvin's coded pronouns
new_items[which(new_items$WS=="item_612"),]$uni_lemma = "your"
new_items[which(new_items$WS=="item_613"),]$uni_lemma = "me"
new_items[which(new_items$WS=="item_614"),]$uni_lemma = "my"
new_items[which(new_items$WS=="item_615"),]$uni_lemma = "we"
new_items[which(new_items$WS=="item_616"),]$uni_lemma = "we"
new_items[which(new_items$WS=="item_617"),]$uni_lemma = "we"
new_items[which(new_items$WS=="item_620"),]$uni_lemma = "this"
new_items[which(new_items$WS=="item_621"),]$uni_lemma = "these"
new_items[which(new_items$WS=="item_622"),]$uni_lemma = "this"
new_items[which(new_items$WS=="item_623"),]$uni_lemma = "these"
new_items[which(new_items$WS=="item_624"),]$uni_lemma = "that"
#new_items[which(new_items$WS==""),]$uni_lemma = ""
#new_items[which(new_items$WS==""),]$uni_lemma = ""
#new_items[which(new_items$WS==""),]$uni_lemma = ""
#new_items[which(new_items$WS==""),]$uni_lemma = ""
#new_items[which(new_items$WS==""),]$uni_lemma = ""
#new_items[which(new_items$WS=="item_637"),]$uni_lemma = "" 
# end pronouns

new_items[which(new_items$WS=="item_639"),]$uni_lemma = "how"
new_items[which(new_items$WS=="item_640"),]$uni_lemma = "when (question)"
new_items[which(new_items$WS=="item_641"),]$uni_lemma = "what kind" # or what type
new_items[which(new_items$WS=="item_643"),]$uni_lemma = "why"
new_items[which(new_items$WS=="item_644"),]$uni_lemma = "what"
new_items[which(new_items$WS=="item_646"),]$uni_lemma = "where (question)"
new_items[which(new_items$WS=="item_647"),]$uni_lemma = "which (question)"
new_items[which(new_items$WS=="item_663"),]$uni_lemma = "in front"
new_items[which(new_items$WS=="item_666"),]$uni_lemma = "here"
new_items[which(new_items$WS=="item_669"),]$uni_lemma = "there"
new_items[which(new_items$WS=="item_679"),]$uni_lemma = "little" # or "a bit" (quantity / amount)
new_items[which(new_items$WS=="item_691"),]$uni_lemma = "was" 
new_items[which(new_items$WS=="item_693"),]$uni_lemma = "was"
new_items[which(new_items$WS=="item_694"),]$uni_lemma = "will be" # conjugations..do we want all of these?
new_items[which(new_items$WS=="item_695"),]$uni_lemma = "will be"
new_items[which(new_items$WS=="item_696"),]$uni_lemma = "will be"
new_items[which(new_items$WS=="item_698"),]$uni_lemma = "are"
new_items[which(new_items$WS=="item_699"),]$uni_lemma = "am"
new_items[which(new_items$WS=="item_700"),]$uni_lemma = "have been"
new_items[which(new_items$WS=="item_701"),]$uni_lemma = "want"
new_items[which(new_items$WS=="item_703"),]$uni_lemma = "make" # make one do something..
new_items[which(new_items$WS=="item_704"),]$uni_lemma = "ask" # ask for something
new_items[which(new_items$WS=="item_705"),]$uni_lemma = "can"
new_items[which(new_items$WS=="item_707"),]$uni_lemma = "cannot" # or can't
new_items[which(new_items$WS=="item_708"),]$uni_lemma = "can"
new_items[which(new_items$WS=="item_710"),]$uni_lemma = "can"
new_items[which(new_items$WS=="item_711"),]$uni_lemma = "wish" 

new_items[which(new_items$WG=="item_104"),]$uni_lemma = "diaper"
new_items[which(new_items$WG=="item_124"),]$uni_lemma = "eye"
new_items[which(new_items$WG=="item_125"),]$uni_lemma = "ear"
new_items[which(new_items$WG=="item_137"),]$uni_lemma = "finger" # and toe
new_items[which(new_items$WG=="item_138"),]$uni_lemma = "shoulder"
new_items[which(new_items$WG=="item_259"),]$uni_lemma = "shh" # or "quiet!"
new_items[which(new_items$WG=="item_260"),]$uni_lemma = "good afternoon"
new_items[which(new_items$WG=="item_261"),]$uni_lemma = "good morning"
new_items[which(new_items$WG=="item_262"),]$uni_lemma = "good night" # or good evening
new_items[which(new_items$WG=="item_337"),]$uni_lemma = "yummy"
new_items[which(new_items$WG=="item_342"),]$uni_lemma = "good"

new_items[which(new_items$uni_lemma=="nuts"),]$uni_lemma = "nut"
new_items[which(new_items$uni_lemma=="tasty"),]$uni_lemma = "yummy"
new_items[which(new_items$uni_lemma=="fireman"),]$uni_lemma = "firefighter"
new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police"
new_items[which(new_items$uni_lemma=="brush"),]$uni_lemma = "brush (object)"
new_items[which(new_items$uni_lemma=="be quiet"),]$uni_lemma = "shh"
new_items[which(new_items$uni_lemma=="baa baa baa"),]$uni_lemma = "baa baa"
new_items[which(new_items$uni_lemma=="child’s own name"),]$uni_lemma = "child's own name"
new_items[which(new_items$uni_lemma=="don’t"),]$uni_lemma = "don't"
new_items[which(new_items$uni_lemma=="hello/hi"),]$uni_lemma = "hello"
new_items[which(new_items$uni_lemma=="gift"),]$uni_lemma = "present"
new_items[which(new_items$uni_lemma=="(I) don't want"),]$uni_lemma = "don't want"
new_items[which(new_items$uni_lemma=="afternoon snack"),]$uni_lemma = "snack"
new_items[which(new_items$uni_lemma=="fly"),]$uni_lemma = "fly (action)"
new_items[which(new_items$uni_lemma=="cherries"),]$uni_lemma = "cherry"
new_items[which(new_items$uni_lemma=="cover"),]$uni_lemma = "cover (action)"
new_items[which(new_items$uni_lemma=="buckwheat"),]$uni_lemma = "porridge"
new_items[which(new_items$uni_lemma=="kindergarten teacher"),]$uni_lemma = "teacher"
new_items[which(new_items$uni_lemma=="how (I see how rain falls)"),]$uni_lemma = "how (connecting)"
new_items[which(new_items$uni_lemma=="on (e.g. on the chair)"),]$uni_lemma = "on"
new_items[which(new_items$WS=="item_85"),]$uni_lemma = "paint (object)"
new_items[which(new_items$uni_lemma=="say/tell"),]$uni_lemma = "say"
new_items[which(new_items$uni_lemma=="ona visit"),]$uni_lemma = "outing" # maybe picnic?
new_items[which(new_items$uni_lemma=="promptly"),]$uni_lemma = "now"

# ToDo: check empty uni-lemmas ("")
new_items[which(new_items$uni_lemma==""),]
new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instrument(s)
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "667 new uni-lemmas defined for Latvian"

new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
# "40 new uni-lemmas defined for Latvian"
# "allowed" -> to "allow" ?
