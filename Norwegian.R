library(wordbankr)
library(tidyverse)

language = "Norwegian"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 745 Norwegian items"
# "333 missing uni_lemmas in original ( 45 % missing)"
# "389 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "3 uni_lemmas still missing ( 0 % missing)"
# "Review 54 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

# ToDo