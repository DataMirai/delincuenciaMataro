source("Scripts/2_Diccionario_tipos_delitos.R")
Encoding("UFT-8")

## Categorías generales

policia<- policia %>%
  mutate(tipus = as.character(tipus) ) %>%
  mutate( tipus_general = case_when(
    tipus %in% transgresiones_patrimonio ~ "Patrimonio",
    tipus %in% transgresiones_integridad ~ "Integridad",
    tipus %in% transgresiones_ofensas_comunidad ~ "Ofensas comunidad",
    tipus %in% transgresiones_altres ~ "Otros"))%>%
  as.data.frame(.)

## Subcategorías
policia<- policia %>%
  mutate(tipus = as.character(tipus) ) %>%
  mutate( sub_tipus = case_when(
    tipus %in% trangresiones_robos ~"Robos",
    tipus %in% trangresiones_fraude ~ "Fraude",
    tipus %in% trangresiones_fiscales ~ "Fiscalidad",
    tipus %in% transgresiones_medioambiente ~ "Medioambiente",
    tipus %in% transgresiones_consumidor ~ "Al consumidor",
    tipus %in% trangresiones_propiedad_privada ~ "Propiedad privada",
    tipus %in% transgresiones_danos ~ "Daños",
    tipus %in% trangresiones_homicidos ~ "Homicidios",
    tipus %in% transgresiones_familia ~"Familia",
    tipus %in% transgresiones_fisico ~ "Fisico",
    tipus %in% transgresiones_psicologica ~ "Psicologica",
    tipus %in% transgresiones_libertad_intimidad_identidad ~ "Libertad intimidad/identidad",
    tipus %in% transgresiones_sexual ~ "Sexual",
    tipus %in% transgresiones_menores ~ "Menores",
    tipus %in% transgresiones_animales ~ "Animales",
    tipus %in% transgresiones_autoridad ~ "Autoridad",
    tipus %in% transgresiones_armas ~ "Armas",
    tipus %in% transgresiones_drogas ~ "Drogas",
    tipus %in% transgresiones_comportamientos_disidentes ~ "Comportamientos disidentes",
    tipus %in% trangresiones_seguridad_vial ~ "Seguridad vial",
    tipus %in% transgresiones_salud_publica ~ "Salud pública",
    tipus %in% transgresiones_altres ~ "Otros"))%>%
  as.data.frame(.)

rm(list=setdiff(ls(), "policia"))