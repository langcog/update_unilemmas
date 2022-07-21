library(wordbankr)
library(tidyverse)
source("update_unilemmas.R")

language = "English (Irish)"
outdir = "final_instruments/"

# no changes
instr_name <- "[English_Irish_WS].csv"
instr <- read_csv(paste0("old_instruments/",instr_name))
instr %>% write_csv(file=paste0(outdir,instr_name))
