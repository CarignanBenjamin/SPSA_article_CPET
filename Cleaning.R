#### Recoding file CES 2021 - SPSA CPET EFFECTS ####

### Library used
library(foreign)
library(tidyverse)
library(haven)
library(readstata13)
source("BindOpenQuestion.R")
source("CleanOpenQuestion.R")
source("FilterOpenQuestion.R")
source("ModeOpenQuestion.R")

### Loading CES dataset avec les colomnes souhaités

# Variable de groupe : "cps21_imp_iss"

## Variables de contrôle Sélectionnées

# CPS: "cps21_demsat", "cps21_fed_gov_sat", "cps21_lib_promises"
# PES: "pes21_dem_sat", "pes21_keepromises", "pes21_govtcare",
#      "pes21_conf_inst1_1", "pes21_populism_3", "pes21_populism_4",
#      "pes21_populism_8"

## Variables de contrôle potentielles

# CPS: "cps21_ownfinanc_fed", "cps21_covid_sat_1"
# PES: "pes21_notvotereason1", "pes21_campatt", "pes21_losetouch",
#      "pes21_foreign", "pes21_emb_satif", "pes21_populism_2",
#      "pes21_populism_7", "pes21_trust"

CES21RAW <- data.frame(
  read_dta("_SharedFolder_CPET//2021 Canadian Election Study v1.0.dta",
           col_select = c("cps21_imp_iss", "cps21_demsat", "cps21_fed_gov_sat",
                          "cps21_govt_confusing", "cps21_lib_promises",
                          "pes21_dem_sat", "pes21_keepromises",
                          "pes21_govtcare","pes21_conf_inst1_1",
                          "pes21_populism_3", "pes21_populism_4",
                          "pes21_populism_8")))

### Cleaning de cps21_imp_iss

## What is the most important issue to you personally in this federal election?

# *** Pour commencer à filter, il faut d'abord rouler la première ligne du code
# *** seule. Une fois que IMPISS est dans l'environnement, on peut rouler tout
# *** le bloc d'un coup.

CPSIMPISS <- FilterOpenQuestion2(CES21RAW, "cps21_imp_iss",  c("taxes", "taxation", "over taxation", "tax the rich", "economy", "economie", "work", "housing affordability",
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
CPSIMPISSa <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("Vaccine", "health", "santé", "healthcare", "health care", "covid19", "covid", "covid 19", "child care", "seniors",
                                                                "coronavirus", "childcare", "la sante", "pandemic", "pandemie", "la pandemie", "covid response", "covid recovery",
                                                                "the pandemic", "vaccine passports", "senior care", "mental health", "la covid", "pharmacare", "pandemic recovery",
                                                                "la gestion de la pandemie", "gestion de la pandemie", "pandemic response", "vaccine mandates", "long term care",
                                                                "seniors issues", "vaccines", "systeme de sante", "covid19 response", "corona", "covid management",
                                                                "le systeme de sante", "senior health care", "vaccine passport", "covid 19 recovery", "vaccination",
                                                                "covid pandemic", "covid19 recovery", "heath care", "le covid", "seniors care", "getting covid under control",
                                                                "les soins de sante", "soins de sante", "social issues", "senior issues", "public health", "passeport vaccinal",
                                                                "covid control", "covid vaccinations", "ending the pandemic", "health care for seniors", "health system",
                                                                "heathcare", "la covid19", "la vaccination", "medical", "pensions", "pension", "seniors benefits", "social services",
                                                                "vaccine mandate", "covid policies", "covid policy", "covid restrictions", "daycare", "dealing with covid",
                                                                "dealing with covid19", "gestion covid", "gestion de la crise sanitaire", "getting through the pandemic",
                                                                "lapres pandemie", "la gestion de la covid", "help for seniors", " les aines", "les personnes agees",
                                                                "mandatory vaccines", "recovery from covid", "recovery from the pandemic", "les aines", "senior benefits",
                                                                "transfert en sante", "transferts en sante", "care for seniors", "covid crisis", "covid passports", "famille",
                                                                "garderie", "covid 19 pandemic", "controlling covid", "handling of the pandemic", "health care funding",
                                                                "health issues", "la vaccination obligatoire", "les transferts en sante", "medical care", "managing the pandemic",
                                                                "managing covid", "post pandemic recovery", "post covid recovery", "seniors pensions", "universal health care"
                                                                ), "Health & Social Services")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSa)
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
CPSIMPISSe <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("Immigration", "limmigration", "stop immigration", "inmigrations"), "Immigration")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSe)
CPSIMPISSf <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("Crime", "gun control", "safety", "firearms", "armes à feu"), "Law & Crime")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSf)
CPSIMPISSg <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("Technology"), "Technology")
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
CPSIMPISSj <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("Culture", "le francais", "lindependance du quebec", "la langue francaise", "le quebec", "respect du quebec"
                                                               ), "Culture & Nationalism")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSj)
CPSIMPISSk <- FilterOpenQuestion2(CPSIMPISS, "cps21_imp_iss", c("womens rights", "womans rights", "racism", "racisme", "racisme systemique", "freedom", "equality",
                                                                "human rights", "indigenous rights", "indigenous issues", "reconciliation", "freedom of choice",
                                                                "indigenous reconciliation", "inequality", "liberte", "freedom of speech", "indigenous affairs",
                                                                "rights and freedoms", "social justice", "equity", "fair", "fairness", "personal freedom", "unity",
                                                                "abortion", "freedom of rights", "justice", "la liberte", "indigenous relations"
                                                                ), "Rights, Liberties, Minorities & Discrimination")
CPSIMPISS <- BindOpenQuestion(CPSIMPISS, CPSIMPISSk)
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

### Croisement des variables

## Croisement avec Government Satisfaction
CPSIMPISS <- cbind(CPSIMPISS, GovernmentSatisfaction = CES21RAW$cps21_fed_gov_sat)
GOVSAT <- CPSIMPISS %>%
  filter(!is.na(GovernmentSatisfaction) & GovernmentSatisfaction != 5) %>%
  mutate(
    GovernmentSatisfaction = factor(
      GovernmentSatisfaction,
      labels = c("Very", "Fairly", "Not very", "Not at all")
    )
  ) %>%
  group_by(GovernmentSatisfaction) %>%
  summarize(
    N_Economy = sum(`Economy & Labour` != 0),
    N_Health = sum(`Health & Social Services` != 0),
    N_Education = sum(`Education` != 0),
    N_Environnement = sum(`Environment & Energy` != 0),
    N_Immigration = sum(`Immigration` != 0),
    N_LawCrime = sum(`Law & Crime` != 0),
    N_Government = sum(`Governments & Governance` != 0),
    N_Rights = sum(`Rights, Liberties, Minorities & Discrimination` != 0)
  ) %>%
  mutate(
   Economy = sprintf("%.2f", 100 * N_Economy / sum(N_Economy)),
   Health = sprintf("%.2f", 100 * N_Health / sum(N_Health)),
   Education = sprintf("%.2f", 100 * N_Education / sum(N_Education)),
   Environnement = sprintf("%.2f", 100 * N_Environnement / sum(N_Environnement)),
   Immigration = sprintf("%.2f", 100 * N_Immigration / sum(N_Immigration)),
   "Law & Crime" = sprintf("%.2f", 100 * N_LawCrime / sum(N_LawCrime)),
   Government = sprintf("%.2f", 100 * N_Government / sum(N_Government)),
   Rights = sprintf("%.2f", 100 * N_Rights / sum(N_Rights))
  ) %>%
  select(
    GovernmentSatisfaction,
    Economy, Health, Education, Environnement, Immigration,
    "Law & Crime", Government, Rights
  )

## Croisement avec Democracy Satisfaction
CPSIMPISS <- cbind(CPSIMPISS, DemocracySatisfaction = CES21RAW$cps21_demsat)
DEMSAT <- CPSIMPISS %>%
  filter(!is.na(DemocracySatisfaction) & DemocracySatisfaction != 5) %>%
  mutate(
    DemocracySatisfaction = factor(
      DemocracySatisfaction,
      labels = c("Very", "Fairly", "Not very", "Not at all")
     )
    ) %>%
  group_by(DemocracySatisfaction) %>%
  summarize(
    N_Economy = sum(`Economy & Labour` != 0),
    N_Health = sum(`Health & Social Services` != 0),
    N_Education = sum(`Education` != 0),
    N_Environnement = sum(`Environment & Energy` != 0),
    N_Immigration = sum(`Immigration` != 0),
    N_LawCrime = sum(`Law & Crime` != 0),
    N_Government = sum(`Governments & Governance` != 0),
    N_Rights = sum(`Rights, Liberties, Minorities & Discrimination` != 0)
  ) %>%
  mutate(
    Economy = sprintf("%.2f", 100 * N_Economy / sum(N_Economy)),
    Health = sprintf("%.2f", 100 * N_Health / sum(N_Health)),
    Education = sprintf("%.2f", 100 * N_Education / sum(N_Education)),
    Environnement = sprintf("%.2f", 100 * N_Environnement / sum(N_Environnement)),
    Immigration = sprintf("%.2f", 100 * N_Immigration / sum(N_Immigration)),
    "Law & Crime" = sprintf("%.2f", 100 * N_LawCrime / sum(N_LawCrime)),
    Government = sprintf("%.2f", 100 * N_Government / sum(N_Government)),
    Rights = sprintf("%.2f", 100 * N_Rights / sum(N_Rights))
  ) %>%
  select(
    DemocracySatisfaction,
    Economy, Health, Education, Environnement, Immigration,
    "Law & Crime", Government, Rights
  )

## Croisement avec Liberal Promises (1 = DISAGREE, 4 = AGREE)
CPSIMPISS <- cbind(CPSIMPISS, LiberalPromises = CES21RAW$cps21_lib_promises)
LIBPRO <- CPSIMPISS %>%
  filter(!is.na(LiberalPromises) & LiberalPromises != 5) %>%
  mutate(
    LiberalPromises = factor(
      LiberalPromises,
      labels = c("Strongly Disagree", "Somewhat Disagree", "Somewhat Agree", "Strongly Agree")
    )
  ) %>%
  group_by(LiberalPromises) %>%
  summarize(
    N_Economy = sum(`Economy & Labour` != 0),
    N_Health = sum(`Health & Social Services` != 0),
    N_Education = sum(`Education` != 0),
    N_Environnement = sum(`Environment & Energy` != 0),
    N_Immigration = sum(`Immigration` != 0),
    N_LawCrime = sum(`Law & Crime` != 0),
    N_Government = sum(`Governments & Governance` != 0),
    N_Rights = sum(`Rights, Liberties, Minorities & Discrimination` != 0)
  ) %>%
  mutate(
    Economy = sprintf("%.2f", 100 * N_Economy / sum(N_Economy)),
    Health = sprintf("%.2f", 100 * N_Health / sum(N_Health)),
    Education = sprintf("%.2f", 100 * N_Education / sum(N_Education)),
    Environnement = sprintf("%.2f", 100 * N_Environnement / sum(N_Environnement)),
    Immigration = sprintf("%.2f", 100 * N_Immigration / sum(N_Immigration)),
    "Law & Crime" = sprintf("%.2f", 100 * N_LawCrime / sum(N_LawCrime)),
    Government = sprintf("%.2f", 100 * N_Government / sum(N_Government)),
    Rights = sprintf("%.2f", 100 * N_Rights / sum(N_Rights))
  ) %>%
  select(
    LiberalPromises,
    Economy, Health, Education, Environnement, Immigration, "Law & Crime",
    Government, Rights
  )

## Croisement avec Political parties keep promises
CPSIMPISS <- cbind(CPSIMPISS, PoliticiansPromises = CES21RAW$pes21_govtcare)
POLPRO <- CPSIMPISS %>%
  filter(!is.na(PoliticiansPromises) & PoliticiansPromises != 6 & PoliticiansPromises != 5) %>%
  mutate(
    PoliticiansPromises = factor(
      PoliticiansPromises,
      labels = c("Most of the time", "Some of the time", "Hardly ever ", "Never")
    )
  ) %>%
  group_by(PoliticiansPromises) %>%
  summarize(
    N_Economy = sum(`Economy & Labour` != 0),
    N_Health = sum(`Health & Social Services` != 0),
    N_Education = sum(`Education` != 0),
    N_Environnement = sum(`Environment & Energy` != 0),
    N_Immigration = sum(`Immigration` != 0),
    N_LawCrime = sum(`Law & Crime` != 0),
    N_Government = sum(`Governments & Governance` != 0),
    N_Rights = sum(`Rights, Liberties, Minorities & Discrimination` != 0)
  ) %>%
  mutate(
    Economy = sprintf("%.2f", 100 * N_Economy / sum(N_Economy)),
    Health = sprintf("%.2f", 100 * N_Health / sum(N_Health)),
    Education = sprintf("%.2f", 100 * N_Education / sum(N_Education)),
    Environnement = sprintf("%.2f", 100 * N_Environnement / sum(N_Environnement)),
    Immigration = sprintf("%.2f", 100 * N_Immigration / sum(N_Immigration)),
    "Law & Crime" = sprintf("%.2f", 100 * N_LawCrime / sum(N_LawCrime)),
    Government = sprintf("%.2f", 100 * N_Government / sum(N_Government)),
    Rights = sprintf("%.2f", 100 * N_Rights / sum(N_Rights))
  ) %>%
  select(
    PoliticiansPromises,
    Economy, Health, Education, Environnement, Immigration, "Law & Crime",
    Government, Rights
  )


## Croisement avec Governement Care
CPSIMPISS <- cbind(CPSIMPISS, GovernementCare = CES21RAW$pes21_keepromises)
GOVCARE <- CPSIMPISS %>%
  filter(!is.na(GovernementCare) & GovernementCare != 6) %>%
  mutate(
    GovernementCare = factor(
      GovernementCare,
      labels = c("Strongly disagree", "Somewhat disagree", "Neither agree nor disagree", "Somewhat agree", "Strongly agree")
    )
  ) %>%
  group_by(GovernementCare) %>%
  summarize(
    N_Economy = sum(`Economy & Labour` != 0),
    N_Health = sum(`Health & Social Services` != 0),
    N_Education = sum(`Education` != 0),
    N_Environnement = sum(`Environment & Energy` != 0),
    N_Immigration = sum(`Immigration` != 0),
    N_LawCrime = sum(`Law & Crime` != 0),
    N_Government = sum(`Governments & Governance` != 0),
    N_Rights = sum(`Rights, Liberties, Minorities & Discrimination` != 0)
  ) %>%
  mutate(
    Economy = sprintf("%.2f", 100 * N_Economy / sum(N_Economy)),
    Health = sprintf("%.2f", 100 * N_Health / sum(N_Health)),
    Education = sprintf("%.2f", 100 * N_Education / sum(N_Education)),
    Environnement = sprintf("%.2f", 100 * N_Environnement / sum(N_Environnement)),
    Immigration = sprintf("%.2f", 100 * N_Immigration / sum(N_Immigration)),
    "Law & Crime" = sprintf("%.2f", 100 * N_LawCrime / sum(N_LawCrime)),
    Government = sprintf("%.2f", 100 * N_Government / sum(N_Government)),
    Rights = sprintf("%.2f", 100 * N_Rights / sum(N_Rights))
  ) %>%
  select(
    GovernementCare,
    Economy, Health, Education, Environnement, Immigration, "Law & Crime",
    Government, Rights
  )

### GRAPHIQUES
## Graphique Liberal keeps promises
LIBPROLONG <- LIBPRO %>%
  gather(key, value, -LiberalPromises) %>%
  mutate(value = as.numeric(value))
ggplot(LIBPROLONG, aes(x = as.factor(LiberalPromises), y = value, fill = key)) +
  geom_bar(stat = "identity", position = "dodge", color = "white") +
  facet_wrap(~ key, scales = "free_y", ncol = 2) +
  labs(x = "Agreement Level", y = "Percentage (%) of respondants for each main issue", title = "Justin Trudeau kept the election promises he made in 2019.") +
  geom_text(aes(label = paste0(value, "%")), vjust = -0.5,
            position = position_dodge(0.9),
            size = 2.5) +
  clessnverse::theme_clean_light(base_size = 15) +
  theme(
    plot.title = element_text(size = 15, hjust = 0.5),
    axis.title.x = element_text(size = 12, hjust = 0.5),
    axis.title.y = element_text(size = 10, hjust = 0.7),
    axis.text = element_text(size = 10),
    legend.position = "none",
    axis.text.x = element_text(angle = 20, hjust=0.9)) +
  scale_y_continuous(limits = c(0, 70), breaks = seq(0, 70, by = 20))

## Graphique satisfaction démocratique
DEMSATLONG <- DEMSAT %>%
  gather(key, value, -DemocracySatisfaction) %>%
  mutate(value = as.numeric(value))
ggplot(DEMSATLONG, aes(x = as.factor(DemocracySatisfaction), y = value, fill = key)) +
  geom_bar(stat = "identity", position = "dodge", color = "white") +
  facet_wrap(~ key, scales = "free_y", ncol = 2) +
  labs(x = "Satisfaction Level", y = "Percentage (%) of respondants for each main issue", title = "On the whole, are you very satisfied, fairly satisfied, not very satisfied,
or not satisfied at all with the way democracy works in Canada?") +
  geom_text(aes(label = paste0(value, "%")), vjust = -0.5,
            position = position_dodge(0.9),
            size = 2.5) +
  clessnverse::theme_clean_light(base_size = 15) +
  theme(
    plot.title = element_text(size = 15, hjust = 0.5),
    axis.title.x = element_text(size = 12, hjust = 0.5),
    axis.title.y = element_text(size = 10, hjust = 0.7),
    legend.position = "none",
    axis.text = element_text(size = 10)) +
scale_y_continuous(limits = c(0, 80), breaks = seq(0, 80, by = 20)) +
  scale_x_discrete(limits = rev(levels(DEMSATLONG$DemocracySatisfaction)))

## Graphique satisfaction gouvernementale
GOVSATLONG <- GOVSAT %>%
  gather(key, value, -GovernmentSatisfaction) %>%
  mutate(value = as.numeric(value))
ggplot(GOVSATLONG, aes(x = as.factor(GovernmentSatisfaction), y = value, fill = key)) +
  geom_bar(stat = "identity", position = "dodge", color = "white") +
  facet_wrap(~ key, scales = "free_y", ncol = 2) +
  labs(x = "Satisfaction Level", y = "Percentage (%) of respondants for each main issue", title = "How satisfied are you with the performance of the federal
government under Justin Trudeau?") +
  geom_text(aes(label = paste0(value, "%")), vjust = -0.5,
            position = position_dodge(0.9),
            size = 2.5) +
  clessnverse::theme_clean_light(base_size = 15) +
  theme(
    plot.title = element_text(size = 15, hjust = 0.5),
    axis.title.x = element_text(size = 12, hjust = 0.5),
    axis.title.y = element_text(size = 10, hjust = 0.7),
    legend.position = "none",
    axis.text = element_text(size = 10)) +
  scale_y_continuous(limits = c(0, 80), breaks = seq(0, 80, by = 20))+
  scale_x_discrete(limits = rev(levels(DEMSATLONG$DemocracySatisfaction)))

## Graphique Politicians keep promises
POLPROLONG <- POLPRO %>%
  gather(key, value, -PoliticiansPromises) %>%
  mutate(value = as.numeric(value))
ggplot(POLPROLONG, aes(x = as.factor(PoliticiansPromises), y = value, fill = key)) +
  geom_bar(stat = "identity", position = "dodge", color = "white") +
  facet_wrap(~ key, scales = "free_y", ncol = 2) +
  labs(x = "Agreement Level", y = "Percentage (%) of respondants for each main issue", title = "Do political parties keep their election promises?") +
  geom_text(aes(label = paste0(value, "%")), vjust = -0.5,
            position = position_dodge(0.9),
            size = 2.5) +
  clessnverse::theme_clean_light(base_size = 15) +
  theme(
    plot.title = element_text(size = 15, hjust = 0.5),
    axis.title.x = element_text(size = 12, hjust = 0.5),
    axis.title.y = element_text(size = 10, hjust = 0.7),
    axis.text = element_text(size = 10),
    legend.position = "none",
    axis.text.x = element_text(angle = 20, hjust=0.9)) +
  scale_y_continuous(limits = c(0, 70), breaks = seq(0, 70, by = 20))

## Graphiques Government Care

GOVCARELONG <- GOVCARE %>%
  gather(key, value, -GovernementCare) %>%
  mutate(value = as.numeric(value))
ggplot(GOVCARELONG, aes(x = as.factor(GovernementCare), y = value, fill = key)) +
  geom_bar(stat = "identity", position = "dodge", color = "white") +
  facet_wrap(~ key, scales = "free_y", ncol = 2) +
  labs(x = "Agreement Level", y = "Percentage (%) of respondants for each main issue", title = "The government does not care much about what people like me think.") +
  geom_text(aes(label = paste0(value, "%")), vjust = -0.5,
            position = position_dodge(0.9),
            size = 2.5) +
  clessnverse::theme_clean_light(base_size = 15) +
  theme(
    plot.title = element_text(size = 15, hjust = 0.5),
    axis.title.x = element_text(size = 12, hjust = 0.5),
    axis.title.y = element_text(size = 10, hjust = 0.7),
    axis.text = element_text(size = 10),
    legend.position = "none",
    axis.text.x = element_text(angle = 20, hjust=0.9)) +
  scale_y_continuous(limits = c(0, 70), breaks = seq(0, 70, by = 20))


### Exportation des données À REVOIR

file_path <- file.path(getwd(), "Cleaning.R")
write.csv(DEMSAT, file = file_path, row.names = FALSE)
