library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "British Sign Language"
outdir = "final_instruments/"

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

# load original instrument(s) file, as get_item_data doesn't have all the needed columns
instr_name = "[BSL_WG].csv"
instr <- read_csv(paste0("old_instruments/",instr_name))

# get non-word items (to keep the same)
instr_nonwords <- instr %>% anti_join(new_items, by=c("itemID"="WG"))

# for words, remove old gloss and uni_lemma, and join updated ones
new_instr <- instr %>% filter(type=="word") %>%
  select(-gloss, -uni_lemma) %>% 
  left_join(new_items %>% select(WG, gloss, uni_lemma), by=c("itemID"="WG")) %>%
  bind_rows(instr_nonwords) #%>% arrange(itemID)

# testthat::expect_true()
# check that we have all itemIDs and definitions in new 
paste("All itemIDs accounted for in new file:",setequal(new_instr$itemID, instr$itemID))
paste("All definitions accounted for in new file:",setequal(new_instr$definition, instr$definition))

new_instr %>% write_csv(file=paste0(outdir,instr_name))

new_unilemmas <- setdiff(new_instr$uni_lemma, instr$uni_lemma)
#setdiff(instr$uni_lemma, new_instr$uni_lemma)

paste(length(new_unilemmas),"new uni-lemmas defined for",language)
print(sort(new_unilemmas))

