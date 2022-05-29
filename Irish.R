library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Irish"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 720 Irish items"
# "55 missing uni_lemmas in original ( 8 % missing)"
# "80 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "14 uni_lemmas still missing ( 2 % missing)"
# "Review 31 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$WS=="item_126"),]$uni_lemma = "train" # same..
new_items[which(new_items$WS=="item_132"),]$uni_lemma = "blocks" # plural
new_items[which(new_items$WS=="item_155"),]$uni_lemma = "puzzle" # generic
new_items[which(new_items$WS=="item_335"),]$uni_lemma = "t-shirt" 
new_items[which(new_items$WS=="item_341"),]$uni_lemma = "toe"
new_items[which(new_items$WS=="item_356"),]$uni_lemma = "tooth"
new_items[which(new_items$WS=="item_463"),]$uni_lemma = "light (object)"
new_items[which(new_items$WS=="item_640"),]$uni_lemma = "forest"
new_items[which(new_items$WS=="item_658"),]$uni_lemma = "nursery"
new_items[which(new_items$WS=="item_678"),]$uni_lemma = "aunt"
new_items[which(new_items$WS=="item_690"),]$uni_lemma = "grandpa"
new_items[which(new_items$WS=="item_721"),]$uni_lemma = "mommy"
new_items[which(new_items$WS=="item_722"),]$uni_lemma = "grandma"
new_items[which(new_items$WS=="item_731"),]$uni_lemma = "this little piggy" # this little pig?
new_items[which(new_items$WS=="item_755"),]$uni_lemma = NA # cuddle/hug or hatred ?? leave blank until we resolve
new_items[which(new_items$WS=="item_830"),]$uni_lemma = "rip" # vs. tear
new_items[which(new_items$WS=="item_884"),]$uni_lemma = "shake" 
new_items[which(new_items$WS=="item_918"),]$uni_lemma = "draw" # vs. line 
new_items[which(new_items$WS=="item_1060"),]$uni_lemma = "pretty" # vs. cute 
new_items[which(new_items$WS=="item_1076"),]$uni_lemma = "orange (description)" 
new_items[which(new_items$WS=="item_1195"),]$uni_lemma = "where (question)" 
new_items[which(new_items$WS=="item_1296"),]$uni_lemma = "none" # or 'without'
new_items[which(new_items$WS=="item_1318"),]$uni_lemma = "be" 
new_items[which(new_items$WS=="item_1336"),]$uni_lemma = "was" 
new_items[which(new_items$WS=="item_1340"),]$uni_lemma = "but" 
new_items[which(new_items$WS=="item_1342"),]$uni_lemma = "and" 
new_items[which(new_items$WS=="item_1352"),]$uni_lemma = "when" 

new_items[which(new_items$WS=="item_456"),]$uni_lemma = "brush (object)" 
new_items[which(new_items$WS=="item_938"),]$uni_lemma = "brush (action)" 


new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police" 
new_items[which(new_items$uni_lemma=="fireman"),]$uni_lemma = "firefighter" 
new_items[which(new_items$uni_lemma=="nuts"),]$uni_lemma = "nut"
new_items[which(new_items$uni_lemma=="rock"),]$uni_lemma = "stone"
new_items[which(new_items$uni_lemma=="eyebrows"),]$uni_lemma = "eyebrow"
new_items[which(new_items$uni_lemma=="comb"),]$uni_lemma = "comb (object)"
new_items[which(new_items$uni_lemma=="drink (liquid)"),]$uni_lemma = "drink (object)"
new_items[which(new_items$uni_lemma=="colour"),]$uni_lemma = "color (action)"
new_items[which(new_items$uni_lemma=="crios"),]$uni_lemma = "cross"
new_items[which(new_items$uni_lemma=="footpath"),]$uni_lemma = "sidewalk"
new_items[which(new_items$uni_lemma=="dunno"),]$uni_lemma = "don't know"
new_items[which(new_items$uni_lemma=="gimme"),]$uni_lemma = "give me" 
new_items[which(new_items$uni_lemma=="nappy"),]$uni_lemma = "diaper" 
new_items[which(new_items$uni_lemma=="motorbike"),]$uni_lemma = "motorcycle" 
new_items[which(new_items$uni_lemma=="rashers"),]$uni_lemma = "bacon"
new_items[which(new_items$uni_lemma=="kind"),]$uni_lemma = "nice"
new_items[which(new_items$uni_lemma=="fly"),]$uni_lemma = "fly (animal)"
new_items[which(new_items$uni_lemma=="bike"),]$uni_lemma = "bicycle"
new_items[which(new_items$uni_lemma=="cornflakes"),]$uni_lemma = "cheerios"
new_items[which(new_items$uni_lemma=="cover"),]$uni_lemma = "cover (action)"
new_items[which(new_items$uni_lemma=="back of"),]$uni_lemma = "behind"
new_items[which(new_items$uni_lemma=="buggy"),]$uni_lemma = "stroller"
new_items[which(new_items$uni_lemma=="crisps"),]$uni_lemma = "chips"
new_items[which(new_items$uni_lemma=="ice pop"),]$uni_lemma = "popsicle"
new_items[which(new_items$uni_lemma=="highchair"),]$uni_lemma = "high chair"
new_items[which(new_items$uni_lemma=="i see you"),]$uni_lemma = "peekaboo"
new_items[which(new_items$uni_lemma=="sausages"),]$uni_lemma = "sausage"
new_items[which(new_items$uni_lemma=="shoes"),]$uni_lemma = "shoe"
new_items[which(new_items$uni_lemma=="swimming togs"),]$uni_lemma = "swimsuit"
new_items[which(new_items$uni_lemma=="telly"),]$uni_lemma = "TV"
new_items[which(new_items$uni_lemma=="chicken nuggets"),]$uni_lemma = "nugget"
new_items[which(new_items$uni_lemma=="spagetti"),]$uni_lemma = "spaghetti"
new_items[which(new_items$uni_lemma=="colouring"),]$uni_lemma = "crayon"
new_items[which(new_items$uni_lemma=="one (of)"),]$uni_lemma = "a" # pronoun
new_items[which(new_items$uni_lemma=="really"),]$uni_lemma = "very"

new_items[which(new_items$uni_lemma=="sliotar"),]$uni_lemma = "ball"
new_items[which(new_items$uni_lemma=="kitten"),]$uni_lemma = "kitty"
new_items[which(new_items$uni_lemma=="paint"),]$uni_lemma = "paint (action)"
new_items[which(new_items$uni_lemma=="dress"),]$uni_lemma = "dress (object)"
new_items[which(new_items$uni_lemma=="try to"),]$uni_lemma = "try"
new_items[which(new_items$uni_lemma=="jumper"),]$uni_lemma = "sweater"
new_items[which(new_items$uni_lemma=="hurt"),]$uni_lemma = "hurt (description)"

new_items[which(new_items$definition=="obair"),]$uni_lemma = "work (place)"
new_items[which(new_items$definition=="oibrigh"),]$uni_lemma = "work (action)"
new_items[which(new_items$uni_lemma=="when"),]$uni_lemma = "when (conjunction)"
new_items[which(new_items$uni_lemma=="toy"),]$uni_lemma = "toy (object)"

new_items[which(new_items$WS=="item_904"),]$uni_lemma = "clean (action)"
new_items[which(new_items$WS=="item_1056"),]$uni_lemma = "clean (description)"
new_items[which(new_items$uni_lemma=="swing"),]$uni_lemma = "swing (action)"

# ToDo: check empty uni-lemmas ("")
new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instrument(s)
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# "84 new uni-lemmas defined for Irish"

