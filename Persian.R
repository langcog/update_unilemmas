library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "Persian"
outdir = "final_instruments/"

old_items <- get_item_data(language = language, db_args = db_args) %>%
  filter(item_kind=="word")

### NOTE: updated by hand since there were a lot of issues to resolve
new_uni <- read.csv(paste0("updated_unilemmas/Wordbank uni_lemma updating - ",language,".tsv"), sep='\t')
print(paste("loaded",nrow(new_uni),language,"items"))
print(paste(length(which(new_uni$uni_lemma=="")), "missing uni_lemmas in original (", 
            100*round(length(which(new_uni$uni_lemma==""))/nrow(new_uni),2),"% missing)"))
print(paste(length(which(new_uni$new_uni_lemma!="")), "uni_lemmas added/modified"))
print("Adding uncontested new_uni_lemmas...")
new_uni <- new_uni %>% mutate(uni_lemma = final_uni_lemma,
                              gloss = final_gloss,
                              definition = final_definition)
print(paste(length(which(new_uni$uni_lemma=="")), "uni_lemmas still missing (",
            100*round(length(which(new_uni$uni_lemma==""))/nrow(new_uni),2),"% missing)"))
replace <- new_uni %>% filter(uni_lemma!=new_uni_lemma, new_uni_lemma!="", uni_lemma!="")
new_items <- new_uni %>% select(-new_gloss, -new_uni_lemma, -notes)

new_ws <- update_instrument("Persian", "WS", new_items %>% rename(itemID = WS))

new_wg <- update_instrument("Persian", "WG", new_items %>% rename(itemID = WS))
