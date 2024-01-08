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

## Clean l'environnement
rm(Mandat1PaysAnglais,
   Mandat2PaysAnglais,
   Mandat2PaysFrancais,
   Mandat1PaysFrancais)

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

##  Agréger les données par catégories.

PAYSagrégé <- DfPaysMandat1et2 %>%
  group_by(Catégorie) %>%
summarise("V / K"   = sum(view[Verdict == "Réalisée"]),
          "V / P"   = sum(view[Verdict == "Partiellement réalisée"]),
          "V / B"   = sum(view[Verdict == "Rompue"]),
          "M / K"   = mean(view[Verdict == "Réalisée"]),
          "M / P"   = mean(view[Verdict == "Partiellement réalisée"]),
          "M / B"   = mean(view[Verdict == "Rompue"]),
          "UV / K"  = sum(userview[Verdict == "Réalisée"]),
          "UV / PK" = sum(userview[Verdict == "Partiellement réalisée"]),
          "UV / B"  = sum(userview[Verdict == "Rompue"]),
          "UM / K"  = mean(userview[Verdict == "Réalisée"]),
          "UM / PK" = mean(userview[Verdict == "Partiellement réalisée"]),
          "UM / B"  = mean(userview[Verdict == "Rompue"]),
          "D / K"   =    sum(duration[Verdict == "Réalisée"]),
          "D / PK"  =   sum(duration[Verdict == "Partiellement réalisée"]),
          "D / B"   =    sum(duration[Verdict == "Rompue"]),
          "D / K"   =   mean(duration[Verdict == "Réalisée"]),
          "D / PK"  =  mean(duration[Verdict == "Partiellement réalisée"]),
          "D / B"   =   mean(duration[Verdict == "Rompue"]),
          "E / K"   =    sum(event[Verdict == "Réalisée"]),
          "E / PK"  =   sum(event[Verdict == "Partiellement réalisée"]),
          "E / B"   =    sum(event[Verdict == "Rompue"]),
          "E / K"   =   mean(event[Verdict == "Réalisée"]),
          "E / PK"  =  mean(event[Verdict == "Partiellement réalisée"]),
          "E / B"   =   mean(event[Verdict == "Rompue"]))


## Créer un data frame vide pour le Canada
DfCanadaMandat1et2<- data.frame()

## Garder uniquement les views du Canada
DfCanadaMandat1et2 <- subset(DfPaysMandat1et2, grepl("Canada", country))

CANADAagrégé <- DfCanadaMandat1et2 %>%
  group_by(Catégorie) %>%
  summarise("VK" = sum(view[Verdict %in% c("Réalisée", "Partiellement réalisée")]),
            "VB" = sum(view[Verdict == "Rompue"]),
            "MK" = mean(view[Verdict %in% c("Réalisée", "Partiellement réalisée")]),
            "MB" = mean(view[Verdict == "Rompue"]),
            "UVK" = sum(userview[Verdict %in% c("Réalisée", "Partiellement réalisée")]),
            "UVB" = sum(userview[Verdict == "Rompue"]),
            "UMK" = mean(userview[Verdict %in% c("Réalisée", "Partiellement réalisée")]),
            "UMB" = mean(userview[Verdict == "Rompue"]),
            "DK" =    sum(duration[Verdict %in% c("Réalisée", "Partiellement réalisée")]),
            "DB" =    sum(duration[Verdict == "Rompue"]),
            "DMK" =   mean(duration[Verdict %in% c("Réalisée", "Partiellement réalisée")]),
            "DMB" =   mean(duration[Verdict == "Rompue"]),
            "EK" =    sum(event[Verdict %in% c("Réalisée", "Partiellement réalisée")]),
            "EB" =    sum(event[Verdict == "Rompue"]),
            "EMK" =   mean(event[Verdict %in% c("Réalisée", "Partiellement réalisée")]),
            "EMB" =   mean(event[Verdict == "Rompue"]))

write.csv(CANADAagrégé, file = "_SharedFolder_CPET/CleanData/CanadaAgrégéGA.csv", row.names = FALSE)






##

grouped_data <- DfCanadaMandat1et2 %>%
  group_by(Catégorie)

# Now you can perform operations on each group, for example, calculate summary statistics
summary_stats <- grouped_data %>%
  summarise(sum_value = sum(Verdict),
            total_count = n())

## dplyr::full_join, inner join, left join,
table(DfCanadaMandat1et2$Catégorie, DfCanadaMandat1et2$view)

## TEST POUR VILLES
Mandat1VilleAnglais <- read.csv("_SharedFolder_CPET/rawdata/dataGA/Mandat1VilleAnglais.csv", skip = 9)[, -c(8, 9)]
Mandat1VilleFrancais <- read.csv("_SharedFolder_CPET/rawdata/dataGA/Mandat1VilleFrancais.csv", skip = 9)[, -c(8, 9)]

aggregate(view ~ Catégorie, data = DfCanadaMandat1et2, sum)

result_aggregate <- aggregate(Vues ~ Ville, data = Mandat1VilleFrancais, sum)

# Order the result by the "Vues" column in descending order
result_ordered <- result_aggregate[order(-result_aggregate$Vues), ]


