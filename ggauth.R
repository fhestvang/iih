library(googleAnalyticsR)
library(googleAuthR)
library(googleTagManageR)
library(devtools)
library(tidyjson)
library(jsonlite)
library(listviewer)
library(tidyverse)
library(magrittr)

## Autherization
options(googleAuthR.scopes.selected = "https://www.googleapis.com/auth/analytics.edit")
ga_auth(new_user = TRUE)
df <- ga_account_list()

## Domain matches
domains <- c("iform.dk", "youtube", "iform.nu", "iform.se", "kuntoplus.fi", "natgeo.dk", "natgeo.no", "natgeo.se", "natgeo.fi", "historienet.dk", "historienet.no", "varldenshistoria.se", "historianet.fi", "historianet.nl", "illvid.dk", "illvit.no", "illvet.se", "tieku.fi", "wibnet.nl", "altomhistorie.dk", "allverdenshistorie.no", "alltomhistoria.se", "maailmanhistoria.net", "militarhistoria.se", "popularhistoria.se", "slakthistoria.se", "aktivtraening.dk", "aktivtrening.com", "aktivtraning.se", "digitalfoto.dk", "digital-foto.no", "digitalfotoforalla.se", "digi-kuva.fi", "goerdetselv.dk", "gjoerdetselv.com", "gds.se", "teeitse.com", "komputer.dk", "komputer.no", "pctidningen.se", "kotimikro.fi", "boligmagasinet.dk", "costume.dk", "costume.no", "bobedre.dk", "bo-bedre.no", "scandiliv.nl", "magasinetliv.dk", "bilmagasinet.dk", "woman.dk", "boligpluss.no", "tara.no", "stylista.no", "stellamagasinet.no", "idenyt.dk", "viivilla.se", "viivilla.no", "voresvilla.dk", "wype.dk", "wype.no", "wypemagazine.se", "wype.fi", "moreshop.dk", "moreshop.no", "moreshop.se", "maaltid.nu", "maaltid.no", "https://www.docma.nu/da", "https://www.docma.nu/no", "https://www.docma.nu/se", "https://www.docma.nu/fi", "https://bonniershop.dk", "https://bonniershop.com", "bonniershop.nu", "https://bonniershop.fi", "http://magasingave.dk", "http://magasingave.no", "tidningsgava.se", "sinunlahjalehtesi.fi", "https://kundeservice.nu/da-DK/", "https://kundeservice.com/nb-NO/", "https://kundtjanst.nu/sv-SE/", "https://bonnierjulkaisut.fi/fi-FI/", "iformkostdagbog.dk", "iformkostdagbok.no", "iformkostdagbok.se", "http://fooddiary.fi", "bonnierexpeditions.dk", "bonnierexpeditions.no", "bonnierexpeditions.se", "bonnierexpeditions.fi", "http://activefit.dk/", "http://activefit.no/", "bmf1.dk", "eirinkristiansen.no", "annijor.no", "nettenestea.com", "emilietommerberg.com", "marenplatou.com", "cathinthecity.com", "tarapi.no", "siljeokland.com", "agnesgulbrandsen.no", "anneauchocolat.dk", "taraweekend.no", "idenytpuzzle.dk")
matches <- paste(domains, collapse ="|")

## Unique sites
df$websiteUrl %>% unique()


## Dataset
df %>% 
  filter(grepl(websiteUrl, pattern = matches)) %>% 
  select(websiteUrl, webPropertyId, accountId, accountName, webPropertyName) %>% 
  unique() %>%
  mutate(domain = gsub("http://", "", websiteUrl)) %>% 
  mutate(domain = gsub("https://", "", domain)) %>% 
  mutate(domain = gsub("www.", "", domain)) %>% 
  mutate(domain = gsub("/", "", domain)) #%>% 
  print(row.names = FALSE)

