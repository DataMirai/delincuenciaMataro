if(!require("pacman")){install.packages("pacman")}
pacman::p_load("tidyverse","readxl")


   
read_excel_allsheets <- function(filename, tibble = FALSE) {
  # I prefer straight data.frames
  # but if you like tidyverse tibbles (the default with read_excel)
  # then just pass tibble = TRUE
  sheets <- readxl::excel_sheets(filename)
  x <- lapply( sheets , function(X) readxl::read_excel(filename, sheet = X , skip = 24 ))
  if(!tibble) {x <- lapply(x, as.data.frame)}
  names(x) <- sheets
  x
}

dfpolicia <- read_excel_allsheets("REF_21900.xls")

names(dfpolicia[1])


dfpolicia[[1]] %>%
  mutate("Any"= names(dfpolicia[1]) )
  

dfpolicia %>% 
  map( ~mutate(., names(.))) %>% 
  bind_rows()
