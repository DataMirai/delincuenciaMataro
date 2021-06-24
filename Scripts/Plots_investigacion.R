source("Scripts/Data_preparing.R")
source("Scripts/diccionario_tipos_delitos.R")
source("Scripts/data_con_diccionarios.R")

policia$Any <- as.factor(policia$Any)

## 1 ----
policia%>%
  group_by(Any)%>%
  tally()%>%
  ggplot(aes(x= Any, y = n, fill= Any))+
  geom_bar(stat = "identity")+
  xlab("Año")+
  ylab("Nº delitos")+
  ggtitle("Delitos cometidos por años")

policia_delitos_agreados_ano<- policia%>%
  filter(tipus != "Circular via publica excepte suposits rd463/2020" & sub_tipus != "Otros")%>%
  group_by(Any, sub_tipus, tipus_general)%>%
  tally()%>%
  ggplot(aes(x= Any, y = n, fill= sub_tipus))+
  geom_bar(position="stack", stat = "identity")+
  xlab("Año") +
  ylab("Nº delitos")+
  ggtitle("Delitos cometidos por años")+
  dark_theme_bw()+
  scale_fill_manual( values=rainbow(22))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

ggplotly(policia_delitos_agreados_ano)
## 2 ----
#Gráfico nº delitos cometidos facet_wrap por año y cada columna representa una categoría.

policia%>%
  filter(tipus != "Circular via publica excepte suposits rd463/2020")%>%
  group_by(sub_tipus, tipus_general, Any)%>%
  tally()%>%
  ggplot(aes(x=sub_tipus, y= n, fill=sub_tipus))+
  geom_bar(stat = "identity")+
  facet_wrap(~Any)+
  xlab("Tipo delitos")+
  ylab("Nº delitos")+
  ggtitle("Nº delitos cometidos por año y tipo")+
  dark_theme_bw()+
  scale_fill_manual( values=c('#63CFE0','#AD1545','#7E40E5', '#99CCFF'))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))



 policia%>%
  filter(Any == 2016) %>%
  group_by(sub_tipus, tipus_general, Any)%>%
  tally()%>%
  ggplot(aes(x=sub_tipus, y= n, fill=tipus_general))+
  geom_bar(stat = "identity")+
  xlab("Tipo delitos")+
  ylab("Nº delitos")+
  ggtitle("Nº delitos cometidos por año y tipo")+
  dark_theme_bw()+
  scale_fill_manual( values=c('#63CFE0','#AD1545','#7E40E5'))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
ggplotly(a)  


policia %>%
  filter(sub_tipus =="Otros" & Any == 2020) %>%
  group_by(tipus)%>%
  tally()

