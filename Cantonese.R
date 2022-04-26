library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")


language = "Cantonese"
outdir = "final_instruments/"

#old_items <- get_item_data(language = language) %>%
#  filter(type=="word")

new_items <- update_unilemmas(language, show_conflicts=T)
# "loaded 804 Cantonese items"
# "42 missing uni_lemmas in original ( 5 % missing)"
# "6 uni_lemmas added/modified"
# "Adding uncontested new_uni_lemmas..."
# "38 uni_lemmas still missing ( 5 % missing)"
# "Review 2 suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"
# WS category definition gloss uni_lemma new_gloss new_uni_lemma notes
# item_101 food_drink       花生          peanut                     nut    NA
# item_339     toys  積木/Lego  <NA>      lego        NA        blocks    NA

# accept
new_items[which(new_items$definition=="花生"),]$uni_lemma = "nut" # or nuts?
new_items[which(new_items$definition=="積木/Lego"),]$uni_lemma = "blocks"

# save updated instrument(s)
# load original instrument(s) file, as get_item_data doesn't have all the needed columns
instr_name = "[Cantonese_WS].csv"
instr <- read_csv(paste0("old_instruments/",instr_name))

# get non-word items (to keep the same)
instr_nonwords <- instr %>% anti_join(new_items, by=c("itemID"="WS"))

# for words, remove old gloss and uni_lemma, and join updated ones
new_instr <- instr %>% filter(type=="word") %>%
  select(-gloss, -uni_lemma) %>% 
  left_join(new_items %>% select(WS, gloss, uni_lemma), by=c("itemID"="WS")) %>%
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
# ""          "blocks"    "corn"      "crab"      "nut"       "shrimp"    "vegetable"
# should "" be NA? I think it's okay