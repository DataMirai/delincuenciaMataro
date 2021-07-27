#Create new Data Frame

barri<-c("Centre", "Eixample", "Palau-Escorxador", "Rocafonda", "Vista Alegre", "Molins-Torner", "Cirera", "La Llàntia", "Cerdanyola", "Peramàs", "Pla d’en Boet", "Mataró")

poblacio2016 <- c( 4467, 31301, 6941, 11002, 7359, 5850, 10640, 4015, 30614, 7901, 5541, 125631)

poblacio2017 <- c(4510, 31528, 6970, 11055, 7378, 5878, 10635, 3988, 30826, 7831, 5560, 126159)

poblacio2018 <- c(4581, 31782, 7015, 11345, 7444, 5895, 10607, 4051, 30945, 7852, 5497, 127014)

poblacio2019 <- c( 4683, 32008, 7247, 11562, 7495, 5884, 10596, 4063, 31194, 7928, 5631, 128291)

poblacio2020 <- c( 4767, 32549, 7338, 11730, 7544, 5846, 10795, 4061, 31513, 7914, 5623, 129680)

delitos2016 <- c( 62, 355, 142, 140, 100, 74, 148, 20, 438, 108, 402, 2383)
delitos2017 <- c( 55, 343, 118, 140, 236, 65, 155, 11, 443, 100, 380, 2241)
delitos2018 <- c( 68, 354, 133, 186, 210, 85, 166, 28, 445, 104, 327, 2309)
delitos2019 <- c( 63, 412, 126, 189, 242, 104, 154, 22, 524, 100, 357, 2477)
delitos2020 <- c( 163, 580, 220, 282, 269, 141, 259, 49, 779, 182, 375, 3759)
delitos2020sinmultas <- c( 102, 414, 130, 196, 187, 77, 164, 29, 540, 101, 260, 2393)

poblacion_delitos <- data.frame(barri, poblacio2016, poblacio2017, poblacio2018, poblacio2019, poblacio2020, 
                                delitos2016, delitos2017, delitos2018, delitos2019, delitos2020, delitos2020sinmultas)

rm(list=setdiff(ls(), "poblacion_delitos"))

# Set colors

customGreen0 = "#DeF7E9"

customGreen = "#71CA97"

customRed = "#ff7f7f"


pob_del_17<- poblacion_delitos%>%
  filter(barri != "Mataró")%>%
  mutate(comparacion1617 = (delitos2016 - delitos2017))%>%
  mutate(percen_del = round(delitos2017/ sum(delitos2017)*100, digits=2))%>%
  mutate(percen_pob = round(poblacio2017/ sum(poblacio2017)*100, digits=2))%>%
  select(barri, poblacio2017, percen_pob, delitos2017, percen_del, comparacion1617)
  

colnames(pob_del_17) <- c("Barrio", "Población", "% total población", "Nº delitos", "% total delitos", "Comparación respecto 2016")

improvement_formatter <- formatter("span", 
                                   style = x ~ style(font.weight = "bold", 
                                                     color = ifelse(x > 0, customRed, ifelse(x < 0, customGreen, "black"))), 
                                   x ~ icontext(ifelse(x>0, "arrow-up", "arrow-down"), x)
)

formattable(pob_del_17, 
            align =c("l", "c", "c", "c", "c", "r"), 
            list(
              `Barri` = formatter("span", style = ~ style(color = "grey",font.weight = "bold")) ,
              `Población` =  color_tile(customGreen, customRed),
              `% total población` = color_tile(customGreen, customRed),
              `Nº delitos`=  color_tile(customGreen, customRed),
              `% total delitos` =  color_tile(customGreen, customRed),
              `Comparación respecto 2016` = improvement_formatter
            ))
