library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Mandarin (Beijing)"
outdir = "final_instruments/"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 1173 Mandarin (Beijing) items"
# "190 missing uni_lemmas in original ( 16 % missing)"
# "125 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "71 uni_lemmas still missing ( 6 % missing)"
# "Review 4 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
#WS       TC      IC     category definition    gloss uni_lemma new_gloss new_uni_lemma notes
# item_123                  action_words         躺      lie       lie       lie      lie down      
# item_124                  action_words         趴      lie       lie       lie      lie down      
# item_281  item_47 item_11   food_drink       面条  noodles   noodles                   pasta      
#          item_107               people     小朋友 children  children     child         child  

new_items[which(new_items$WS=="item_123"),]$uni_lemma = "lie down" # "lie" is ambiguous
new_items[which(new_items$WS=="item_124"),]$uni_lemma = "lie down"
new_items[which(new_items$WS=="item_281"),]$uni_lemma = "pasta" # not 'noodles'
new_items[which(new_items$TC=="item_107"),]$uni_lemma = "child" # singular

new_items[which(new_items$uni_lemma=="earth"),]$uni_lemma = "soil" 
new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police" 
new_items[which(new_items$uni_lemma=="tasty"),]$uni_lemma = "yummy" 
new_items[which(new_items$uni_lemma=="eyebrows"),]$uni_lemma = "eyebrow" 
new_items[which(new_items$uni_lemma=="bed sheet"),]$uni_lemma = "sheet" 
new_items[which(new_items$uni_lemma=="cinema"),]$uni_lemma = "movie"
new_items[which(new_items$uni_lemma=="grape"),]$uni_lemma = "grapes"
new_items[which(new_items$uni_lemma=="braid"),]$uni_lemma = "braid (object)" # body part, actually...
new_items[which(new_items$uni_lemma=="chess"),]$uni_lemma = "board game"
new_items[which(new_items$uni_lemma=="call (on phone)"),]$uni_lemma = "call"
new_items[which(new_items$uni_lemma=="carrots"),]$uni_lemma = "carrot"
new_items[which(new_items$uni_lemma=="see-saw"),]$uni_lemma = "seesaw"
new_items[which(new_items$uni_lemma=="shrimp (food)"),]$uni_lemma = "shrimp"
new_items[which(new_items$uni_lemma=="tie"),]$uni_lemma = "tie (action)"
new_items[which(new_items$uni_lemma=="woods"),]$uni_lemma = "forest"
new_items[which(new_items$uni_lemma=="tv"),]$uni_lemma = "TV"
new_items[which(new_items$uni_lemma=="tidy (action)"),]$uni_lemma = "clean (action)"
new_items[which(new_items$uni_lemma=="speaker"),]$uni_lemma = "stereo"
new_items[which(new_items$uni_lemma=="sandals"),]$uni_lemma = "sandal"
new_items[which(new_items$uni_lemma=="socket"),]$uni_lemma = "outlet"
new_items[which(new_items$uni_lemma=="mop"),]$uni_lemma = "mop (object)"
new_items[which(new_items$WS=="item_388"),]$uni_lemma = "swallow (animal)"
new_items[which(new_items$uni_lemma=="fritters"),]$uni_lemma = "donut" # sweet fried food?
new_items[which(new_items$uni_lemma=="flowerpot"),]$uni_lemma = "flower pot" 
new_items[which(new_items$uni_lemma=="earrings"),]$uni_lemma = "earring" 
new_items[which(new_items$uni_lemma=="call on phone"),]$uni_lemma = "call"
new_items[which(new_items$uni_lemma=="bump (action)"),]$uni_lemma = "bump"
new_items[which(new_items$uni_lemma=="bat"),]$uni_lemma = "bat (object)"
new_items[which(new_items$uni_lemma=="walnut"),]$uni_lemma = "nut" # is walnut, but nut is not on the form
new_items[which(new_items$uni_lemma=="wardrobe"),]$uni_lemma = "closet"
new_items[which(new_items$uni_lemma=="bang"),]$uni_lemma = "bang bang"
new_items[which(new_items$uni_lemma=="keys"),]$uni_lemma = "key"

new_items[which(new_items$uni_lemma=="skate"),]$uni_lemma = "skate (action)" 
new_items[which(new_items$uni_lemma=="gloves"),]$uni_lemma = "glove"
new_items[which(new_items$uni_lemma=="lips"),]$uni_lemma = "lip"
new_items[which(new_items$uni_lemma=="glue"),]$uni_lemma = "glue (object)"
new_items[which(new_items$uni_lemma=="cool"),]$uni_lemma = "cool (description)"
new_items[which(new_items$uni_lemma=="block"),]$uni_lemma = "blocks"
new_items[which(new_items$uni_lemma=="like (action)"),]$uni_lemma = "like"
new_items[which(new_items$uni_lemma=="disk"),]$uni_lemma = "CD"
new_items[which(new_items$uni_lemma=="want"),]$uni_lemma = "wanna"


new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

new_ws <- update_instrument("Mandarin_Beijing", "WS", new_items %>% rename(itemID = WS))
# "232 new uni-lemmas defined for Mandarin_Beijing"
new_tc <- update_instrument("Mandarin_Beijing", "TC", new_items %>% rename(itemID = TC))
# 187 new
new_ic <- update_instrument("Mandarin_Beijing", "IC", new_items %>% rename(itemID = IC))
# 23 new
