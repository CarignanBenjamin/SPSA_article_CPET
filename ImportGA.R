## Loader les paquets
pacman::p_load(openxlsx, tidyverse)

## Importer les données GA après le CES
Mandat1PaysAnglais <-  read.csv("_SharedFolder_CPET/rawdata/dataGA/Mandat1PaysAnglais.csv", skip = 9)[, -c(8, 9)]
Mandat2PaysAnglais <-  read.csv("_SharedFolder_CPET/rawdata/dataGA/Mandat2PaysAnglais.csv", skip = 9)[, -c(8, 9)]
Mandat1PaysFrancais <- read.csv("_SharedFolder_CPET/rawdata/dataGA/Mandat1PaysFrancais.csv", skip = 9)[, -c(8, 9)]
Mandat2PaysFrancais <- read.csv("_SharedFolder_CPET/rawdata/dataGA/Mandat2PaysFrancais.csv", skip = 9)[, -c(8, 9)]

## Créer un data frame vide
DfPaysMandat1et2<- data.frame()

## Bind les dataframes
DfPaysMandat1et2 <- rbind(
  Mandat1PaysAnglais,
  Mandat2PaysAnglais,
  Mandat1PaysFrancais,
  Mandat2PaysFrancais)

## Changer le nom des colonnes
colnames(DfPaysMandat1et2) <- c("path", "country", "view", "user",
                               "userview", "duration", "event")

## Changer les noms de path
DfPaysMandat1et2 <- DfPaysMandat1et2 %>%
  mutate(path = sub("/en/trudeau/promises/", "", path)) %>%
  mutate(path = sub("/fr/trudeau/promises/", "", path))

## Importer le worksheet Trudeau avec les colonnes souhaitées
DfPolimetre <- openxlsx::read.xlsx("_SharedFolder_CPET/rawdata/PolimètreTrudeau.xlsx",
                            sheet = 2,
                            startRow = 1,
                            colNames = TRUE,
                            cols = c(2, 5, 27))

## Merging de DfPaysMandat1et2
DfPaysMandat1et2 <- merge(DfPaysMandat1et2, DfPolimetre, by.x = "path", by.y = "Numéro")

## Créer un data frame vide pour le Canada
DfCanadaMandat1et2<- data.frame()

## Garder uniquement les views du Canada
DfCanadaMandat1et2 <- subset(DfPaysMandat1et2, grepl("Canada", country))

## dplyr::full_join, inner join, left join,

