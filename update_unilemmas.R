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


# creates a new instrument (but does not load any nonword items! does Finnish WG / Persian have these items?)
create_new_instrument <- function(language, instrument, items) {
  if(instrument=="WG") {
    choices = "understands; produces"
  } else {
    choices = "produces"
  }
  instr_name = paste0("[",language,"_",instrument,"].csv")
  new_instr <- items %>% select(itemID, category, definition, gloss, uni_lemma) %>%
    mutate(item = definition,
           choices = choices,
           type = "word")
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
  # how it's going: 2089 uni-lemmas
  old_uni <- wordbankr::get_crossling_items()

  new_uni <- tabulate_unilemmas("final_instruments/")
  new_uni_tab <- sort(table(new_uni$uni_lemma))
  length(new_uni_tab) # 2052 uni-lemmas
  length(new_uni_tab[which(new_uni_tab==1)]) # 456 hapaxes
  length(unique(new_uni$form)) # 63 forms
  
  new_unis <- tibble(unilemma=names(new_uni_tab), num_forms=as.vector(new_uni_tab))
  #write_csv(new_unis, file="uni-lemma_list.csv")
  
  # uni-lemmas we no longer have:
  setdiff(old_uni$uni_lemma, names(new_uni_tab)) # 140 corrections/changes
  # new uni-lemmas:
  setdiff(names(new_uni_tab), old_uni$uni_lemma) # 812
  
  length(new_uni_tab[which(new_uni_tab>4)]) # 1060 used in 5+ forms
  length(new_uni_tab[which(new_uni_tab>=10)]) # 786 on 10+ forms
  length(new_uni_tab[which(new_uni_tab>=20)]) # 591 on 20+ forms
  length(new_uni_tab[which(new_uni_tab>=30)]) # 474 on 30+ forms
  length(new_uni_tab[which(new_uni_tab>=40)]) # 327 on 40+ forms
  length(new_uni_tab[which(new_uni_tab>=50)]) # 206 on 50+
  length(new_uni_tab[which(new_uni_tab>=60)]) # 75 on 60+ 

  #subset(new_uni, uni_lemma=="tuna (food)") # Spanish_Mexican_WS - changed to "tuna" (like other forms)
  #subset(new_uni, uni_lemma=="nuts") # 20 forms have nut, 6 have nuts
  subset(new_uni, uni_lemma=="soda") # 28
  subset(new_uni, uni_lemma=="coke") # 4 - (EN WS has both)
  #subset(new_uni, uni_lemma=="garbage") # change Dutch WS and Eng WS to trash (Norwegian "trash can" to trash?)
  #subset(new_uni, uni_lemma=="earth") # 6 forms have "earth" (terra Italian/Port/Spanish) - change all to soil (Turkish has both)
  subset(new_uni, uni_lemma=="rock (object)") # change rock (object) (28 forms) to 'stone' (27 forms) ?
  subset(new_uni, uni_lemma=="poop") # change games_routines poop to 'go potty' 
  #subset(new_uni, uni_lemma=="well") # change to "well (modifier)"?
  subset(new_uni, uni_lemma=="little") # change to "little (amount)"
  #subset(new_uni, uni_lemma=="policeman") # 16 forms have police, but 14 have 'policeman' -> change
  #subset(new_uni, uni_lemma=="which") # change Spanish & Korean question word "which" -> "which (question)"
  subset(new_uni, uni_lemma=="take out") # Russian -> "remove"
  subset(new_uni, uni_lemma=="put in") # Turk & Korean - change to "insert" ?
  #subset(new_uni, uni_lemma=="fireman") # change Dutch & Irish to firefighter
  #subset(new_uni, uni_lemma=="yummy") # 7 forms have yummy, 6 have tasty
  #subset(new_uni, uni_lemma=="nanny") # change Dutch and Hebrew to 'babysitter'
  #subset(new_uni, uni_lemma=="eyebrows") # singularize
  #subset(new_uni, uni_lemma=="bzzz") # Hebrew -> "buzz"
  #subset(new_uni, uni_lemma=="thanks") # Dutch -> "thank you"
  #subset(new_uni, uni_lemma=="brush") # Irish/Hungarian -> brush (object)
  #subset(new_uni, uni_lemma=="comb") # Dutch & Irish -> comb (object)
  #subset(new_uni, uni_lemma=="brawl") # Norwegian -> fight
  
  # bigger merges:
  #subset(new_uni, uni_lemma=="carrots") # -> carrot
  #subset(new_uni, uni_lemma=="kind") # 5, but 30 have 'nice' -> updated!
  subset(new_uni, uni_lemma=="back") # some need disambiguating... (prepositions vs. body parts vs. locations)
  subset(new_uni, uni_lemma=="hot") # vs. hot (temperature) ?
  subset(new_uni, uni_lemma=="pretty") # 31 vs. 22 beautiful, cute (39)
  #subset(new_uni, uni_lemma=="teeth") # 47 have tooth
  subset(new_uni, uni_lemma=="light") # -> light (object)
  subset(new_uni, uni_lemma=="donut") # vs. pastry - combine, or no?
  subset(new_uni, uni_lemma=="backyard") # 4 -> yard ? (a couple forms do have both..)
  subset(new_uni, uni_lemma=="wardrobe") # 9 -> closet (21 forms)
  #subset(new_uni, uni_lemma=="village") # 6 -> town (5)
  subset(new_uni, uni_lemma=="biscuit") # are these 11 'cookie'?
  # combine all 'pen' and 'pencil' into 'pen/pencil' ?
  # mittens -> mitten ?
  # gloves -> glove ?
  # stick -> stick (object) / (action)
  # mad (2) -> angry ?
  # keys -> key ?
  # hurt -> (action) / (description)
  # horrible <-> terrible ?
  
  # various songbirds: swallow, sparrow, robin (1), pigeon, magpie (1)
  
  # siren noises?
  subset(new_uni, uni_lemma=="weee") # Russian
  subset(new_uni, uni_lemma=="bi boo (siren)") # Cantonese
  # nino nino ?
  
  # going after hapaxes
  View(new_uni_tab)
  
  subset(new_uni, uni_lemma=="boulder") # -> stone / rock (object) ?
  subset(new_uni, uni_lemma=="although") # Brit Eng -> though / but ?
  #subset(new_uni, uni_lemma=="catch/tag") # Croat -> tag
  #subset(new_uni, uni_lemma=="afterwards") # Nor -> "after" ?
  #subset(new_uni, uni_lemma=="bike") # Irish -> bicycle
  #subset(new_uni, uni_lemma=="answer") # respond/reply? (OK)
  #subset(new_uni, uni_lemma=="blade") # Eng Brit -> knife
  #subset(new_uni, uni_lemma=="bloom") # action - OK
  subset(new_uni, uni_lemma=="board game") # game?
  subset(new_uni, uni_lemma=="braid") # Mand Beij -> braid (object)
  #subset(new_uni, uni_lemma=="cherries") # Latvian -> cherry
  #subset(new_uni, uni_lemma=="chess") # -> board game
  
  #subset(new_uni, uni_lemma=="quilt") # Swedish already has blanket, so OK
  subset(new_uni, uni_lemma=="promptly") # quickly?
  subset(new_uni, uni_lemma=="probably") # Turkish - ok 
  subset(new_uni, uni_lemma=="promise") # Eng British - ok
  #subset(new_uni, uni_lemma=="present/gift") # Croatian -> present (also, Dutch/Latvian/Norwegian gift -> present)
  #subset(new_uni, uni_lemma=="potato chip") # Mand Tai -> chips
  
  
  #subset(new_uni, uni_lemma=="be able to")
  subset(new_uni, uni_lemma=="at/in/on") # Korean
  subset(new_uni, uni_lemma=="be sleepy") # Italian sleepy?
  subset(new_uni, uni_lemma=="be thirsty") # Italian thirst?
  subset(new_uni, uni_lemma=="be angry") # Latvian
  subset(new_uni, uni_lemma=="brother's name") # Russian -> "sibling's name" ?
  subset(new_uni, uni_lemma=="sister's name") # Russian -> "sibling's name" ?
  subset(new_uni, uni_lemma=="his/her/their")
  subset(new_uni, uni_lemma=="how many?")
  
  subset(new_uni, uni_lemma=="bi boo (siren)")
  #subset(new_uni, uni_lemma=="colour") # Irish -> color (action)
  subset(new_uni, uni_lemma=="colouring") # Irish "toys"
  subset(new_uni, uni_lemma=="colors") # "toys"
  #subset(new_uni, uni_lemma=="bookcase") # Sp Mex -> bookshelf
  subset(new_uni, uni_lemma=="eat (action)")
  #subset(new_uni, uni_lemma=="don’t")
  subset(new_uni, uni_lemma=="do (verb)") # Dutch -> do
  subset(new_uni, uni_lemma=="handkerchief") # Mandarin -> tissue ? technically no..
  subset(new_uni, uni_lemma=="modelling clay") # Croatian -> play dough (change forms with 'clay' to play dough?)
  subset(new_uni, uni_lemma=="rodent") # Dutch hamster/cavia -> mouse..?
  subset(new_uni, uni_lemma=="repair (verb)") # Dutch -> fix
  subset(new_uni, uni_lemma=="rashers") # bacon
  
  #subset(new_uni, uni_lemma=="adult") # Korean -> man / woman ?
  subset(new_uni, uni_lemma=="durable") # 
  subset(new_uni, uni_lemma=="fit (action)")
  subset(new_uni, uni_lemma=="flag/banner")
  subset(new_uni, uni_lemma=="fish") # Sp Eur
  
  subset(new_uni, uni_lemma=="night/tonight") # Irish -> diaper
  
  subset(new_uni, uni_lemma=="calm/silent") # calm (4) /silent (0) / quiet (26)
  subset(new_uni, uni_lemma=="raise") # German: lift - Korean: raise ?
  
  tail(new_uni_tab, 100)
  
}
