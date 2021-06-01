source("Scripts/Data_preparing.R")





# DAÑOS a la propiedad ----

policia %>%
  filter(categoria == "FALTES ADMINISTRATIVES") %>%
  group_by(tipus, Any ) %>%
  count(tipus) %>%
  arrange(desc(n))


policia %>%
  filter( tipus %in% c("Circular via publica excepte suposits rd463/2020") ) %>%
  ggplot(aes(tipus, fill=sexe ))+
  geom_bar() +
  facet_wrap(~barri)+
  theme( axis.text = element_text(angle=90))

c("Falta contra la propietat industrial",
  "Falta de deslluiment de bens mobles i immobles",
  "Falta de furt","Falta d\'estafa (bancària)" )

########################
#la gente consume o posee drogas casi el doble de lo que se peta el covid, 
#y a su vez se petan el covid el triple que lo que le faltan el respeto a los ageentes de la autoridad y posesiond e arma

#trasngresionees a la propiedad -> hurto + robo, estafa,  destruccion ...
#trasngresionees a la persona  -> transgresiones psicologicos / transgresiones a la integridad física 
#Ofensas contra la comunidad / seguridad ciudadana: conducir sin licencia, incumplimiento de condena judiciial,Atemptat a  agents de l' autoritat,Danys,Conduir sota els efectes d'alcohol)


policia %>%
  filter(categoria == "FALTES ADMINISTRATIVES") %>%
  select(tipus) %>%
  group_by(tipus) %>%
  count(tipus) %>%
  arrange(desc(n)) %>%
  data.frame(.)

policia %>%
  filter(categoria == "FALTES PENALS") %>%
  ggplot(aes(tipus, fill=sexe ))+
  geom_bar() +
  facet_wrap(~barri)+
  theme( axis.text = element_text(angle=90))


########################

policia %>%
  filter(categoria == "DELICTES") %>%
  select(tipus) %>%
  group_by(tipus) %>%
  count(tipus) %>%
  arrange(desc(n)) %>%
  data.frame(.)


policia %>%
  filter(categoria == "DELICTES") %>%
  ggplot(aes(tipus, fill=sexe ))+
  geom_bar() +
  facet_wrap(~barri)+
  theme( axis.text = element_text(angle=90))

unique(policia$barri)

policia %>%
  filter(barri == "VISTA ALEGRE (Mataró)") %>%
  ggplot(aes(tipus, fill=sexe ))+
  geom_bar() +
  theme( axis.text = element_text(angle=90))


# Sexo y drogas -----


policia %>%
  filter(grepl("drogues", policia$tipus ) )%>%  
  select(tipus) %>%
  group_by(tipus) %>%
  count(tipus) %>%
  arrange(desc(n)) %>%
  data.frame(.)

policia %>%
  filter(grepl("sex", policia$tipus ) )%>%
  group_by(tipus) %>%
  count(tipus) %>%
  arrange(desc(n)) %>%
  data.frame(.)

# MULTAS COVID -----

policia %>%
  filter ( tipus =="Circular via publica excepte suposits rd463/2020") %>%
  group_by(barri,sexe) %>%
  count() %>%
  ggplot(aes(sexe,n, fill=sexe ))+
  geom_col() +
  facet_wrap(~barri)


policia %>%
  filter ( tipus =="Circular via publica excepte suposits rd463/2020") %>%
  group_by( barri) %>%
  summarize(recuento= as.numeric(n()) ) %>%
  arrange(desc(recuento)) %>%
  data.frame(.)%>%
  
  ggplot(aes( barri, recuento,fill = barri))+
  geom_bar(stat="identity") +
  scale_fill_manual("legend", values =viridis(length(unique(policia$barri))))+
  theme(axis.text = element_text(angle=90))

