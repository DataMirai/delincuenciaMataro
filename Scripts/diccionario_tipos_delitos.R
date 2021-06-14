source("Scripts/Data_preparing.R")


#trasngresionees a la propiedad -> hurto + robo, estafa,  destruccion ...
#trasngresionees a la persona  -> transgresiones psicologicos / transgresiones a la integridad física 
#Ofensas contra la comunidad / seguridad ciudadana: conducir sin licencia, incumplimiento de condena judiciial,Atemptat a  agents de l' autoritat,Danys,Conduir sota els efectes d'alcohol)

tipos_delitos <- as.character(unique(policia$tipus))

tipos_delitos
# PROPIEDAD ----------------------------------------------------------------------------------------

# propiedad_main ----
transgresiones_patrimonio<- c(
  "Furt (lleu)",
  "Ocupació immobles (lleu)",
  "Receptació i altres conductes afins",
  "Falsificació document públic, oficial o mercantil",
  "Robatori amb violència i/o intimidació",
  "Robatori amb força interior vehicle",
  "Impagament de prestacions",
  "Apropiació indeguda (lleu)",
  "Entrada a vivenda aliena",
  "Danys (lleu)",
  "Apropiació indeguda",
  "Altres estafes",
  "Robatori amb força",
  "Robatori o furt d'ús de vehicle",
  "Altres estafes (lleu)",
  "Defraudacions de fluïd elèctric i anàlogues (lleu)",
  "Apropiació indeguda de vehicle",
  "Maltractament d'obra sense lesió (lleu)",
  "Altres falsificacions documentals",
  "Apropiació indeguda de vehicle (lleu)",
  "Altres faltes administratives",
  "Documental",
  "Danys / deslluïments de béns mobles / immobles",
  "Furt interior vehicle (lleu)",
  "Falsificació de moneda i efectes timbrats",
  "Infracció consum",
  "Vehicle abandonat",
  "Exped/distrib moneda falsa coneix. falsedat (lleu)",
  "Estafes bancàries targetes",
  "Estafes bancàries targetes (lleu)",
  "Permanència / ocupació immoble / via pública",
  "Furt interior vehicle",
  "Robatori i furt d'ús de vehicle amb intimidació",
  "Estafes informàtiques",
  "Contra la propietat industrial",
  "Manca de registres obligatoris",
  "Omissió dades obligatòries als registres",
  "Defraudacions",
  "Realització arbitrària del propi dret",
  "Dleg 1/2009 text refós llei reguladora de residus",
  "Incendi",
  "Llei 2/2010 de pesca i acció marítimes",
  "Llei 6/88 forestal de catalunya",
  "Incompliment norm. regl. fulls reclamació",
  "Violació de domicili jurídic",
  "Intrusió en sistemes informàtics",
  "Rd 1/2001 text refós de la llei d'aigües",
  "Insolvències punibles",
  "Incompl. obligació d'obtenir la doc. personal",
  "Llei de marina mercant",
  "Infracció venda",
  "Negligència custòdia documentació personal",
  "Irregularitats en el registre del resguard"
  
)

# propiedad_sub ----
trangresiones_robos<-c(
  "Furt (lleu)",
  "Receptació i altres conductes afins",
  "Furt",
  "Robatori amb violència i/o intimidació",
  "Robatori amb força interior vehicle",
  "Apropiació indeguda (lleu)",
  "Apropiació indeguda",
  "Robatori amb força",
  "Robatori o furt d'ús de vehicle",
  "Apropiació indeguda de vehicle" ,
  "Apropiació indeguda de vehicle (lleu)",
  "Furt interior vehicle (lleu)",
  "Furt interior vehicle" ,
  "Robatori i furt d'ús de vehicle amb intimidació",
  "Danys imprudents (lleu)"
)

trangresiones_fraude<-c(
  "Falsificació document públic, oficial o mercantil",
  "Altres estafes (lleu)",
  "Altres estafes",
  "Defraudacions de fluïd elèctric i anàlogues (lleu)",
  "Altres falsificacions documentals",
  "Falsificació de moneda i efectes timbrats",
  "Exped/distrib moneda falsa coneix. falsedat (lleu)",
  "Estafes bancàries targetes",
  "Estafes bancàries targetes (lleu)",
  "Estafes informàtiques"
)

trangresiones_fiscales <- c(
  "Impagament de prestacions",
  "Apropiació indeguda (lleu)",
  "Apropiació indeguda",
  "Defraudacions de fluïd elèctric i anàlogues (lleu)",
  "Falsificació de moneda i efectes timbrats",
  "Estafes bancàries targetes",
  "Estafes bancàries targetes (lleu)",
  "Extorsió",
  "Defraudacions",
  "Insolvències punibles",
  "Llei de marina mercant",
  "Infracció venda"
)

transgresiones_medioambiente<- c(
  "Llei 2/2010 de pesca i acció marítimes",
  "Incendi",
  "Dleg 1/2009 text refós llei reguladora de residus",
  "Llei 6/88 forestal de catalunya",
  "Rd 1/2001 text refós de la llei d'aigües"
)

transgresiones_consumidor<-c(
  "Manca fulls reclamació",
  "Venda/subminist alcohol menors",
  "Infracció consum",
  "Manca de registres obligatoris",
  "Omissió dades obligatòries als registres",
  "Dleg 1/2009 text refós llei reguladora de residus",
  "Incompliment norm. regl. fulls reclamació",
  "Tolerar/no impedir consum drogues en locals",
  "Infracció venda",
  "Cultiu de drogues tòxiques llocs visible al públic",
  "Irregularitats en el registre del resguard",
  "Contra la salut pública (consum)" 
)

trangresiones_propiedad_privada<-c(
  "Entrada a vivenda aliena",
  "Ocupació immobles (lleu)",
  "Danys (lleu)",
  "Apropiació indeguda",
  "Robatori o furt d'ús de vehicle",
  "Apropiació indeguda de vehicle",
  "Apropiació indeguda de vehicle (lleu)",
  "Danys / deslluïments de béns mobles / immobles",
  "Contra la propietat industrial",
  "Intrusió en sistemes informàtics"
)

transgresiones_daños<-c(
  "Maltractament d'obra sense lesió (lleu)",
  "Robatori amb força",
  "Danys (lleu)",
  "Danys / deslluïments de béns mobles / immobles",
  "Incendi",
  "Danys imprudents (lleu)"
)

# PERSONA ------------------------------------------------------------------------------------------

# persona_main ----
transgresiones_integridad<-c(
  "Lesions (lleu)",
  "Hostilitat i humiliació (laboral)",
  "Amenaces (lleu)",
  "Robatori amb violència i/o intimidació",
  "Violència fís/psíq habitual a l'àmbit familiar",
  "Lesions",
  "Agressió sexual (víctima menor de 16 anys)",
  "Maltractaments en l'àmbit de la llar",
  "Amenaces",
  "Actes contacte menors 16 per realitzar del. sexual",
  "Coaccions",
  "Abandonament temporal de menor",
  "Usurpació (lleu)",
  "Assetjament",
  "Agressió sexual amb penetració (menor de 16 anys)",
  "De la usurpació de l'estat civil",
  "Coaccions (lleu)",
  "Abandonament d'animals domèstics (lleu)",
  "Abús sexual amb penetració( menor 16 anys)",
  "Agressions sexuals amb penetració",
  "Dleg 2/2008 protecció d'animals",
  "Descobriment i revelació de secrets",
  "Exhibició d'objectes perillosos finalitat intimida",
  "Injúria (lleu)",
  "Agressions sexuals",
  "Abús sexual (víctima menor de 16 anys)",
  "Inducció de menors a l'abandonament de domicili",
  "Seguretat",
  "Calumnia",
  "Homicidi per imprudència menys greu (lleu)",
  "Actes contacte menors 16 per sol·lic. mater. porno",
  "Robatori i furt d'ús de vehicle amb intimidació",
  "Vexacions i/o injuries pers.173.2 (lleu)",
  "Abús sexual (víctima menor més gran de 16 anys)",
  "Extorsió",
  "Abusos sexuals",
  "Homicidi per imprudència greu",
  "Sol. rel. sex. amb men/discap a canvi remuner/prom",
  "Abús sexual amb penetració (menor més gran16)",
  "Tracte degradant / vexatori",
  "Homicidi dolós",
  "Abusos sexuals amb penetració",
  "Abandonament de familia",
  "Violació de secrets",
  "Vend/difus/exhib mater. porno menors/discapacitats",
  "Pornografia de menors/discapacitats",
  "Lesions per imprudència greu",
  "Avortament",
  "Sostracció de menor",
  "Injúria",
  "Lesions al fetus",
  "Acusació, denúncia falsa",
  "Lesions (baralla tumultuària)",
  "Trencament dels deures de custòdia",
  "Lesions per imprudència menys greu (lleu)",
  "Abandonament de menor d'edat o discapacitat",
  "Maltractament d'animal domèstic",
  "Ipf viol/intim. prosti/proxene.menors/discapacitat",
  "Segrest"
)

trangresiones_homicidos<-c(
  "Homicidi per imprudència greu",
  "Homicidi per imprudència menys greu (lleu)",
  "Homicidi dolós"
)

# persona_sub ----
transgresiones_familia<-c(
  "Violència fís/psíq habitual a l'àmbit familiar",
  "Maltractaments en l'àmbit de la llar",
  "Abandonament de familia",
  "Sostracció de menor",
  "Trencament dels deures de custòdia",
  "Abandonament de menor d'edat o discapacitat"
)

transgresiones_fisico<-c(
  "Lesions (lleu)",
  "Robatori amb violència i/o intimidació",
  "Violència fís/psíq habitual a l'àmbit familiar",
  "Lesions",
  "Agressió sexual amb penetració (menor de 16 anys)",
  "Agressions sexuals",
  "Abús sexual amb penetració( menor 16 anys)",
  "Agressions sexuals amb penetració",
  "Abús sexual (víctima menor de 16 anys)",
  "Homicidi per imprudència menys greu (lleu)",
  "Abús sexual (víctima menor més gran de 16 anys)",
  "Abusos sexuals amb penetració",
  "Lesions per imprudència greu",
  "Lesions al fetus",
  "Avortament",
  "Lesions (baralla tumultuària)",
  "Lesions per imprudència menys greu (lleu)",
  "Segrest"
)

transgresiones_psicologica<-c(
  "Hostilitat i humiliació (laboral)",
  "Violència fís/psíq habitual a l'àmbit familiar",
  "Maltractaments en l'àmbit de la llar",
  "Assetjament",
  "Descobriment i revelació de secrets",
  "Exhibició d'objectes perillosos finalitat intimida",
  "Injúria (lleu)",
  "Calumnia",
  "Robatori i furt d'ús de vehicle amb intimidació",
  "Vexacions i/o injuries pers.173.2 (lleu)",
  "Extorsió",
  "Tracte degradant / vexatori",
  "Injúria",
  "Terrorisme",
  "Segrest"
)

transgresiones_libertad_intimidad_identidad<-c(
  "Coaccions",
  "Amenaces (lleu)",
  "Amenaces",
  "Usurpació (lleu)",
  "De la usurpació de l'estat civil",
  "Coaccions (lleu)",
  "Descobriment i revelació de secrets",
  "Exhibició d'objectes perillosos finalitat intimida",
  "Injúria (lleu)",
  "Inducció de menors a l'abandonament de domicili",
  "Captar imatges via pública més de l'imprescindible",
  "Calumnia",
  "Vexacions i/o injuries pers.173.2 (lleu)",
  "Extorsió",
  "Tracte degradant / vexatori",
  "Contra exer. drets fonamentals i llib. públiques",
  "Intrusió en sistemes informàtics",
  "Violació de secrets",
  "Vend/difus/exhib mater. porno menors/discapacitats",
  "Pornografia de menors/discapacitats",
  "Incompl. obligació d'obtenir la doc. personal",
  "Avortament",
  "Negligència custòdia documentació personal",
  "Sostracció de menor",
  "Injúria",
  "Acusació, denúncia falsa",
  "Terrorisme",
  "Segrest"
)

transgresiones_sexual<-c(
  "Agressió sexual (víctima menor de 16 anys)",
  "Actes contacte menors 16 per realitzar del. sexual",
  "Agressió sexual amb penetració (menor de 16 anys)",
  "Abús sexual amb penetració( menor 16 anys)",
  "Agressions sexuals amb penetració",
  "Agressions sexuals",
  "Abús sexual (víctima menor de 16 anys)",
  "Actes contacte menors 16 per sol·lic. mater. porno",
  "Abús sexual (víctima menor més gran de 16 anys)",
  "Abusos sexuals",
  "Sol. rel. sex. amb men/discap a canvi remuner/prom",
  "Abús sexual amb penetració (menor més gran16)",
  "Abusos sexuals amb penetració",
  "Vend/difus/exhib mater. porno menors/discapacitats",
  "Pornografia de menors/discapacitats",
  "Actes exhibició obscena/atemptin llib. sexual",
  "Ipf viol/intim. prosti/proxene.menors/discapacitat"
)

transgresiones_menores<-c(
  "Actes contacte menors 16 per realitzar del. sexual",
  "Abandonament temporal de menor",
  "Agressió sexual amb penetració (menor de 16 anys)",
  "Abús sexual amb penetració( menor 16 anys)",
  "Abús sexual (víctima menor de 16 anys)",
  "Inducció de menors a l'abandonament de domicili",
  "Actes contacte menors 16 per sol·lic. mater. porno",
  "Abús sexual (víctima menor més gran de 16 anys)",
  "Sol. rel. sex. amb men/discap a canvi remuner/prom",
  "Abús sexual amb penetració (menor més gran16)",
  "Vend/difus/exhib mater. porno menors/discapacitats",
  "Sostracció de menor",
  "Trencament dels deures de custòdia",
  "Abandonament de menor d'edat o discapacitat",
  "Ipf viol/intim. prosti/proxene.menors/discapacitat"
)

trangresiones_animales<- c(
  "Abandonament d'animals domèstics (lleu)",
  "Dleg 2/2008 protecció d'animals",
  "Deixar solts animals ferotges/abandonar domèstics",
  "Maltractament d'animal domèstic"
)

# COMUNIDAD ----------------------------------------------------------------------------------------

# comunidad_main ----
transgresiones_ofensas_comunidad<-c(
  "Consum o tinença drogues o abandonament estris",
  "Celebr.reunio/manif. infrac. lo 9/1983 comunicades",
  "Tinença/utilit.armes reg. excedint-se límits",
  "Tinença o utilització d'armes prohibides",
  "Cond. amb priv. judicial caut. o def. permís/llicè",
  "Conduir sense haver obtingut mai permís o llicèn.",
  "Infraccions a les ordenances municipals",
  "Contra la salut pública (tràfic drogues)",
  "Altres infraccions contra la 4/2015 (sense comís)",
  "Falta respecte i consideració als membres fcs",
  "Resistència, desobediència a agents de l'autoritat",
  "Conduir sota els efectes d'alcohol",
  "Trencament de condemna (resolució judicial)",
  "Omissió comunicacions obligatòries pg-me",
  "Negativa a sotmetre's a les proves",
  "Tinença de drogues relacionades amb dil. penals",
  "Intervenció temporal d'armes/ efectes",
  "Atemptat a  agents de l' autoritat",
  "Simulació de delictes",
  "Ús indegut uniformes/insignies cossos policials",
  "Conducció temerària",
  "Dur/exhb/utilz. armes de manera negl/temer/intimid",
  "Exhibició d'objectes perillosos finalitat intimida",
  "Detenció il·legal",
  "Negativa  identificar-se o al·legar dades falses",
  "Obstrucció a la justícia i deslleialtat prof.",
  "Tolerància / manca diligència subs estupefaents",
  "Tinença d'armes i explosius",
  "Manca fulls reclamació",
  "Consum begudes alcohòliques en lloc públics",
  "Venda/subminist alcohol menors",
  "Conduir sota els efectes d'alcohol i drogues",
  "Altres infraccions contra la 4/2015 (amb comís)",
  "Captar imatges via pública més de l'imprescindible",
  "Atemptat a autoritat / funcionari públic",
  "Altres irregularitats complimentació registres obl",
  "Deixar solts animals ferotges/abandonar domèstics",
  "Altres infraccions relacionades amb medi ambient",
  "Realització arbitrària del propi dret",
  "Exhibicionisme",
  "Originar un greu risc per la circulació",
  "Ultratges a espanya",
  "Aldarulls públics greus",
  "Infraccions ordenança convivència ciutadana",
  "Notificació pèrdua vigència per punts",
  "Contra els drets dels treballadors",
  "Manca col·laboració amb forces cossos seguretat",
  "Usurpació de funcions públiques",
  "Actes exhibició obscena/atemptin llib. sexual",
  "Tolerar/no impedir consum drogues en locals",
  "Resistència, desobediència a l'autoritat",
  "Intrusió instal. servei bàsic interferint funcion.",
  "Ps-negativa a prestar auxili o col.laboració fcs ",
  "Trencament de condemna (lleu)",
  "Reunió/manif. no comun/prohibida instal. bàsica",
  "Conduir sota els efectes de drogues",
  "Negativa lliurar doc. pers. acordat la retirada",
  "Cultiu de drogues tòxiques llocs visible al públic",
  "Obstrucció a la justícia i deslleialtat prof(lleu)",
  "Desordres públics",
  "Grups criminals",
  "Acusació, denúncia falsa",
  "Circular via publica excepte suposits rd463/2020",
  "Obstaculització funcionament serveis emergència",
  "Abandonament lloc accident",
  "Ipf viol/intim. prosti/proxene.menors/discapacitat",
  "Terrorisme",
  "Contra la salut pública (consum)",
  "Velocitat penalment punible"
)

# comunidad_sub ----

transgresiones_autoridad<- c(
  "Infraccions a les ordenances municipals",
  "Falta respecte i consideració als membres fcs",
  "Resistència, desobediència a agents de l'autoritat",
  "Trencament de condemna (resolució judicial)",
  "Trencament de condemna (lleu)",
  "Omissió comunicacions obligatòries pg-me",
  "Negativa a sotmetre's a les proves",
  "Atemptat a  agents de l' autoritat",
  "Ús indegut uniformes/insignies cossos policials",
  "Detenció il·legal",
  "Negativa  identificar-se o al·legar dades falses",
  "Obstrucció a la justícia i deslleialtat prof.",
  "Atemptat a autoritat / funcionari públic",
  "Manca de registres obligatoris",
  "Omissió dades obligatòries als registres",
  "Realització arbitrària del propi dret",
  "Ultratges a espanya",
  "Infraccions ordenança convivència ciutadana",
  "Contra els drets dels treballadors",
  "Manca col·laboració amb forces cossos seguretat",
  "Usurpació de funcions públiques",
  "Resistència, desobediència a l'autoritat",
  "Ps-negativa a prestar auxili o col.laboració fcs ",
  "Negativa lliurar doc. pers. acordat la retirada",
  "Obstrucció a la justícia i deslleialtat prof(lleu)",
  "Grups criminals",
  "Acusació, denúncia falsa",
  "Obstaculització funcionament serveis emergència",
  "Consum compartit alcohol via pública/espai public"
)

transgresiones_armas<-c(
  "Tinença/utilit.armes reg. excedint-se límits",
  "Tinença o utilització d'armes prohibides",
  "Intervenció temporal d'armes/ efectes",
  "Dur/exhb/utilz. armes de manera negl/temer/intimid",
  "Exhibició d'objectes perillosos finalitat intimida",
  "Tinença d'armes i explosius"
)

transgresiones_drogas<-c(
  "Consum o tinença drogues o abandonament estris",
  "Tinença de drogues relacionades amb dil. penals",
  "Tolerància / manca diligència subs estupefaents",
  "Conduir sota els efectes d'alcohol i drogues",
  "Tolerar/no impedir consum drogues en locals",
  "Conduir sota els efectes de drogues",
  "Cultiu de drogues tòxiques llocs visible al públic",
  "Consum compartit alcohol via pública/espai public"
)

trangresiones_comportamientos_disidentes<-c(
  "Celebr.reunio/manif. infrac. lo 9/1983 comunicades",
  "Reunió/manif. no comun/prohibida instal. bàsica",
  "Trencament de condemna (resolució judicial)",
  "Conduir sota els efectes d'alcohol",
  "Falta respecte i consideració als membres fcs",
  "Resistència, desobediència a agents de l'autoritat",
  "Negativa a sotmetre's a les proves",
  "Atemptat a  agents de l' autoritat",
  "Simulació de delictes",
  "Ús indegut uniformes/insignies cossos policials",
  "Conducció temerària",
  "Dur/exhb/utilz. armes de manera negl/temer/intimid",
  "Exhibició d'objectes perillosos finalitat intimida",
  "Consum begudes alcohòliques en lloc públics",
  "Conduir sota els efectes d'alcohol i drogues",
  "Vehicle abandonat",
  "Permanència / ocupació immoble / via pública",
  "Atemptat a autoritat / funcionari públic",
  "Deixar solts animals ferotges/abandonar domèstics",
  "Exhibicionisme",
  "Aldarulls públics greus",
  "Actes exhibició obscena/atemptin llib. sexual",
  "Resistència, desobediència a l'autoritat",
  "Intrusió instal. servei bàsic interferint funcion.",
  "Conduir sota els efectes de drogues",
  "Desordres públics",
  "Consum compartit alcohol via pública/espai public",
  "Ipf viol/intim. prosti/proxene.menors/discapacitat",
  "Grups criminals",
  "Terrorisme",
  "Velocitat penalment punible"
)

trangresiones_seguridad_vial<- c(
  "Cond. amb priv. judicial caut. o def. permís/llicè",
  "Conduir sense haver obtingut mai permís o llicèn.",
  "Conduir sota els efectes d'alcohol",
  "Conduir sota els efectes d'alcohol i drogues",
  "Originar un greu risc per la circulació",
  "Notificació pèrdua vigència per punts",
  "Circular via publica excepte suposits rd463/2020",
  "Abandonament lloc accident",
  "Velocitat penalment punible"
)

transgresiones_salud_publica<- c(
  "Contra la salut pública (tràfic drogues)",
  "Contra la salut pública (consum)" 
)

# ALTRES ----
transgresiones_altres<- c(
  "Altres infraccions contra la 4/2015 (sense comís)",
  "Altres estafes",
  "Altres estafes (lleu)",
  "Altres falsificacions documentals",
  "Altres faltes administratives",
  "Documental",
  "Altres infraccions contra la 4/2015 (amb comís)",
  "Seguretat",
  "Altres irregularitats complimentació registres obl",
  "Altres infraccions relacionades amb medi ambient",

  "No es detecta infracció",
  "Risc provocats per altres agents"

)

# CATEGORIAS  --------------------------------------------------------------------------------------

policia_particion_categoria <- list(
  policia %>% filter(categoria=="FALTES ADMINISTRATIVES" ),
  policia %>% filter(categoria=="DELICTES")
)
