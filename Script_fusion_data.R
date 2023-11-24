## Créer un vecteur pour les noms de fichier csv.
pageviewcsv <- c("fr_pageview_rawdata.csv",
                 "eng1_pageview_rawdata.csv",
                 "eng2_pageview_rawdata.csv",
                 "eng3_pageview_rawdata.csv")

## Créer un data frame vide
pageviewrawdata <- data.frame()

## créer un chemin relatif
relative_path <- file.path("_Sharedfolder_CPET", "rawdata",
                           pageviewcsv)

## Faire une boucle sur chaque csv et les fusionner dans le même dataframe
for (file in seq_along(relative_path))
{
temp_data <- read.csv(relative_path[file], skip = 9)[, -c(8, 9)]
pageviewrawdata <- rbind(pageviewrawdata, temp_data)
}

## Changer le nom des colonnes
colnames(pageviewrawdata) <- c("path", "date", "view", "user", "userview",
                               "duration", "event")
