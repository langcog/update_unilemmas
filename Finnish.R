library(wordbankr)
library(tidyverse)

language = "Finnish"

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 167 Finnish items"
# "45 missing uni_lemmas in original ( 0.27 % missing)"
# "44 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "4 uni_lemmas still missing ( 0.02 % missing)"
# "Review 0 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"