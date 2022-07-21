require(tidyverse)
require(here)

pronouns <- read_csv("pronouns.csv")
final_insts <- list.files("final_instruments")

update_pronouns <- function() {
  for (inst_file in final_insts) {
    inst_name <- sub("\\[(.*?)\\]\\.csv", "\\1", inst_file)
    inst <- read_csv(here("final_instruments", inst_file))
    inst_pron <- pronouns |> filter(instr == inst_name)
    if (nrow(inst_pron) > 0) {
      inst <- inst |> 
        left_join(inst_pron |> select(itemID, new_uni_lemma)) |> 
        mutate(uni_lemma = coalesce(new_uni_lemma, uni_lemma)) |> 
        select(-new_uni_lemma)
    }
    write_csv(inst, here("final_instruments_pro", inst_file))
  }
}

update_pronouns()


