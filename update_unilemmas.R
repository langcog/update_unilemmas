# for wordbank 2.0 (2022 effort with Alvin)
# https://docs.google.com/spreadsheets/d/1RcpMgnjSA0nRbym0iDYcBPjL48IMNQxawmil0d4txsA/edit#gid=2109338433
update_unilemmas <- function(language, show_conflicts=F) {
  new_uni <- read.csv(paste0("updated_unilemmas/Wordbank uni_lemma updating - ",language,".tsv"), sep='\t')
  print(paste("loaded",nrow(new_uni),language,"items"))
  print(paste(length(which(new_uni$uni_lemma=="")), "missing uni_lemmas in original (", 
              100*round(length(which(new_uni$uni_lemma==""))/nrow(new_uni),2),"% missing)"))
  print(paste(length(which(new_uni$new_uni_lemma!="")), "uni_lemmas added/modified"))
  print("Adding uncontested new_uni_lemmas...")
  # accept new_uni_lemma and new_gloss if uni_lemma/new_gloss is blank:
  new_uni <- new_uni %>% mutate(uni_lemma = ifelse(uni_lemma=="", new_uni_lemma, uni_lemma),
                                gloss = ifelse(gloss=="", new_gloss, gloss))
  print(paste(length(which(new_uni$uni_lemma=="")), "uni_lemmas still missing (",
              100*round(length(which(new_uni$uni_lemma==""))/nrow(new_uni),2),"% missing)"))
  replace <- new_uni %>% filter(uni_lemma!=new_uni_lemma, new_uni_lemma!="", uni_lemma!="")
  if(show_conflicts) {
    print(paste("Review",nrow(replace),"suggested new_uni_lemmas that replace existing uni_lemmas, and revise by hand:"))
    print(replace)
  }
  uni <- new_uni %>% select(-new_gloss, -new_uni_lemma, -notes)
  return(uni)
}