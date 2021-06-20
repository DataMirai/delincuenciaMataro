source("Scripts/Data_preparing.R")
source("Scripts/diccionario_tipos_delitos.R")

policia

policia %>%
  mutate(tipus = as.character(tipus) ) %>%
  mutate( sub_tipus = case_when(
    tipus %in% transgresiones_altres ~ "altres",
    tipus %in% transgresiones_armas ~ "armas",
    tipus %in% transgresiones_animales ~ "animales",
    tipus %in% transgresiones_autoridad ~ "autoridad",
    tipus %in% transgresiones_comportamientos_disidentes ~ "putosamos",
    tipus %in% transgresiones_consumidor ~"consumidor",
    tipus %in% transgresiones_danos ~ "danos",
    tipus %in% transgresiones_drogas ~ "drogues" ,
    tipus %in% transgresiones_familia ~ "familia",
    tipus %in% transgresiones_fisico ~ "fisics",
    tipus %in% transgresiones_integridad ~" integridad" ,
    tipus %in% transgresiones_libertad_intimidad_identidad ~ "libertad" ,
    tipus %in% transgresiones_medioambiente ~ " medioambiente",
    tipus %in% transgresiones_menores ~ "menores" ,
    tipus %in% transgresiones_ofensas_comunidad ~ "comunidad",
    tipus %in% transgresiones_patrimonio ~ "patrimoni",
    tipus %in% transgresiones_psicologica ~ "Psicologicos",
    tipus %in% transgresiones_salud_publica ~ "Salud Publica",
    tipus %in% transgresiones_sexual ~ "Sexual")) %>%
  as.data.frame(.) 


policia %>% 
  mutate( sub_tipus = case_when(
    tipus %in% transgresiones_animales ~ "animales",
    tipus %in% transgresiones_danos ~ "danos",
    tipus %in% transgresiones_drogas ~ "drogues" ,
    tipus %in% transgresiones_libertad_intimidad_identidad ~ "libertad" ,
    tipus %in% transgresiones_menores ~ "menores" ,
    tipus %in% transgresiones_psicologica ~ "Psicologicos",
    tipus %in% transgresiones_salud_publica ~ "Salud Publica",
    tipus %in% transgresiones_sexual ~ "Sexual")) %>%
  as.data.frame(.)
