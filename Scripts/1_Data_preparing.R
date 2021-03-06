# Preparacion de librerias ----

if(!require("pacman")){install.packages("pacman")}
pacman::p_load("tidyverse","readxl", "data.table","RColorBrewer","viridis", "knitr")


# Preparacion de datos ---------------------------------------------------------
# funcion lectura de todas las hojas del excel
read_excel_allsheets <- function(filename, tibble = FALSE) {
  sheets <- readxl::excel_sheets(filename)
  x <- lapply( sheets , function(X) readxl::read_excel(filename, sheet = X , skip = 24 ))
  if(!tibble) {x <- lapply(x, as.data.frame)}
  names(x) <- sheets
  return(x)
}

policia <- read_excel_allsheets("Data/REF_21900.xls")
noms<- c("barri","sexe","edat","categoria","tipus","var1","var2","Any")


# Creacion Data frame policia -------------------------------------------------------------

policia <- policia %>% 
  map2(.,names(policia), function(x,Any){cbind(x,Any)} ) %>%
  map(., set_names, noms) %>%
  rbindlist(.) %>%
  as.tibble(.) %>%
  select(-c(var1,var2)) %>%
  filter(Any!=2015)


policia2021 <- as.tibble(read_excel_allsheets("Data/REF_22970.xls")) %>% 
  map_df(., set_names, c("barri","sexe","edat","categoria","tipus","var1","var2")) %>%
  select(-c(var1,var2)) %>%
  mutate(Any= 2021) %>%
  as.tibble()


 
policia <- rbind(policia,policia2021)

policia %>%
  arrange(desc(Any))
# Limpieza de variables auxiliares ---------------------------------------------
rm(noms, read_excel_allsheets,policia2021 )
