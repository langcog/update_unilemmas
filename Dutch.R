library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Dutch"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 1075 Dutch items"
# "66 missing uni_lemmas in original ( 6 % missing)"
# "95 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "44 uni_lemmas still missing ( 4 % missing)"
# "Review 19 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

new_items[which(new_items$definition=="mjammjam(lekker)"),]$uni_lemma = "yum yum" # not yummy yummy
new_items[which(new_items$definition=="haan"),]$uni_lemma = "chicken (animal)" # 
new_items[which(new_items$definition=="konijn(tje)"),]$uni_lemma = "bunny" # to match other languages (not rabbit)
new_items[which(new_items$definition=="muis"),]$uni_lemma = "mouse" # don't need disambiguating "(animal)"
new_items[which(new_items$definition=="vlees"),]$uni_lemma = "meat" # don't need disambiguating "(food)"
new_items[which(new_items$definition=="bad"),]$uni_lemma = "bath" # not bathtub
new_items[which(new_items$definition=="potje"),]$uni_lemma = "pot" # little pot, jar, or children's toilet...
new_items[which(new_items$definition=="meneer"),]$uni_lemma = "man" # sir/mister/male
new_items[which(new_items$definition=="bijten"),]$uni_lemma = "bite"
new_items[which(new_items$definition=="blazen"),]$uni_lemma = "blow"
new_items[which(new_items$definition=="dansen"),]$uni_lemma = "dance"
new_items[which(new_items$definition=="wanneer"),]$uni_lemma = "when (question)" # with or without parenthetical?
new_items[which(new_items$definition=="aan"),]$uni_lemma = "to" # to/on/at
new_items[which(new_items$definition=="af"),]$uni_lemma = "off" # off/from
new_items[which(new_items$definition=="beneden"),]$uni_lemma = "under" # beneath/under/downstairs/down
new_items[which(new_items$definition=="bravo!"),]$uni_lemma = "well done" # 'bravo' / good job ?
new_items[which(new_items$definition=="konijn"),]$uni_lemma = "bunny" # rabbit
new_items[which(new_items$definition=="leuk"),]$uni_lemma = "funny" # funny/fun/nice
new_items[which(new_items$definition=="dicht"),]$uni_lemma = "close (action)" 

new_items[which(new_items$definition=="lekker"),]$uni_lemma = "yummy" 

new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police" 
new_items[which(new_items$uni_lemma=="fireman"),]$uni_lemma = "firefighter" 

# fill in several blanks
subset(new_items, uni_lemma=="")

new_items[which(new_items$definition=="naamvanbabysitter"),]$uni_lemma = "babysitter's name"
new_items[which(new_items$definition=="naamvanhuisdier"),]$uni_lemma = "pet's name"
new_items[which(new_items$definition=="naamvanhuisdier"),]$uni_lemma = "pet's name"
new_items[which(new_items$definition=="naamvankind"),]$uni_lemma = "child's name"
new_items[which(new_items$definition=="hetwerkvan"),]$uni_lemma = "work (place)"

# other sounds:
# blub / blubblub(vis) <- fish
# tuutatuuta(ziekenwagen/ziekenauto/brandweer/politieauto) <- 'nee-naw' siren
# tik, tac, bah, knor ?

# food:
# kroketjes/gebakkenaardappeltjes <- croquette, 'nugget', or french fries ?

new_items[which(new_items$definition=="hallo(telefoon)"),]$uni_lemma = "hello" # answer telephone
new_items[which(new_items$definition=="ohooh(verbazing)"),]$uni_lemma = "wow" # ? surprise
new_items[which(new_items$definition=="choco"),]$uni_lemma = "cocoa"
new_items[which(new_items$definition=="waf"),]$uni_lemma = "woof woof"
new_items[which(new_items$definition=="sst"),]$uni_lemma = "shh"
new_items[which(new_items$definition=="kiekeboe"),]$uni_lemma = "peekaboo"
new_items[which(new_items$definition=="zogroot!"),]$uni_lemma = "so big!"
new_items[which(new_items$definition=="totmorgen!(routine)"),]$uni_lemma = "goodbye"
new_items[which(new_items$definition=="goed zo"),]$uni_lemma = "well done" # good job?
new_items[which(new_items$definition=="cavia"),]$uni_lemma = "guinea pig" # guinea pig...gerbil/hamster?
new_items[which(new_items$definition=="brommer"),]$uni_lemma = "motorcycle"
new_items[which(new_items$definition=="krenten"),]$uni_lemma = "raisin"
new_items[which(new_items$definition=="jouw"),]$uni_lemma = "yourself" # or just you?
new_items[which(new_items$definition=="siroop"),]$uni_lemma = "syrup"
new_items[which(new_items$definition=="bij"),]$uni_lemma = "near"
new_items[which(new_items$definition=="slaap lekker"),]$uni_lemma = "good night" # "sleep well"
new_items[which(new_items$definition=="Bambi"),]$uni_lemma = "deer" # ok?
new_items[which(new_items$definition=="beschuit"),]$uni_lemma = "cookie"
new_items[which(new_items$definition=="alsjeblieft"),]$uni_lemma = "you're welcome"
new_items[which(new_items$definition=="dadadoen/daaag"),]$uni_lemma = "bye"

new_items[which(new_items$definition=="rug"),]$uni_lemma = "back (body part)"
new_items[which(new_items$definition=="terug"),]$uni_lemma = "back (location)"

new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

new_items[which(new_items$uni_lemma=="(hair)brush"),]$uni_lemma = "brush (object)"
new_items[which(new_items$uni_lemma=="garbage"),]$uni_lemma = "trash"
new_items[which(new_items$uni_lemma=="rock"),]$uni_lemma = "stone"
new_items[which(new_items$uni_lemma=="nanny"),]$uni_lemma = "babysitter"
new_items[which(new_items$uni_lemma=="thanks"),]$uni_lemma = "thank you"
new_items[which(new_items$uni_lemma=="comb"),]$uni_lemma = "comb (object)"
new_items[which(new_items$uni_lemma=="be able to"),]$uni_lemma = "be able"
new_items[which(new_items$uni_lemma=="bean"),]$uni_lemma = "beans"
new_items[which(new_items$uni_lemma=="(to have) breakfast"),]$uni_lemma = "breakfast (action)"
new_items[which(new_items$uni_lemma=="catepillar"),]$uni_lemma = "caterpillar"
new_items[which(new_items$uni_lemma=="drink (verb+noun)"),]$uni_lemma = "drink (action)" # in action_words, so
new_items[which(new_items$uni_lemma=="dick"),]$uni_lemma = "penis"
new_items[which(new_items$uni_lemma=="do the dished"),]$uni_lemma = "wash"
new_items[which(new_items$uni_lemma=="climb (verb)"),]$uni_lemma = "climb"
new_items[which(new_items$uni_lemma=="do (verb)"),]$uni_lemma = "do"
new_items[which(new_items$uni_lemma=="handbag"),]$uni_lemma = "bag"
new_items[which(new_items$uni_lemma=="nail (body)"),]$uni_lemma = "nail (body part)"
new_items[which(new_items$uni_lemma=="nail (item)"),]$uni_lemma = "nail (object)"
new_items[which(new_items$uni_lemma=="night/tonight"),]$uni_lemma = "night"
new_items[which(new_items$uni_lemma=="moddeling clay"),]$uni_lemma = "play dough" # or clay
new_items[which(new_items$uni_lemma=="clay modeling"),]$uni_lemma = "play dough"
new_items[which(new_items$uni_lemma=="repair (verb)"),]$uni_lemma = "fix"
new_items[which(new_items$uni_lemma=="picknick"),]$uni_lemma = "picnic"
new_items[which(new_items$uni_lemma=="gift"),]$uni_lemma = "present"
new_items[which(new_items$uni_lemma=="sofa"),]$uni_lemma = "couch"
new_items[which(new_items$uni_lemma=="cover up (verb)"),]$uni_lemma = "cover (action)"
new_items[which(new_items$uni_lemma=="fire truck"),]$uni_lemma = "firetruck"
new_items[which(new_items$uni_lemma=="call (verb)"),]$uni_lemma = "call"
new_items[which(new_items$uni_lemma=="calm/silent"),]$uni_lemma = "quiet"
new_items[which(new_items$uni_lemma=="cut (verb)"),]$uni_lemma = "cut"
new_items[which(new_items$uni_lemma=="glide/shove"),]$uni_lemma = "slide"
new_items[which(new_items$uni_lemma=="go/walk"),]$uni_lemma = "go"
new_items[which(new_items$uni_lemma=="having dinner"),]$uni_lemma = "dinner"
new_items[which(new_items$uni_lemma=="hear (verb)"),]$uni_lemma = "hear"
new_items[which(new_items$uni_lemma=="ice cream lollipop"),]$uni_lemma = "popsicle"
new_items[which(new_items$uni_lemma=="going to bed"),]$uni_lemma = "go to bed"
new_items[which(new_items$uni_lemma=="hurry up"),]$uni_lemma = "hurry"
new_items[which(new_items$uni_lemma=="ice skate (verb)"),]$uni_lemma = "skate"
new_items[which(new_items$uni_lemma=="if/when"),]$uni_lemma = "if"
new_items[which(new_items$uni_lemma=="lock/close/fix"),]$uni_lemma = "lock (action)"
new_items[which(new_items$uni_lemma=="long/tall"),]$uni_lemma = "long"

# ToDo: review changes, and output all various forms
new_ws <- update_instrument("Dutch", "WS", new_items %>% rename(itemID = WS))
# "34 new uni-lemmas defined for Dutch"
new_wg <- update_instrument("Dutch", "WG", new_items %>% rename(itemID = WG))
# "26 new uni-lemmas defined for Dutch"
new_form1 <- update_instrument("Dutch", "FormOne", new_items %>% rename(itemID = Form1))
# "13 new uni-lemmas defined for Dutch"
new_form2a <- update_instrument("Dutch", "FormTwoA", new_items %>% rename(itemID = Form2A))
# "6 new uni-lemmas defined for Dutch"