source("Scripts/Data_preparing.R")
policia


policia %>%
  filter(grepl("furt", policia$tipus ) )



policia %>%
  filter(grepl("drogues", policia$tipus ) )


policia %>%
  filter(grepl("sex", policia$tipus ) )



