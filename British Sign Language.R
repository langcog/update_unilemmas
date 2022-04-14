library(wordbankr)
library(tidyverse)

language = "British Sign Language"

old_items <- get_item_data(language = language) %>%
  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 548 British Sign Language items"
# "129 missing uni_lemmas in original ( 24 % missing)"
# "99 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "30 uni_lemmas still missing ( 5 % missing)"
# "Review 0 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"

# now join and re-save in raw_data/instruments format, e.g.
# https://github.com/langcog/wordbank/blob/master/raw_data/BSL_WG/%5BBSL_WG%5D.csv

# looks like we actually need to load the original instruments file, as get_item_data doesn't have all the needed columns

# itemID	item	type	category	choices	definition	gloss	uni_lemma
fname = "final_instruments/[BSL_WG].csv"

#final <- old_items %>% rename(itemID = item_id) %>% 
#  select()
#  left_join(new_items %>% rename(WG = itemID))
#  
#final %>% write_csv(file=fname)