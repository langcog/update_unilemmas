library(wordbankr)
library(tidyverse)

language = "Turkish"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 746 Turkish items"
# "306 missing uni_lemmas in original ( 41 % missing)"
# "290 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "27 uni_lemmas still missing ( 4 % missing)"
# "Review 4 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
#       WS       WG     category definition              gloss uni_lemma new_gloss new_uni_lemma notes
# item_440 item_278 action_words      Çıkar           take off  take off                  remove      
# item_478 item_306 action_words     Kaldır       lift/pick up      lift           lift (action)      
# item_542 item_342 action_words        Yat lie down/go to bed       lie                lie down      
# item_629 item_383     pronouns        Ben                  I         i                       I  

# ToDo