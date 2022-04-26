
library(wordbankr)
library(tidyverse)

instr <- wordbankr::get_instruments() %>% 
  filter(form=="WG" | form=="WS") %>%
  arrange(desc(unilemma_coverage))
  
# which languages have both WG and WS, and pretty good uni-lemma coverage?
wgws <- instr %>% select(language, form, unilemma_coverage) %>%
  pivot_wider(id_cols=language, names_from=form, values_from=unilemma_coverage) 
# 27 languages with both forms, and some have good coverage on one form but not the other -- try to merge by definitions?

wgws$language
# for each language, make a script for merging new uni-lemmas and outputting each instrument

# only works with WG / forms with comprehension and production ?
get_form_data <- function(language, save=T, form="WG") {
  d_demo <- 
    get_administration_data(language = language, form = form) 
  
  items <- get_item_data(language = language, form=form) %>%
    filter(type=="word")
  
  d_long <- get_instrument_data(language = language, form = form) %>% # 418 items
    left_join(items %>% select(-complexity_category), by="num_item_id") %>%
    filter(type=="word")
  
  if(!"" %in% unique(d_long$value)) print(paste("No blank responses in",language,"-- replace NAs with ''?"))
  
  # any other exceptions?
  if(form=="WG" & (language=="Danish" | language=="Norwegian")) {
    d_long <- d_long %>% mutate(value = replace_na(value, ""))
  }
  
  d_long <- d_long %>%
    mutate(produces = as.numeric(value == "produces"),
           comprehends = as.numeric(value == "understands"))
  print(paste("retrieved data for",length(unique(d_long$data_id)),language,"participants for form",form))
  #table(d_long$value)
  
  d_prod <- d_long %>% select(data_id, item_id, produces) %>%
    pivot_wider(id_cols = data_id, names_from = item_id, 
                values_from = produces) %>%
    data.frame() 
  
  rownames(d_prod) = d_prod$data_id
  d_prod$data_id = NULL
  d_prod <- d_prod %>% data.matrix
  
  # only for comprehension (WG/young forms)
  if(form!="WS") {
    d_comp <- d_long %>% select(data_id, item_id, comprehends) %>%
      pivot_wider(id_cols = data_id, names_from = item_id, 
                  values_from = comprehends) %>%
      data.frame()
  
    rownames(d_comp) = d_comp$data_id
    d_comp$data_id = NULL
    d_comp <- d_comp %>% data.matrix
    
    d_comp <- d_prod + d_comp # anything you produce, you also comprehend
    
    if(save) save(d_demo, items, d_long, d_prod, d_comp, # d_long was d_long_wg
                  file=paste0("data/",language,"_",form,"_data.Rdata"))
    return(list(d_demo=d_demo, items=items, d_long=d_long, d_prod=d_prod, d_comp=d_comp))
  } else { # WS -- no comprehension data
    if(save) save(d_demo, items, d_long, d_prod, 
                  file=paste0("data/",language,"_",form,"_data.Rdata"))
    return(list(d_demo=d_demo, items=items, d_long=d_long, d_prod=d_prod))
  }
  
  
}


merge_ws_wg_data <- function(language, save=T) {
  wg_dat <- get_form_data(language, form="WG", save=F) # 250 Croatian Ss
  
  #uni <- update_unilemmas(language)
  # how many on both forms?
  uni %>% filter(WS!="",WG!="")
  
  ws_dat <- get_form_data(language, form="WS", save=F) # 377 Croatian Ss
  
  
  d_demo <- wg_dat$d_demo %>% bind_rows(ws_dat$d_demo %>% mutate(comprehension=NA))
  
  item_def <- wg_dat$items %>% select(category, lexical_category, definition, uni_lemma) %>% 
    inner_join(ws_dat$items %>% select(category, lexical_category, definition, uni_lemma), by="definition")
  item_uni <- wg_dat$items %>% select(category, lexical_category, definition, uni_lemma) %>% 
    inner_join(ws_dat$items %>% select(category, lexical_category, definition, uni_lemma), by="uni_lemma")
  # setdiff(item_uni$definition.x, item_uni$definition.y)
  # setdiff(item_uni$definition.y, item_uni$definition.x)
  # could merge by uni_lemma, but they are undefined in some forms
  # merge by definition alone? may have some non-1-to-1 matches
  # though Croatian actually has more overlapping uni-lemmas than item definitions (!)
  # 396 WG items, 717 WS items; 349 overlapping definitions; 363 overlapping uni_lemmas
  # -- merge by def/uni, whichever gives the largest overlap
  def_match = length(intersect(wg_dat$items$definition, ws_dat$items$definition)) # 349
  uni_match = length(intersect(wg_dat$items$uni_lemma, ws_dat$items$uni_lemma)) # 363 
  
  # should just do it by uni_lemma unless one of the forms has <50% of uni_lemmas defined, then try 
  
  save(d_demo, items)
  # join item dfs by whichever overlap is highest
}


get_form_data("English (British)", form="Oxford CDI")
get_form_data("Mandarin (Beijing)", form="IC")

# not many ASL subjects, but how much do the forms overlap? can we combine..?
#get_form_data("American Sign Language", form="FormA") # 6 subjects..
get_form_data("American Sign Language", form="FormBTwo") # 20 subjects
#get_form_data("American Sign Language", form="FormBOne") # 19 subjects
#get_form_data("American Sign Language", form="FormC") # 18 subjects

# add these to languages for IRT fits
langs_different_forms = c("English (British)", "Mandarin (Beijing)", "American Sign Language")

# should we try adding WS data from languages with no WG data? e.g., German
#get_form_data("German", form="WS")

# generalization test: try using proposed short lists on Portuguese 
# ToDo: code uni_lemmas for short list

# do real-data simulations of CATs for each language

languages = c("Kigiriama",  "British Sign Language",
              "Croatian","Danish","English (American)",
              "Italian","Mandarin (Taiwanese)","French (French)", 
              "Korean", "Latvian", "Hebrew", "Norwegian", "French (Quebecois)",
              "Slovak", "Spanish (European)", "Spanish (Mexican)",
              "Russian", "Turkish", "Portuguese (European)") 

for(lang in languages) {
  get_form_data(lang)
}


langs_new_unilemmas <- c("Spanish (European)", "Mandarin (Taiwanese)", "Mandarin (Beijing)",
                         "Korean", "Latvian", "Portuguese (European)") 
unilemma_files = c("[Spanish_European_WG].csv", "[Mandarin_Taiwanese_WG].csv", 
                   "[Mandarin_Beijing_IC].csv", "[Korean_WG].csv", 
                   "[Latvian_WG].csv", "[Portuguese_European_WG].csv")

add_new_unilemmas <- function(language, unilemma_file) {
  load(paste("data/",language,"_WG_data.Rdata", sep=''))
  # load item table with newly-coded uni_lemma
  its_uni <- read_csv(paste0("updated_unilemmas/",unilemma_file))
  items <- items %>% select(-uni_lemma) %>% 
    left_join(its_uni %>% select(definition, uni_lemma))
  d_long <- d_long %>% select(-uni_lemma) %>%
    left_join(its_uni %>% select(definition, uni_lemma))
  save(d_demo, items, d_long, d_prod, d_comp,
       file=paste("data/",language,"_WG_data.Rdata", sep=''))
}

for(i in 1:length(langs_new_unilemmas)) {
  add_new_unilemmas(langs_new_unilemmas[i], unilemma_files[i])
}

# warnings:
#1: In load(paste("data/", language, "_WG_data.Rdata", sep = "")) :
#  input string '面包' cannot be translated to UTF-8, is it valid in 'CP1252'?

