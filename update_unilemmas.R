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

# load original instrument(s) file, as get_item_data doesn't have all the needed columns
update_instrument <- function(language, instrument, new_items) {
  instr_name = paste0("[",language,"_",instrument,"].csv")
  paste("Loading old",instr_name,"instrument...")
  instr <- read_csv(paste0("old_instruments/",instr_name)) %>% 
    mutate(gloss = as.character(gloss), # one of them was 'logical'...
           uni_lemma = as.character(uni_lemma)) # one of them was 'logical'...
  # get non-word items (to keep the same)
  instr_nonwords <- instr %>% anti_join(new_items, by="itemID")
  
  # for words, remove old gloss and uni_lemma, and join updated ones
  new_instr <- instr %>% filter(type=="word") %>%
    select(-gloss, -uni_lemma) %>% 
    left_join(new_items %>% select(itemID, gloss, uni_lemma), by="itemID") %>%
    bind_rows(instr_nonwords) #%>% arrange(itemID)
  
  # testthat::expect_true()
  # check that we have all itemIDs and definitions in new 
  print(paste("All itemIDs accounted for in new file:",setequal(new_instr$itemID, instr$itemID)))
  print(paste("All definitions accounted for in new file:",setequal(new_instr$definition, instr$definition)))
  
  new_unilemmas <- setdiff(new_instr$uni_lemma, instr$uni_lemma)
  #setdiff(instr$uni_lemma, new_instr$uni_lemma)
  print(paste(length(new_unilemmas),"new uni-lemmas defined for",language))
  print(sort(new_unilemmas))
  new_instr %>% write_csv(file=paste0(outdir,instr_name))
  print(paste("Saved new instrument:",paste0(outdir,instr_name)))
  return(new_instr)
}

# read all instrument files from given directory, tabulate all uni-lemmas
tabulate_unilemmas <- function(directory) {
  fnames = list.files(directory)
  d <- tibble()
  for(f in fnames) {
    print(paste("loading",f))
    tmp <- read_csv(paste0(directory, f)) %>%
      mutate(form = f) %>% # str_split(f, ".csv")[[1]]
      filter(type=="word")
    d <- d %>% bind_rows(tmp %>%
                           select(form,item,category,uni_lemma))
  }
  
  return(d)
}

examine_new_unilemmas <- function() {
  # how it started: 1380 uni-lemmas
  # how it's going: 2136 uni-lemmas
  old_uni <- wordbankr::get_crossling_items()

  new_uni <- tabulate_unilemmas("final_instruments/")
  new_uni_tab <- sort(table(new_uni$uni_lemma))
  length(new_uni_tab) # 2281 uni-lemmas
  length(new_uni_tab[which(new_uni_tab==1)]) # 727 hapaxes
  length(unique(new_uni$form)) # 53 forms

  length(new_uni_tab[which(new_uni_tab>2)]) # 1143 used in 3+ forms
  length(new_uni_tab[which(new_uni_tab>=10)]) # 697 on 10+ forms
  length(new_uni_tab[which(new_uni_tab>=20)]) # 513 on 20+ forms
  length(new_uni_tab[which(new_uni_tab>=30)]) # 323 on 30+ forms
  length(new_uni_tab[which(new_uni_tab>=40)]) # 147 on 40+ forms
  # attempt -> try

  #subset(new_uni, uni_lemma=="tuna (food)") # Spanish_Mexican_WS - changed to "tuna" (like other forms)
  #subset(new_uni, uni_lemma=="(hair)brush") # Dutch_WS - changed to brush (object)
  subset(new_uni, uni_lemma=="nuts") # 20 forms have nut, 6 have nuts
  subset(new_uni, uni_lemma=="soda") # 28
  subset(new_uni, uni_lemma=="coke") # 4 - (EN WS has both)
  subset(new_uni, uni_lemma=="garbage") # change Dutch WS and Eng WS to trash (Norwegian "trash can" to trash?)
  subset(new_uni, uni_lemma=="soil") # Turkish forms, but 6 forms have "earth" (terra Italian/Port/Spanish) - change all to soil
  subset(new_uni, uni_lemma=="rock") # change rock (object) to 'stone' ?
  subset(new_uni, uni_lemma=="poop") # change games_routines poop to 'go potty' 
  subset(new_uni, uni_lemma=="well") # change to "well (modifier)"?
  subset(new_uni, uni_lemma=="little") # change to "little (amount)"
  subset(new_uni, uni_lemma=="police") # 16 forms, but 14 have 'policeman' -> change
  subset(new_uni, uni_lemma=="which (question)") # change Spanish question word "which"
  subset(new_uni, uni_lemma=="take out") # Russian -> "remove"
  subset(new_uni, uni_lemma=="put in") # change to "insert"
  subset(new_uni, uni_lemma=="fireman") # change Dutch & Irish to firefighter
  subset(new_uni, uni_lemma=="yummy") # Cantonese, but Dutch 'lekker' = delicious
  subset(new_uni, uni_lemma=="nanny") # change Dutch and Hebrew to 'babysitter'
  subset(new_uni, uni_lemma=="eyebrows") # singularize
  # kind vs. nice?
  subset(new_uni, uni_lemma=="back") # some need disambiguating... (prepositions vs. body parts vs. locations)
  subset(new_uni, uni_lemma=="bzzz") # Hebrew -> "buzz"
  subset(new_uni, uni_lemma=="thanks") # Dutch -> "thank you"
  subset(new_uni, uni_lemma=="hot") # vs. hot (temperature) ?
  subset(new_uni, uni_lemma=="comb") # Dutch & Irish -> comb (object)
  subset(new_uni, uni_lemma=="brush") # Irish/Hungarian -> brush (object)
  subset(new_uni, uni_lemma=="pretty") # 31 vs. 22 beautiful
  
  tail(new_uni_tab, 100)
  
  subset(new_uni, uni_lemma=="(hair)brush")
}
