##### SCRIPT POUR SPSA - CES 2021 #####

### Library used
library(foreign)
library(tidyverse)
library(haven)
library(readstata13)
library(ggtext)
library(psych)
library(modelsummary)
source("BindOpenQuestion.R")
source("CleanOpenQuestion.R")
source("FilterOpenQuestion.R")
source("ModeOpenQuestion.R")

#### VARIABLE DE GROUPING (Most Preferred Issue) :
# "cps21_imp_iss"

#### CONFIANCE POLITIQUE
## Variables potentielles
# "cps21_demsat", "cps21_fed_gov_sat", "cps21_lib_promises"
# "pes21_dem_sat", "pes21_keepromises", "pes21_govtcare",
# "pes21_conf_inst1_1", "pes21_populism_3", "pes21_populism_4",
# "pes21_populism_8"

#### SOPHISTICATION POLITIQUE
## Variables potentielles
# "cps21_education", "cps21_interest_gen_1", "cps21_interest_elxn_1",
# "cps21_govt_confusing", "cps21_govt_say", "cps21_news_cons", "cps21_premier_name",
# "cps21_finmin_name", "cps21_govgen_name", "cps21_debate_fr", "cps21_debate_fr2",
# "cps21_debate_en", "pes21_campatt", "pes21_discfam"

## SES

# "cps21_province", cps21_citizenship, cps21_yob, cps21_genderid, cps21_trans,
# "cps21_employment, cps21_income_cat, cps21_yob_2, cps21_property, cps21_marital
# "pes21_province", pes21_lang, pes21_occ_cat

## Importation des colonnes souhaitées
CES21 <- data.frame(
  read_dta("_SharedFolder_CPET//2021 Canadian Election Study v1.0.dta",
           col_select = c("cps21_imp_iss", "cps21_demsat", "cps21_fed_gov_sat", "cps21_lib_promises", "pes21_dem_sat", "pes21_keepromises", "pes21_govtcare",
                          "pes21_conf_inst1_1", "pes21_populism_3", "pes21_populism_4", "cps21_yob_2", "cps21_genderid",
                          "pes21_populism_8", "cps21_education", "cps21_interest_gen_1", "cps21_interest_elxn_1",
                          "cps21_govt_confusing", "cps21_govt_say", "cps21_news_cons", "cps21_premier_name", "pes21_votechoice2021",
                          "cps21_finmin_name", "cps21_govgen_name", "cps21_debate_fr", "cps21_debate_fr2", "cps21_income_number",
                          "cps21_debate_en", "pes21_campatt", "pes21_discfam", "cps21_province", "pes21_lang")))

### CLEANING
## Most Preferred Issue
### Cleaning de cps21_imp_iss

## What is the most important issue to you personally in this federal election?

# *** Pour commencer à filter, il faut d'abord rouler la première ligne du code
# *** seule. Une fois que IMPISS est dans l'environnement, on peut rouler tout
# *** le bloc d'un coup.

CPSIMPISS <- FilterOpenQuestion2(CES21, "cps21_imp_iss",  c("taxes", "taxation", "over taxation", "tax the rich", "economy", "economie", "work", "housing affordability",
                                                            "housing", "cost of living", "affordable housing", "leconomie", "economic recovery", "jobs", "deficit",
                                                            "finance", "l'economie", "the economy", "wages", "labour", "labor", "income inequality", "income",
                                                            "affordability", "income equality", "budget", "debt", "poverty", "la dette", "employment", "homelessness",
                                                            "finances", "fiscal responsibility", "money", "inflation", "tax", "housing prices", "housing crisis",
                                                            "relance economique", "national debt", "economic", "les finances", "housing costs", "dette", "the deficit",
                                                            "universal basic income", "federal debt", "unemployment", "government debt", "la relance economique",
                                                            "lower taxes", "balancing the budget", "economics", "economy recovery", "job security", "l economie",
                                                            "reprise economique", "the debt", "affordable living", "spending", "le deficit", "la reprise economique",
                                                            "les finances publiques", "basic income", "finances publiques", "high taxes", "housing market", "job",
                                                            "la pauvrete", "logement", "lowering taxes", "the cost of living", "wealth inequality", "emploi",
                                                            "economic stability", "le budget", "le cout de la vie", "economy and jobs", "job creation", "deficits",
                                                            "finance publique", "financial", "taxing the rich", "the budget", "the federal debt", "canadas debt",
                                                            "canadian economy", "country debt", "economic recovery from the pandemic","endettement", "high cost of living",
                                                            "income tax", "job opportunities", "la dette du canada", "largent", "lemploi", "rising cost of living", "argent",
                                                            "poverty and homelessness", "cost of living/housing", "cost of housing", "balance budget", "economic growth",
                                                            "economic inequality", "economic recovery from covid", "economic recovery from pandemic", "economy and taxes",
                                                            "economy and cost of living", "economique", "economie du pays","economic recovery post covid", "house prices",
                                                            "financial security", "federal deficit", "equilibre budgetaire", "getting the economy back on track",
                                                            "lendettement", "low income housing", "living costs", "les depenses", "lequilibre budgetaire", "pauvrete",
                                                            "poverty and inequality", "reducing taxes", "reduction du deficit", "remboursement de la dette", "standard of living"
),"Economy & Labour")
CPSIMPISSa <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("Vaccine", "health", "santé", "healthcare", "health care", "covid19", "covid", "covid 19",
                                                                "coronavirus",  "la sante", "pandemic", "pandemie", "la pandemie", "covid response", "covid recovery",
                                                                "the pandemic", "vaccine passports",  "mental health", "la covid", "pharmacare", "pandemic recovery",
                                                                "la gestion de la pandemie", "gestion de la pandemie", "pandemic response", "vaccine mandates", "long term care",
                                                                 "vaccines", "systeme de sante", "covid19 response", "corona", "covid management",
                                                                "le systeme de sante", "senior health care", "vaccine passport", "covid 19 recovery", "vaccination",
                                                                "covid pandemic", "covid19 recovery", "heath care", "le covid",  "getting covid under control",
                                                                "les soins de sante", "soins de sante", "social issues",  "public health", "passeport vaccinal",
                                                                "covid control", "covid vaccinations", "ending the pandemic", "health care for seniors", "health system",
                                                                "heathcare", "la covid19", "la vaccination", "medical",  "social services",
                                                                "vaccine mandate", "covid policies", "covid policy", "covid restrictions",  "dealing with covid",
                                                                "dealing with covid19", "gestion covid", "gestion de la crise sanitaire", "getting through the pandemic",
                                                                "lapres pandemie", "la gestion de la covid",
                                                                "mandatory vaccines", "recovery from covid", "recovery from the pandemic",
                                                                "transfert en sante", "transferts en sante",  "covid crisis", "covid passports", "famille",
                                                                "garderie", "covid 19 pandemic", "controlling covid", "handling of the pandemic", "health care funding",
                                                                "health issues", "la vaccination obligatoire", "les transferts en sante", "medical care", "managing the pandemic",
                                                                "managing covid", "post pandemic recovery", "post covid recovery",  "universal health care"
), "Health & Social Services")

CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSa)
CPSIMPISSz <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("child care", "seniors","childcare", "senior care","seniors issues","seniors care","senior issues",
                                                                "pensions", "pension", "seniors benefits","daycare","help for seniors", " les aines", "les personnes agees",
                                                                 "les aines", "senior benefits","care for seniors","seniors pensions"), "Familles")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSz)
CPSIMPISSb <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("Agriculture", "autonomie des provinces"), "Public Lands & Agriculture")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSb)
CPSIMPISSc <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("Education", "student loans", "student debt", "leducation"), "Education")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSc)
CPSIMPISSd <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("Environment", "environnement"," the environment", "lenvironnement", "pollution", "climat", "climate",
                                                                "climate change", "changement climatique", "the environment", "les changements climatiques", "global warming",
                                                                "changements climatiques", "climate crisis", "environmental issues", "le climat", "rechauffement climatique",
                                                                "climate control", "environement", "environmental", "climate action", "ecologie", "the climate crisis",
                                                                "le rechauffement climatique", "climate emergency", "le changement climatique", "crise climatique", "lecologie",
                                                                "enviroment", "environment/climate change", "environmental protection", "la crise climatique", "pipelines",
                                                                "addressing climate change", "ethics in government", "environnement et changements climatiques",
                                                                "climate change/environment", "lenvironement", "environment and climate change", "the environment/climate change",
                                                                "lenvironnement et les changements climatiques"), "Environment & Energy")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSd)
CPSIMPISSe <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("Immigration", "limmigration", "stop immigration", "inmigrations", "womens rights", "womans rights",
                                                                "racism", "racisme", "racisme systemique",
                                                                "human rights", "indigenous rights", "indigenous issues", "reconciliation",
                                                                "indigenous reconciliation", "indigenous affairs",
                                                                "abortion",  "indigenous relations"), "Minorities")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSe)
CPSIMPISSf <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("Crime", "gun control", "safety", "firearms", "armes à feu", "freedom", "equality",
                                                                "freedom of rights", "justice", "la liberte", "rights and freedoms", "social justice",
                                                                "equity", "fair", "fairness", "personal freedom", "unity", "inequality", "liberte", "freedom of speech",
                                                                 "freedom of choice"), "Law & Crime")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSf)
CPSIMPISSg <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("le francais", "lindependance du quebec", "la langue francaise",
                                                                "le quebec", "respect du quebec"), "Identité et Nationalisme")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSg)
CPSIMPISSh <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("International Affairs", "Defense", "war", "china"), "International Affairs & Defense")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSh)
CPSIMPISSi <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("Government Operations", "accountability", "honesty", "leadership", "integrity", "electoral reform", "ethics",
                                                                "transparency", "government spending", "corruption", "truth", "trust", "respect des competences provinciales",
                                                                "un gouvernement majoritaire", "avoir un gouvernement minoritaire", "avoir un gouvernement majoritaire",
                                                                "democracy", "honestly", "proportional representation", "le pouvoir", "le respect des competences provinciales",
                                                                "government corruption", "gouvernement majoritaire", "election reform", "ethics in government", "honnetete",
                                                                "honest government"), "Governments & Governance")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSi)
CPSIMPISSj <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("Culture", "art"
), "Arts & Culture")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSj)
CPSIMPISS$cps21_imp_iss[CPSIMPISS$cps21_imp_iss %in% c("99", "nothing", "not sure", "getting rid of trudeau", "i dont know", "none", "je ne sais pas", "dont know",
                                                       "aucun", "get rid of trudeau", "n/a", "aucune idee", "idk", "na", "je sais pas", "unsure", "rien",
                                                       "getting rid of the liberals", "getting trudeau out", "no comment", "no issue", "?", "sortir trudeau", "trudeau",
                                                       "no", "ubi", "change", ".", "economie et environnement", "la sante et leducation", "changer de gouvernement",
                                                       "aucune", "everything", "getting rid of justin trudeau", "getting trudeau out of office", "tout", "to get trudeau out",
                                                       "who is going to win the election", "getting trudeau out of power", "ne sais pas", "no opinion", "ne sait pas",
                                                       "health care and taxes", "sortir les liberaux", "to get rid of trudeau", "undecided", "who to vote for")] <- NA
CleanOpenQuestion("CPSIMPISS")
ModeOpenQuestion(CPSIMPISS, "cps21_imp_iss", 10)
# Sont exclus les réponses en lien avec la partisanerie et le vote partisan, les
# je ne sais pas/préfère ne pas répondre et autres réponses peu claires. Les
# analyses ont été arrêtés à partir de 3 occurences d'une même réponse car
# autrement ce serait trop time consuming.


## Création d'un data.frame vide
numRows <- nrow(CES21)
CleanData <- data.frame(length = numeric(numRows))

## SES
# Province / Region
CleanData$Region <- NA
CleanData$Region[as.numeric(CES21$cps21_province ) == 5] <- "Atlantic"
CleanData$Region[as.numeric(CES21$cps21_province ) == 10] <- "Atlantic"
CleanData$Region[as.numeric(CES21$cps21_province ) == 7] <- "Atlantic"
CleanData$Region[as.numeric(CES21$cps21_province ) == 4] <- "Atlantic"
CleanData$Region[as.numeric(CES21$cps21_province ) == 11] <- "Quebec"
CleanData$Region[as.numeric(CES21$cps21_province ) == 9] <- "Ontario"
CleanData$Region[as.numeric(CES21$cps21_province ) == 3] <- "Prairies"
CleanData$Region[as.numeric(CES21$cps21_province ) == 12] <- "Prairies"
CleanData$Region[as.numeric(CES21$cps21_province ) == 1] <- "Alberta"
CleanData$Region[as.numeric(CES21$cps21_province ) == 2] <- "Coast"
CleanData$Region[as.numeric(CES21$cps21_province ) == 13] <- "Prairies"
CleanData$Region[as.numeric(CES21$cps21_province ) == 6] <- "Prairies"
CleanData$Region[as.numeric(CES21$cps21_province ) == 8] <- "Prairies"
CleanData$Region <- factor(CleanData$Region)
table(CleanData$Region)

# Age
CleanData$age <- NA
CleanData$age[as.numeric(CES21$cps21_yob_2) <= 17] <- NA
CleanData$age[as.numeric(CES21$cps21_yob_2) > 17 & as.numeric(CES21$cps21_yob_2) <= 34] <- "18p34"
CleanData$age[as.numeric(CES21$cps21_yob_2) > 35 & as.numeric(CES21$cps21_yob_2) <= 54] <- "35p54"
CleanData$age[as.numeric(CES21$cps21_yob_2) >= 55] <- "55p"
CleanData$age <- factor(CleanData$age)
table(CleanData$age)
# Genre
CleanData$female <- NA
CleanData$female[as.numeric(CES21$cps21_genderid) == 1] <- 0 # man
CleanData$female[as.numeric(CES21$cps21_genderid) == 3] <- 0.5 # non-binary
CleanData$female[as.numeric(CES21$cps21_genderid) == 2] <- 1 # woman
CleanData$female[as.numeric(CES21$cps21_genderid) == 4] <- NA
table(CleanData$female)

# Education  ########
# coded dummy :0 =  Below high school, 0.5 = high school, 1 = college/university
CleanData$educ <- NA
CleanData$educ[!is.na(as.numeric(CES21$cps21_education))] <- NA
CleanData$educ[as.numeric(CES21$cps21_education ) == 12] <- NA
CleanData$educ[as.numeric(CES21$cps21_education ) == 1 | as.numeric(CES21$cps21_education ) == 2 |
                 as.numeric(CES21$cps21_education ) == 3 | as.numeric(CES21$cps21_education ) == 4] <- 0
CleanData$educ[as.numeric(CES21$cps21_education ) == 5 |
                 as.numeric(CES21$cps21_education ) == 6 |
                 as.numeric(CES21$cps21_education ) == 7 |
                 as.numeric(CES21$cps21_education ) == 8 ] <- 0.5
CleanData$educ[as.numeric(CES21$cps21_education) == 9 |
                 as.numeric(CES21$cps21_education) == 10 |
                 as.numeric(CES21$cps21_education) == 11] <- 1
table(CleanData$educ)

# Langue
CleanData$lang <- NA
CleanData$lang[as.numeric(CES21$pes21_lang) == 1] <- "English"
CleanData$lang[as.numeric(CES21$pes21_lang) == 2] <- "French"
CleanData$lang[as.numeric(CES21$pes21_lang) == 18] <- NA
CleanData$lang[as.numeric(CES21$pes21_lang) > 2  | as.numeric(CES21$pes21_lang) == 17] <- "Autre"
CleanData$lang <- factor(CleanData$lang)
table(CleanData$lang)

# income
CleanData$income <- NA
CleanData$income[as.numeric(CES21$cps21_income_number) <= 30000] <- 0
CleanData$income[as.numeric(CES21$cps21_income_number) > 30000 &
                   as.numeric(CES21$cps21_income_number) <= 60000] <- 0.25
CleanData$income[as.numeric(CES21$cps21_income_number) > 60000 &
                   as.numeric(CES21$cps21_income_number) <= 90000] <- 0.5
CleanData$income[as.numeric(CES21$cps21_income_number) > 90000 &
                   as.numeric(CES21$cps21_income_number) <= 110000] <- 0.75
CleanData$income[as.numeric(CES21$cps21_income_number) > 110000] <- 1
CleanData$income[as.numeric(CES21$cps21_income_number) == 9] <- NA
table(CleanData$income)

# Voted liberal or not
CleanData$LibVote <- NA
CleanData$LibVote[as.numeric(CES21$pes21_votechoice2021) == 9] <- NA
CleanData$LibVote[as.numeric(CES21$pes21_votechoice2021) == 1] <- 1
CleanData$LibVote[as.numeric(CES21$pes21_votechoice2021) != 1] <- 0
table(CleanData$LibVote)

## Most Preferred Issue
CleanData$Category <- NA
CleanData$Category[CPSIMPISS$`Economy & Labour` != 0] <- "Économie et employabilité"
CleanData$Category[CPSIMPISS$`Health & Social Services` != 0] <- "Santé et services sociaux"
CleanData$Category[CPSIMPISS$`Environment & Energy`!= 0] <- "Environnement"
CleanData$Category[CPSIMPISS$`Governments & Governance` != 0] <- "Gouvernement et démocratie"
CleanData$Category[CPSIMPISS$`Minorities` != 0] <- "Minorités"
CleanData$Category[CPSIMPISS$Education != 0] <- "Éducation et recherche"
CleanData$Category[CPSIMPISS$Immigration != 0] <- "Minorités"
CleanData$Category[CPSIMPISS$`Law & Crime` != 0] <- "Loi et ordre"
CleanData$Category[CPSIMPISS$`Familles` != 0] <- "Familles"
CleanData$Category[CPSIMPISS$`Identité et Nationalisme` != 0] <- "Identité et nationalisme"
CleanData$Category <- factor(CleanData$Category)



## Confiance_Politique
CleanData$DemSat <- NA
CleanData$DemSat[CES21$cps21_demsat == 1] <- 1
CleanData$DemSat[CES21$cps21_demsat == 2] <- 0.66
CleanData$DemSat[CES21$cps21_demsat == 3] <- 0.33
CleanData$DemSat[CES21$cps21_demsat == 4] <- 0
CleanData$DemSat[CES21$cps21_demsat == 5] <- NA
table(CleanData$DemSat)

CleanData$FedGovSat <- NA
CleanData$FedGovSat[CES21$cps21_fed_gov_sat == 1] <- 1
CleanData$FedGovSat[CES21$cps21_fed_gov_sat == 2] <- 0.66
CleanData$FedGovSat[CES21$cps21_fed_gov_sat == 3] <- 0.33
CleanData$FedGovSat[CES21$cps21_fed_gov_sat == 4] <- 0
CleanData$FedGovSat[CES21$cps21_fed_gov_sat == 5] <- NA
table(CleanData$FedGovSat)

CleanData$LibPro <- NA
CleanData$LibPro[CES21$cps21_lib_promises == 1] <- 0
CleanData$LibPro[CES21$cps21_lib_promises == 3] <- 0.33
CleanData$LibPro[CES21$cps21_lib_promises == 2] <- 0.66
CleanData$LibPro[CES21$cps21_lib_promises == 4] <- 1
CleanData$LibPro[CES21$cps21_lib_promises == 5] <- NA
table(CleanData$LibPro)

CleanData$DemSat2 <- NA
CleanData$DemSat2[CES21$pes21_dem_sat == 1] <- 1
CleanData$DemSat2[CES21$pes21_dem_sat == 3] <- 0.66
CleanData$DemSat2[CES21$pes21_dem_sat == 2] <- 0.33
CleanData$DemSat2[CES21$pes21_dem_sat == 4] <- 0
CleanData$DemSat2[CES21$pes21_dem_sat == 5] <- NA
table(CleanData$DemSat2)

CleanData$PolPro <- NA
CleanData$PolPro[CES21$pes21_keepromises == 1] <- 1
CleanData$PolPro[CES21$pes21_keepromises == 2] <- 0.75
CleanData$PolPro[CES21$pes21_keepromises == 5] <- 0.5
CleanData$PolPro[CES21$pes21_keepromises == 3] <- 0.25
CleanData$PolPro[CES21$pes21_keepromises == 4] <- 0
CleanData$PolPro[CES21$pes21_keepromises == 6] <- NA
table(CleanData$PolPro)

CleanData$GovCare <- NULL
CleanData$GovCare[CES21$pes21_govtcare == 1] <- 1
CleanData$GovCare[CES21$pes21_govtcare == 2] <- 0.75
CleanData$GovCare[CES21$pes21_govtcare == 3] <- 0.5
CleanData$GovCare[CES21$pes21_govtcare == 4] <- 0.25
CleanData$GovCare[CES21$pes21_govtcare == 5] <- 0
CleanData$GovCare[CES21$pes21_govtcare == 6] <- NA
table(CleanData$GovCare)

CleanData$FedGovConf <- NA
CleanData$FedGovConf[CES21$pes21_conf_inst1_1 == 1] <- 1
CleanData$FedGovConf[CES21$pes21_conf_inst1_1 == 2] <- 0.66
CleanData$FedGovConf[CES21$pes21_conf_inst1_1 == 3] <- 0.33
CleanData$FedGovConf[CES21$pes21_conf_inst1_1 == 4] <- 0
CleanData$FedGovConf[CES21$pes21_conf_inst1_1 == 5] <- NA
table(CleanData$FedGovConf)

CleanData$Populism3 <- NULL
CleanData$Populism3[CES21$pes21_populism_3 == 1] <- 1
CleanData$Populism3[CES21$pes21_populism_3 == 2] <- 0.75
CleanData$Populism3[CES21$pes21_populism_3 == 3] <- 0.5
CleanData$Populism3[CES21$pes21_populism_3 == 4] <- 0.25
CleanData$Populism3[CES21$pes21_populism_3 == 5] <- 0
CleanData$Populism3[CES21$pes21_populism_3 == 6] <- NA
table(CleanData$Populism3)

CleanData$Populism4 <- NA
CleanData$Populism4[CES21$pes21_populism_4 == 1] <- 0
CleanData$Populism4[CES21$pes21_populism_4 == 2] <- 0.25
CleanData$Populism4[CES21$pes21_populism_4 == 3] <- 0.5
CleanData$Populism4[CES21$pes21_populism_4 == 4] <- 0.75
CleanData$Populism4[CES21$pes21_populism_4 == 5] <- 1
CleanData$Populism4[CES21$pes21_populism_4 == 6] <- NA
table(CleanData$Populism4)

CleanData$Populism8 <- NA
CleanData$Populism8[CES21$pes21_populism_8 == 1] <- 1
CleanData$Populism8[CES21$pes21_populism_8 == 2] <- 0.75
CleanData$Populism8[CES21$pes21_populism_8 == 3] <- 0.5
CleanData$Populism8[CES21$pes21_populism_8 == 4] <- 0.25
CleanData$Populism8[CES21$pes21_populism_8 == 5] <- 0
CleanData$Populism8[CES21$pes21_populism_8 == 6] <- NA
table(CleanData$Populism8)


## Sophistication Politique

CleanData$InterestPol <- CES21$cps21_interest_gen_1/10
CleanData$InterestPol[CES21$cps21_interest_gen_1 == -99] <- NA
table(CleanData$InterestPol)

CleanData$InterestElec <- CES21$cps21_interest_elxn_1/10
CleanData$InterestElec[CES21$cps21_interest_elxn_1 == -99] <- NA
table(CleanData$InterestElec)

CleanData$Confusing <- NA
CleanData$Confusing[CES21$cps21_govt_confusing == 1] <- 1
CleanData$Confusing[CES21$cps21_govt_confusing == 2] <- 0.66
CleanData$Confusing[CES21$cps21_govt_confusing == 3] <- 0.33
CleanData$Confusing[CES21$cps21_govt_confusing == 4] <- 0
CleanData$Confusing[CES21$cps21_govt_confusing == 5] <- NA
table(CleanData$Confusing)

CleanData$NoSay <- NA
CleanData$NoSay[CES21$cps21_govt_say == 1] <- 1
CleanData$NoSay[CES21$cps21_govt_say == 2] <- 0.66
CleanData$NoSay[CES21$cps21_govt_say == 3] <- 0.33
CleanData$NoSay[CES21$cps21_govt_say == 4] <- 0
CleanData$NoSay[CES21$cps21_govt_say == 5] <- NA
table(CleanData$NoSay)

CleanData$NewsTime <- NA
CleanData$NewsTime[CES21$cps21_news_cons == 1] <- 0
CleanData$NewsTime[CES21$cps21_news_cons == 2] <- 0.20
CleanData$NewsTime[CES21$cps21_news_cons == 3] <- 0.40
CleanData$NewsTime[CES21$cps21_news_cons == 4] <- 0.60
CleanData$NewsTime[CES21$cps21_news_cons == 5] <- 0.80
CleanData$NewsTime[CES21$cps21_news_cons == 6] <- 1
CleanData$NewsTime[CES21$cps21_news_cons == 7] <- NA
table(CleanData$NewsTime)

CleanData$Knowledge1 <- NA
CleanData$Knowledge1[CES21$cps21_premier_name == 3 & as.numeric(CES21$cps21_province ) == 11] <- 1
CleanData$Knowledge1[CES21$cps21_premier_name != 3 & as.numeric(CES21$cps21_province ) == 11] <- 0
CleanData$Knowledge1[CES21$cps21_premier_name == 1 & as.numeric(CES21$cps21_province ) == 3] <- 1
CleanData$Knowledge1[CES21$cps21_premier_name != 1 & as.numeric(CES21$cps21_province ) == 3] <- 0
CleanData$Knowledge1[CES21$cps21_premier_name == 6 & as.numeric(CES21$cps21_province ) == 7] <- 1
CleanData$Knowledge1[CES21$cps21_premier_name != 6 & as.numeric(CES21$cps21_province ) == 7] <- 0
CleanData$Knowledge1[CES21$cps21_premier_name == 7 & as.numeric(CES21$cps21_province ) == 4] <- 1
CleanData$Knowledge1[CES21$cps21_premier_name != 7 & as.numeric(CES21$cps21_province ) == 4] <- 0
CleanData$Knowledge1[CES21$cps21_premier_name == 9 & as.numeric(CES21$cps21_province ) == 2] <- 1
CleanData$Knowledge1[CES21$cps21_premier_name != 9 & as.numeric(CES21$cps21_province ) == 2] <- 0
CleanData$Knowledge1[CES21$cps21_premier_name == 11 & as.numeric(CES21$cps21_province ) == 10] <- 1
CleanData$Knowledge1[CES21$cps21_premier_name != 11 & as.numeric(CES21$cps21_province ) == 10] <- 0
CleanData$Knowledge1[CES21$cps21_premier_name == 13 & as.numeric(CES21$cps21_province ) == 12] <- 1
CleanData$Knowledge1[CES21$cps21_premier_name != 13 & as.numeric(CES21$cps21_province ) == 12] <- 0
CleanData$Knowledge1[CES21$cps21_premier_name == 15 & as.numeric(CES21$cps21_province ) == 1] <- 1
CleanData$Knowledge1[CES21$cps21_premier_name != 15 & as.numeric(CES21$cps21_province ) == 1] <- 0
CleanData$Knowledge1[CES21$cps21_premier_name == 17 & as.numeric(CES21$cps21_province ) == 5] <- 1
CleanData$Knowledge1[CES21$cps21_premier_name != 17 & as.numeric(CES21$cps21_province ) == 5] <- 0
CleanData$Knowledge1[CES21$cps21_premier_name == 25 & as.numeric(CES21$cps21_province ) == 9] <- 1
CleanData$Knowledge1[CES21$cps21_premier_name != 25 & as.numeric(CES21$cps21_province ) == 9] <- 0
table(CleanData$Knowledge1)

# What is the name of the federal Minister of Finance?
CleanData$Knowledge2 <- NA
CleanData$Knowledge2[CES21$cps21_finmin_name == 7] <- NA
CleanData$Knowledge2[CES21$cps21_finmin_name == 1] <- 1
CleanData$Knowledge2[CES21$cps21_finmin_name == 2] <- 0
CleanData$Knowledge2[CES21$cps21_finmin_name == 3] <- 0
CleanData$Knowledge2[CES21$cps21_finmin_name == 4] <- 0
CleanData$Knowledge2[CES21$cps21_finmin_name == 5] <- 0
CleanData$Knowledge2[CES21$cps21_finmin_name == 6] <- 0
table(CleanData$Knowledge2)
# What is the name of the Governor-General of Canada?
CleanData$Knowledge3 <- NA
CleanData$Knowledge3[CES21$cps21_govgen_name == 6] <- NA
CleanData$Knowledge3[CES21$cps21_govgen_name == 1] <- 0
CleanData$Knowledge3[CES21$cps21_govgen_name == 2] <- 0
CleanData$Knowledge3[CES21$cps21_govgen_name == 3] <- 1
CleanData$Knowledge3[CES21$cps21_govgen_name == 4] <- 0
CleanData$Knowledge3[CES21$cps21_govgen_name == 5] <- 0
table(CleanData$Knowledge3)


CleanData$Debatefr <- NA
CleanData$Debatefr[CES21$cps21_debate_fr == 1] <- 1
CleanData$Debatefr[CES21$cps21_debate_fr == 2] <- 0
CleanData$Debatefr[CES21$cps21_debate_fr == 3] <- NA
CleanData$Debatefr2 <- NA
CleanData$Debatefr2[CES21$cps21_debate_fr2 == 1] <- 1
CleanData$Debatefr2[CES21$cps21_debate_fr2 == 2] <- 0
CleanData$Debatefr2[CES21$cps21_debate_fr2 == 3] <- NA
CleanData$Debateen <- NA
CleanData$Debateen[CES21$cps21_debate_en == 1] <- 1
CleanData$Debateen[CES21$cps21_debate_en == 2] <- 0
CleanData$Debateen[CES21$cps21_debate_en == 3] <- NA
table(CleanData$Debatefr)
table(CleanData$Debatefr2)
table(CleanData$Debateen)

CleanData$CampaignAtt <- NA
CleanData$CampaignAtt[CES21$pes21_campatt == 1] <- 1
CleanData$CampaignAtt[CES21$pes21_campatt == 2] <- 0.5
CleanData$CampaignAtt[CES21$pes21_campatt == 3] <- 0
CleanData$CampaignAtt[CES21$pes21_campatt == 4] <- NA
table(CleanData$CampaignAtt)

CleanData$Discussion <- NA
CleanData$Discussion[CES21$pes21_discfam == 1] <- 0
CleanData$Discussion[CES21$pes21_discfam == 2] <- 0.33
CleanData$Discussion[CES21$pes21_discfam == 3] <- 0.66
CleanData$Discussion[CES21$pes21_discfam == 4] <- 1
CleanData$Discussion[CES21$pes21_discfam == 5] <- NA
table(CleanData$Discussion)


CleanData$length <- NULL

### Analyse Factorielle Confiance Politique : Tous en haut du seuil de 3
TrustScale <- na.omit(CleanData[, c("DemSat", "FedGovSat", "LibPro", "DemSat2", "PolPro", "GovCare",
                                    "FedGovConf", "Populism3", "Populism4",
                                    "Populism8")])
TrustCronbach <- round(as.numeric(psy::cronbach(TrustScale)[3]), digits = 2)
TrustFactorAnalysis <- factanal(TrustScale, factors = 1)
TrustVariableNames <- c(
  "Satisfaction with democracy CPS", "Satisfaction with Trudeau government", "Trudeau kept his promises", "Satisfaction with democracy PES", "Parties keep their promises", "Government cares what I think",
  "Confidence in federal government", "Politicians care about the people", "Politicians are trustworthy","Politicians do not care only about the rich")
TrustFactorLoadings <- TrustFactorAnalysis$loadings[, 1]
TrustFirstEigenvalue <- round(eigen(cor(TrustScale))$values[1], digits = 2)

ggplot(data.frame(TrustVariableNames, TrustFactorLoadings),
       aes(x = reorder(TrustVariableNames, TrustFactorLoadings), y = TrustFactorLoadings)) +
  coord_flip() +
  geom_bar(stat = "identity", colour = "black", fill = "black", linewidth = 0.9,
           width = 0.4) +
  geom_text(aes(label = as.character(round(TrustFactorLoadings, digits = 2))),
            vjust = 0.35, hjust = -0.3, family = "CM Roman") +
  geom_hline(yintercept = 0.3, colour = "gray", linetype = "longdash") +
  annotate("text", label = paste("Cronbach's alpha =", as.character(
    TrustCronbach)), x = 1.2, y = 0.95, size = 3, family = "CM Roman") +
  annotate("text", label = paste("First eigenvalue =", as.character(
    TrustFirstEigenvalue)), x = 0.8, y = 0.95, size = 3,
    family = "CM Roman") +
  scale_y_continuous(name = "Factor loadings", limits = c(-0.1, 1),
                     breaks = seq(-0.1, 1, by = 0.1)) +
  xlab("") +
  theme_linedraw() +
  theme(axis.text.y = element_text(size = 14),
        axis.title.x = element_text(hjust = 0.3, vjust = -0.17, size = 14),
        panel.grid = element_blank(),
        text = element_text(family = "CM Roman"))
ggsave("_graphs/TrustScale.png", width = 11, height = 4.25)

## Analyse factorielle Sophistication Politique 1 => en bas du seuil de 3 : A,E,G (educ, NoSay, Knowledge1)
SophieScale <- na.omit(CleanData[, c("educ","InterestPol" ,"InterestElec" ,"Confusing" ,"NoSay", "NewsTime", "Knowledge1", "Knowledge2", "Knowledge3", "Debatefr",
                                     "Debatefr2", "Debateen", "CampaignAtt",
                                     "Discussion")])
SophieCronbach <- round(as.numeric(psy::cronbach(SophieScale)[3]), digits = 2)
SophieFactorAnalysis <- factanal(SophieScale, factors = 1)
SophieVariableNames <- c(
  "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N")
SophieFactorLoadings <- SophieFactorAnalysis$loadings[, 1]
SophieFirstEigenvalue <- round(eigen(cor(SophieScale))$values[1], digits = 2)

ggplot(data.frame(SophieVariableNames, SophieFactorLoadings),
       aes(x = reorder(SophieVariableNames, SophieFactorLoadings), y = SophieFactorLoadings)) +
  coord_flip() +
  geom_bar(stat = "identity", colour = "black", fill = "black", linewidth = 0.9,
           width = 0.4) +
  geom_text(aes(label = as.character(round(SophieFactorLoadings, digits = 2))),
            vjust = 0.35, hjust = -0.3, family = "CM Roman") +
  geom_hline(yintercept = 0.3, colour = "gray", linetype = "longdash") +
  annotate("text", label = paste("Cronbach's alpha =", as.character(
    SophieCronbach)), x = 1.2, y = 0.95, size = 3, family = "CM Roman") +
  annotate("text", label = paste("First eigenvalue =", as.character(
    SophieFirstEigenvalue)), x = 0.8, y = 0.95, size = 3,
    family = "CM Roman") +
  scale_y_continuous(name = "Factor loadings", limits = c(-0.1, 1),
                     breaks = seq(-0.1, 1, by = 0.1)) +
  xlab("") +
  theme_linedraw() +
  theme(axis.text.y = element_text(size = 14),
        axis.title.x = element_text(hjust = 0.3, vjust = -0.17, size = 14),
        panel.grid = element_blank(),
        text = element_text(family = "CM Roman"))
ggsave("_graphs/SophieScale.png", width = 11, height = 4.25)

## Analyse factorielle Sophistication Politique 2 => en bas du seuil de 3 : Rien,Au moins 3,9.

SophieScale <- na.omit(CleanData[, c("InterestPol", "InterestElec", "Confusing", "NewsTime", "Knowledge2", "Knowledge3", "Debatefr",
                                     "Debatefr2", "Debateen", "CampaignAtt",
                                     "Discussion")])
SophieCronbach <- round(as.numeric(psy::cronbach(SophieScale)[3]), digits = 2)
SophieFactorAnalysis <- factanal(SophieScale, factors = 1)
SophieVariableNames <- c(
  "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
SophieFactorLoadings <- SophieFactorAnalysis$loadings[, 1]
SophieFirstEigenvalue <- round(eigen(cor(SophieScale))$values[1], digits = 2)

ggplot(data.frame(SophieVariableNames, SophieFactorLoadings),
       aes(x = reorder(SophieVariableNames, SophieFactorLoadings), y = SophieFactorLoadings)) +
  coord_flip() +
  geom_bar(stat = "identity", colour = "black", fill = "black", linewidth = 0.9,
           width = 0.4) +
  geom_text(aes(label = as.character(round(SophieFactorLoadings, digits = 2))),
            vjust = 0.35, hjust = -0.3, family = "CM Roman") +
  geom_hline(yintercept = 0.3, colour = "gray", linetype = "longdash") +
  annotate("text", label = paste("Cronbach's alpha =", as.character(
    SophieCronbach)), x = 1.2, y = 0.95, size = 3, family = "CM Roman") +
  annotate("text", label = paste("First eigenvalue =", as.character(
    SophieFirstEigenvalue)), x = 0.8, y = 0.95, size = 3,
    family = "CM Roman") +
  scale_y_continuous(name = "Factor loadings", limits = c(-0.1, 1),
                     breaks = seq(-0.1, 1, by = 0.1)) +
  xlab("") +
  theme_linedraw() +
  theme(axis.text.y = element_text(size = 14),
        axis.title.x = element_text(hjust = 0.3, vjust = -0.17, size = 14),
        panel.grid = element_blank(),
        text = element_text(family = "CM Roman"))
ggsave("_graphs/SophieScale.png", width = 11, height = 4.25)


### CROISEMENT DES DONNÉES à retravailler

calculate_confiance <- function(row) {
  if (sum(is.na(row)) <= 7) {
    # Perform element-wise multiplication for each variable and its loading
    variable_contributions <- row * TrustFactorLoadings
    return(sum(variable_contributions, na.rm = TRUE) / sum(TrustFactorLoadings, na.rm = TRUE))
  } else {
    return(NA)
  }
}

# Apply the function to each row and create a new column confiance_politique
variables <- c("DemSat", "FedGovSat", "LibPro", "DemSat2", "PolPro", "GovCare", "FedGovConf", "Populism3", "Populism4", "Populism8")
CleanData$Trust <- apply(CleanData[variables], 1, calculate_confiance)

# Calculate the percentage of non-NA values in confiance_politique
percentage_non_na <- length(na.omit(CleanData$confiance_politique)) / nrow(CleanData) * 100
print(percentage_non_na)

summary(CleanData$Trust)

calculate_sophistication <- function(row) {
  if (sum(is.na(row)) <= 7) {
    # Perform element-wise multiplication for each variable and its loading
    variable_contributions <- row * SophieFactorLoadings
    return(sum(variable_contributions, na.rm = TRUE) / sum(SophieFactorLoadings, na.rm = TRUE))
  } else {
    return(NA)
  }
}

# Apply the function to each row and create a new column confiance_politique
variables <- c("InterestPol", "InterestElec", "Confusing", "NewsTime", "Knowledge2", "Knowledge3", "Debatefr",
               "Debatefr2", "Debateen", "CampaignAtt",
               "Discussion")
CleanData$Sophistication <- apply(CleanData[variables], 1, calculate_sophistication)

# Calculate the percentage of non-NA values in confiance_politique
percentage_non_na <- length(na.omit(CleanData$Sophistication)) / nrow(CleanData) * 100
print(percentage_non_na)

summary(CleanData$Sophistication)

CleanData <- CleanData[, !(names(CleanData) %in% c("InterestPol", "InterestElec", "Confusing", "NewsTime", "Knowledge2", "Knowledge3", "Debatefr",
                                                   "Debatefr2", "Debateen", "CampaignAtt", "NoSay", "Knowledge1",
                                                   "Discussion","DemSat", "FedGovSat", "LibPro", "DemSat2", "PolPro", "GovCare",
                                                   "FedGovConf", "Populism3", "Populism4",
                                                   "Populism8"))]


CANADAagrégéGA <- read.csv("_SharedFolder_CPET/CleanData/CanadaAgrégéGA.csv", header = TRUE)

CleanData <- merge(CANADAagrégéGA, CleanData, by.x = "Catégorie", by.y = "Category", all.x = TRUE)
table(CleanData$Catégorie)

CleanData$Catégorie <- factor(CleanData$Catégorie)

CleanDataNoNA <- na.omit(CleanData)
table(CleanDataNoNA$Catégorie)

CleanDataHighSophie <- subset(CleanData, Sophistication > 0.8)
## Régressions

modeltotal <- lm(Trust ~
              Sophistication +
              `VK`+ `VB` + `MK` + `MB` + `UVK` + `UVB`  +
              `UMK` +  `UMB`  + `DK` + `DB`   + `DMK`   +  +`DMB`   +
              `EK`  +  `EB`   + `EMK` + `EMB` + Region + age + female + educ + lang + income + LibVote, data = CleanData)
modelcatégo <- lm(Trust ~ Catégorie, data = CleanData)
modelSES<- lm(Trust ~ Region + age + female + educ + lang + income, data = CleanData)
modelSophistication <- lm(Trust ~ Sophistication, data = CleanData)
modelLibvote <- lm(Trust ~ LibVote, data = CleanData)
modelGAView <- lm(Trust ~ `VK` + `VB` + `MK` + `MB`, data = CleanData)
modelGAUserView <- lm(Trust ~ `UVK` + `UVB`  + `UMK` +  `UMB`, data = CleanData)
modelGADuration <- lm(Trust ~ `DK` + `DB` + `DMK` +`DMB`, data = CleanData)
modelGAEvent <- lm(Trust ~ `EK`  +  `EB`+ `EMK` + `EMB`, data = CleanData)
modelSophieViewControls <- lm(Trust ~
                                Sophistication +
                                `VK`+ `VB` + `MK` + `MB` + Region + age + female + educ + lang + income + LibVote, data = CleanData)
modelSophieDurationControls <- lm(Trust ~
                                Sophistication +
                                `DK`+ `DB` + `DMK` + `DMB` + Region + age + female + educ + lang + income + LibVote, data = CleanData)
modelSophieEventControls <- lm(Trust ~
                                 Sophistication +
                                 `EK`+ `EB` + `EMK` + `EMB` + Region + age + female + educ + lang + income + LibVote, data = CleanData)
modelSophieUViewControls <- lm(Trust ~
                                 Sophistication +
                                 `UVK`+ `UVB` + `UMK` + `UMB` + Region + age + female + educ + lang + income + LibVote, data = CleanData)
summary(modelSES)
summary(modelcatégo)
summary(modelSophistication)
summary(modelLibvote)
summary(modelGAView)
summary(modelGAUserView)
summary(modelGADuration)
summary(modelGAEvent)
summary(modelSophieViewControls)
summary(modelSophieUViewControls)
summary(modelSophieDurationControls)
summary(modelSophieEventControls)

alias(modelSophieViewControls)
car::vif(modelSophieViewControls)
### MODELSUMMARY D'ALEX
modelsummary::modelsummary(models = list("Category" = modelcatégo,
                 "Sophistication" = modelSophistication,
                 "Liberal vote" = modelLibvote, "SES" = modelSES,
                 "Views by user" = modelGAUserView, "Total views" = modelGAView,
                 "Duration" = modelGADuration, "Events" = modelGAEvent
                 ),
  title = paste("Linear models to predict political trust"),
  coef_rename = c("CatégorieÉducation et recherche" = "Education & Research",
                  "CatégorieEnvironnement" = "Environment",
                  "CatégorieFamilles" = "Families",
                  "CatégorieGouvernement et démocratie" = "Governments & Democracy",
                  "CatégorieIdentité et nationalisme" = "Identity & Nationalism",
                  "CatégorieLoi et ordre" = "Law & Order",
                  "CatégorieMinorités" = "Minorities",
                  "CatégorieSanté et services sociaux" = "Health and Social Services",
                  "Sophistication" = "Sophistication Level",
                  "LibVote" = "Voted Liberal",
                  "RegionCoast" = "British Columbia",
                  "RegionAlberta" = "Alberta",
                  "RegionAtlantic" = "Atlantic Canada",
                  "RegionOntario" = "Ontario",
                  "RegionQuebec" = "Quebec",
                  "RegionPrairies" = "Prairies",
                  "age34m" = "Less than 34 years old ",
                  "age35p54" = "35 to 54 years old",
                  "female" = "Gender",
                  "educ" = "Education Level",
                  "langEnglish" = "Speaks English",
                  "langFrench" = "Speaks French",
                  "income" = "Income Level",
                  "VK" = "Kept views",
                  "VB" = "Broken views",
                  "MK" = "Kept mean",
                  "MB" = "Broken mean",
                  "UVK" = "Kept view by user",
                  "UVB" = "Broken view by user",
                  "UMK" = "Kept mean by user",
                  "UMB" = "Broken mean by user",
                  "DK" = "Kept duration",
                  "DB" = "Broken duration",
                  "DMK" = "Kept mean duration",
                  "DMB" = "Broken mean duration",
                  "EK" = "Kept events",
                  "EB" = "Broken events",
                  "EMK" = "Kept mean events",
                  "EMB" = "Broken mean events"
                    ), output = "markdown"
  )

modelsummary::modelsummary(models = list("All" = modeltotal,
                                         "Total views" = modelSophieViewControls,
                                         "Views by user" = modelSophieUViewControls,
                                         "Duration" = modelSophieDurationControls,
                                         "Events" = modelSophieEventControls
),
title = paste("Linear models to predict political trust"),
coef_rename = c("Sophistication" = "Sophistication Level",
                "LibVote" = "Voted Liberal",
                "RegionCoast" = "Coast",
                "RegionNorth" = "North",
                "RegionOntario" = "Ontario",
                "RegionQuebec" = "Quebec",
                "RegionPrairies" = "Prairies",
                "age34m" = "Less than 34 years old ",
                "age35p54" = "35 to 54 years old",
                "female" = "Gender",
                "educ" = "Education Level",
                "langEnglish" = "Speaks English",
                "langFrench" = "Speaks French",
                "income" = "Income Level",
                "VK" = "Kept views",
                "VB" = "Broken views",
                "MK" = "Kept mean",
                "MB" = "Broken mean",
                "UVK" = "Kept views by user",
                "UVB" = "Broken views by user",
                "UMK" = "Kept mean by user",
                "UMB" = "Broken mean by user",
                "DK" = "Kept duration",
                "DB" = "Broken duration",
                "DMK" = "Kept mean duration",
                "DMB" = "Broken mean duration",
                "EK" = "Kept events",
                "EB" = "Broken events",
                "EMK" = "Kept mean events",
                "EMB" = "Broken mean events"
), output = "markdown")


### Modèles pour high sophistications

modeltotal <- lm(Trust ~
                   `VK`+ `VB` + `MK` + `MB` + `UVK` + `UVB`  +
                   `UMK` +  `UMB`  + `DK` + `DB`   + `DMK`   +  +`DMB`   +
                   `EK`  +  `EB`   + `EMK` + `EMB` + Region + age + female + educ + lang + income + LibVote, data = CleanDataHighSophie)
modelcatégo <- lm(Trust ~ Catégorie, data = CleanDataHighSophie)
modelSES<- lm(Trust ~ Region + age + female + educ + lang + income, data = CleanDataHighSophie)
modelSophistication <- lm(Trust ~ Sophistication, data = CleanDataHighSophie)
modelLibvote <- lm(Trust ~ LibVote, data = CleanDataHighSophie)
modelGAView <- lm(Trust ~ `VK` + `VB` + `MK` + `MB`, data = CleanDataHighSophie)
modelGAUserView <- lm(Trust ~ `UVK` + `UVB`  + `UMK` +  `UMB`, data = CleanDataHighSophie)
modelGADuration <- lm(Trust ~ `DK` + `DB` + `DMK` +`DMB`, data = CleanDataHighSophie)
modelGAEvent <- lm(Trust ~ `EK`  +  `EB`+ `EMK` + `EMB`, data = CleanDataHighSophie)
modelSophieViewControls <- lm(Trust ~
                                `VK`+ `VB` + `MK` + `MB` + Region + age + female + educ + lang + income + LibVote, data = CleanDataHighSophie)
modelSophieDurationControls <- lm(Trust ~
                                    `DK`+ `DB` + `DMK` + `DMB` + Region + age + female + educ + lang + income + LibVote, data = CleanDataHighSophie)
modelSophieEventControls <- lm(Trust ~
                                 `EK`+ `EB` + `EMK` + `EMB` + Region + age + female + educ + lang + income + LibVote, data = CleanDataHighSophie)
modelSophieUViewControls <- lm(Trust ~
                                 `UVK`+ `UVB` + `UMK` + `UMB` + Region + age + female + educ + lang + income + LibVote, data = CleanDataHighSophie)

modelsummary::modelsummary(models = list("Category" = modelcatégo,
                                         "Sophistication" = modelSophistication,
                                         "Liberal vote" = modelLibvote, "SES" = modelSES,
                                         "Views by user" = modelGAUserView, "Total views" = modelGAView,
                                         "Duration" = modelGADuration, "Events" = modelGAEvent
),
title = paste("Linear models to predict political trust"),
coef_rename = c("CatégorieÉducation et recherche" = "Education & Research",
                "CatégorieEnvironnement" = "Environment",
                "CatégorieFamilles" = "Families",
                "CatégorieGouvernement et démocratie" = "Governments & Democracy",
                "CatégorieIdentité et nationalisme" = "Identity & Nationalism",
                "CatégorieLoi et ordre" = "Law & Order",
                "CatégorieMinorités" = "Minorities",
                "CatégorieSanté et services sociaux" = "Health and Social Services",
                "Sophistication" = "Sophistication Level",
                "LibVote" = "Voted Liberal",
                "RegionCoast" = "British Columbia",
                "RegionAlberta" = "Alberta",
                "RegionAtlantic" = "Atlantic Canada",
                "RegionOntario" = "Ontario",
                "RegionQuebec" = "Quebec",
                "RegionPrairies" = "Prairies",
                "age34m" = "Less than 34 years old ",
                "age35p54" = "35 to 54 years old",
                "female" = "Gender",
                "educ" = "Education Level",
                "langEnglish" = "Speaks English",
                "langFrench" = "Speaks French",
                "income" = "Income Level",
                "VK" = "Kept views",
                "VB" = "Broken views",
                "MK" = "Kept mean",
                "MB" = "Broken mean",
                "UVK" = "Kept view by user",
                "UVB" = "Broken view by user",
                "UMK" = "Kept mean by user",
                "UMB" = "Broken mean by user",
                "DK" = "Kept duration",
                "DB" = "Broken duration",
                "DMK" = "Kept mean duration",
                "DMB" = "Broken mean duration",
                "EK" = "Kept events",
                "EB" = "Broken events",
                "EMK" = "Kept mean events",
                "EMB" = "Broken mean events"
), output = "markdown"
)


modelsummary::modelsummary(models = list("All" = modeltotal,
                                         "Total views" = modelSophieViewControls,
                                         "Views by user" = modelSophieUViewControls,
                                         "Duration" = modelSophieDurationControls,
                                         "Events" = modelSophieEventControls
),
title = paste("Linear models to predict political trust"),
coef_rename = c("Sophistication" = "Sophistication Level",
                "LibVote" = "Voted Liberal",
                "RegionCoast" = "British Columbia",
                "RegionAlberta" = "Alberta",
                "RegionAtlantic" = "Atlantic Canada",
                "RegionOntario" = "Ontario",
                "RegionQuebec" = "Quebec",
                "RegionPrairies" = "Prairies",
                "age34m" = "Less than 34 years old ",
                "age35p54" = "35 to 54 years old",
                "age55p" = "55 years and over",
                "female" = "Gender",
                "educ" = "Education Level",
                "langEnglish" = "Speaks English",
                "langFrench" = "Speaks French",
                "income" = "Income Level",
                "VK" = "Kept views",
                "VB" = "Broken views",
                "MK" = "Kept mean",
                "MB" = "Broken mean",
                "UVK" = "Kept views by user",
                "UVB" = "Broken views by user",
                "UMK" = "Kept mean by user",
                "UMB" = "Broken mean by user",
                "DK" = "Kept duration",
                "DB" = "Broken duration",
                "DMK" = "Kept mean duration",
                "DMB" = "Broken mean duration",
                "EK" = "Kept events",
                "EB" = "Broken events",
                "EMK" = "Kept mean events",
                "EMB" = "Broken mean events"
), output = "markdown")

