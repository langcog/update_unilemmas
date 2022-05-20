library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Croatian"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 775 Croatian items"
# "62 missing uni_lemmas in original ( 8 % missing)"
# "99 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "1 uni_lemmas still missing ( 0 % missing)"
# "Review 34 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
# WS       WG        category       definition           gloss uni_lemma           new_gloss       new_uni_lemma
# 1    item_5 item_147          sounds    ku-ku (sound)       choo choo  peekaboo   peekaboo or hello   peekaboo or hello
# 2   item_16 item_132         animals             koka             hen       hen                        chicken (animal)
# 3   item_18                  animals         kornjača          turtle    turtle            tortoise            tortoise
# 4   item_37 item_237         animals          pijetao         rooster   rooster                        chicken (animal)
# 5   item_49 item_374         animals           vrabac         sparrow   sparrow                                    bird
# 6  item_105               food_drink           jagoda      strawberry     berry                              strawberry
# 7  item_124               food_drink           mahune     green beans     beans                             green beans
# 8  item_169 item_175        clothing           majica           shirt   t-shirt                                   shirt
# 9  item_186               body_parts          gležanj           ankle       leg                                   ankle
# 10 item_200               body_parts             rame        shoulder       arm                                shoulder
# 11 item_203               body_parts             šaka            fist       arm                                    fist
# 12 item_226                household kanta (za smeće)       trash can    bucket                 bin                 bin
# 13 item_269          furniture_rooms            klupa           bench     chair                                   bench
# 14 item_279          furniture_rooms           podrum        basement      room                                basement
# 15 item_329                   places             grad        downtown   outside                                    town
# 16 item_334                   places           livada          meadow     field                             meadow/lawn
# 17 item_339                   places             selo            farm   village             village         countryside
# 18 item_360 item_150          people         kum/kuma            aunt godfather godfather/godmother godfather/godmother
# 19 item_584                 pronouns             nama           to us        we                                      us
# 20 item_585                 pronouns              nas              us        we                                      us
# 21 item_619                locations            blizu           close     close                near                near
# 22 item_636                locations            pored          beside        by                                  beside
# 23 item_658 item_265     quantifiers             puno           a lot      many                                   a lot
# 24 item_667            helping_verbs              bio        (he) was       was                                      be
# 25 item_693            helping_verbs             mora   (he/she) must      have                                 have to
# 26 item_701            helping_verbs             nije (he/she) is not       not                         (he/she) is not
# 27 item_702            helping_verbs            nisam      (I) am not       not                              (I) am not
# 28 item_703            helping_verbs             nisi   (you) are not       not                           (you) are not
# 29 item_704            helping_verbs            nismo    (we) are not       not                            (we) are not
# 30 item_705            helping_verbs             nisu  (they) are not       not                          (they) are not
# 31 item_706            helping_verbs              sam              am        be                                 (I) am 
# 32 item_707            helping_verbs               si       (you) are        be                              (you) are 
# 33 item_709            helping_verbs              smo        (we) are        be                               (we) are 
# 34 item_710            helping_verbs               su      (they) are        be                              (they) are

# ToDo: choose which of these to change

new_items[which(new_items$uni_lemma=="policeman"),]$uni_lemma = "police" 
new_items[which(new_items$uni_lemma=="cinema/theatre"),]$uni_lemma = "movie" 
new_items[which(new_items$uni_lemma=="dustman"),]$uni_lemma = "garbage man" 
new_items[which(new_items$uni_lemma=="flag/banner"),]$uni_lemma = "flag" 
new_items[which(new_items$uni_lemma=="modelling clay"),]$uni_lemma = "play dough" 

new_items[which(new_items$uni_lemma==""),]$uni_lemma = NA

# save updated instrument(s)
new_wg <- update_instrument(language, "WG", new_items %>% rename(itemID = WG))
# yard
new_ws <- update_instrument(language, "WS", new_items %>% rename(itemID = WS))
# 238 new uni-lemmas defined for Croatian WS
