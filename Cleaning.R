######################################     Recoding file CES 2021 - SPSA CPET EFFECTS     ##########################################

## Library used ##
library(foreign)
library(tidyverse)
library(haven)
library(readstata13)
source("BindOpenQuestion.R")
source("CleanOpenQuestion.R")
source("FilterOpenQuestion.R")
source("ModeOpenQuestion.R")

#********************************#
####_____ 0. LOADING DATA_____####
#********************************#

## Loading/Reading a Datafile ##


# 2.1. Loading SES dataset avec les colomnes souhaités


CES21RAW <- data.frame(read_dta("2021 Canadian Election Study v1.0.dta", col_select = c("cps21_imp_iss", "cps21_demsat", "cps21_fed_gov_sat", "cps21_govt_confusing",
                                                                                        "cps21_lib_promises")))

# Cleaning de cps21_imp_iss : What is the most important issue to you personally in this federal election?
## POUR COMMENCER LE FILTER, il faut d'abord rouler la première ligne du code seule. Une fois que IMPISS est dans l'environnement, on peut rouler tout le bloc d'un coup.


IMPISS <- FilterOpenQuestion2(CES21RAW, "cps21_imp_iss", c("taxes", "taxation", "over taxation", "tax the rich", "economy", "economie", "work", "housing affordability",
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
                                                           ),
                                                           "Economy & Labour")
IMPISSa <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("Vaccine", "health", "santé", "healthcare", "health care", "covid19", "covid", "covid 19", "child care", "seniors",
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
                                                          ),
                                                          "Health & Social Services")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSa)
IMPISSb <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("Agriculture", "autonomie des provinces"), "Public Lands & Agriculture")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSb)
IMPISSc <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("Education", "student loans", "student debt", "leducation"), "Education")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSc)
IMPISSd <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("Environment", "environnement"," the environment", "lenvironnement", "pollution", "climat", "climate",
                                                          "climate change", "changement climatique", "the environment", "les changements climatiques", "global warming",
                                                          "changements climatiques", "climate crisis", "environmental issues", "le climat", "rechauffement climatique",
                                                          "climate control", "environement", "environmental", "climate action", "ecologie", "the climate crisis",
                                                          "le rechauffement climatique", "climate emergency", "le changement climatique", "crise climatique", "lecologie",
                                                          "enviroment", "environment/climate change", "environmental protection", "la crise climatique", "pipelines",
                                                          "addressing climate change", "ethics in government", "environnement et changements climatiques",
                                                          "climate change/environment", "lenvironement", "environment and climate change", "the environment/climate change",
                                                          "lenvironnement et les changements climatiques"
                                                          ), "Environment & Energy")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSd)
IMPISSe <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("Immigration", "limmigration", "stop immigration", "inmigrations"), "Immigration")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSe)
IMPISSf <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("Crime", "gun control", "safety", "firearms"), "Law & Crime")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSf)
IMPISSg <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("Technology"), "Technology")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSg)
IMPISSh <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("International Affairs", "Defense", "war", "china"), "International Affairs & Defense")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSh)
IMPISSi <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("Government Operations", "accountability", "honesty", "leadership", "integrity", "electoral reform", "ethics",
                                                          "transparency", "government spending", "corruption", "truth", "trust", "respect des competences provinciales",
                                                          "un gouvernement majoritaire", "avoir un gouvernement minoritaire", "avoir un gouvernement majoritaire",
                                                          "democracy", "honestly", "proportional representation", "le pouvoir", "le respect des competences provinciales",
                                                          "government corruption", "gouvernement majoritaire", "election reform", "ethics in government", "honnetete",
                                                          "honest government"
                                                          ), "Governments & Governance")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSi)
IMPISSj <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("Culture", "le francais", "lindependance du quebec", "la langue francaise", "le quebec", "respect du quebec"
                                                          ), "Culture & Nationalism")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSj)
IMPISSk <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("womens rights", "womans rights", "racism", "racisme", "racisme systemique", "freedom", "equality",
                                                          "human rights", "indigenous rights", "indigenous issues", "reconciliation", "freedom of choice",
                                                          "indigenous reconciliation", "inequality", "liberte", "freedom of speech", "indigenous affairs",
                                                          "rights and freedoms", "social justice", "equity", "fair", "fairness", "personal freedom", "unity",
                                                          "abortion", "freedom of rights", "justice", "la liberte", "indigenous relations"), "Rights, Liberties, Minorities & Discrimination")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSk)
IMPISS$cps21_imp_iss[IMPISS$cps21_imp_iss %in% c("99", "nothing", "not sure", "getting rid of trudeau", "i dont know", "none", "je ne sais pas", "dont know",
                                                 "aucun", "get rid of trudeau", "n/a", "aucune idee", "idk", "na", "je sais pas", "unsure", "rien",
                                                 "getting rid of the liberals", "getting trudeau out", "no comment", "no issue", "?", "sortir trudeau", "trudeau",
                                                 "no", "ubi", "change", ".", "economie et environnement", "la sante et leducation", "changer de gouvernement",
                                                 "aucune", "everything", "getting rid of justin trudeau", "getting trudeau out of office", "tout", "to get trudeau out",
                                                 "who is going to win the election", "getting trudeau out of power", "ne sais pas", "no opinion", "ne sait pas",
                                                 "health care and taxes", "sortir les liberaux", "to get rid of trudeau", "undecided", "who to vote for")] <- NA
CleanOpenQuestion("IMPISS")
ModeOpenQuestion(IMPISS, "cps21_imp_iss", 10)

### Sont exclus les réponses en lien avec la partisanerie et le vote partisan, les je ne sais pas/préfère ne pas répondre et autres réponses peu claires.
### Les analyses ont été arrêtés à partir de 3 occurences d'une même réponse car autrement ce serait trop time consuming.

## Croisement avec Government Satisfaction
IMPISS <- cbind(IMPISS, GovernmentSatisfaction = CES21RAW$cps21_fed_gov_sat)
GOVSAT <- IMPISS %>%
  group_by(GovernmentSatisfaction) %>%
  summarize(
    N_Economy = sum(`Economy & Labour` != 0),
    N_Health = sum(`Health & Social Services` != 0),
    N_Agriculture = sum(`Public Lands & Agriculture` != 0),
    N_Education = sum(`Education` != 0),
    N_Environnement = sum(`Environment & Energy` != 0),
    N_Immigration = sum(`Immigration` != 0),
    N_LawCrime = sum(`Law & Crime` != 0),
    N_International = sum(`International Affairs & Defense` != 0),
    N_Government = sum(`Governments & Governance` != 0),
    N_Culture = sum(`Culture & Nationalism` != 0),
    N_Rights = sum(`Rights, Liberties, Minorities & Discrimination` != 0)
  ) %>%
  mutate(
    P_Economy = sprintf("%.2f%%", 100 * N_Economy / sum(N_Economy)),
    P_Health = sprintf("%.2f%%", 100 * N_Health / sum(N_Health)),
    P_Agriculture = sprintf("%.2f%%", 100 * N_Agriculture / sum(N_Agriculture)),
    P_Education = sprintf("%.2f%%", 100 * N_Education / sum(N_Education)),
    P_Environnement = sprintf("%.2f%%", 100 * N_Environnement / sum(N_Environnement)),
    P_Immigration = sprintf("%.2f%%", 100 * N_Immigration / sum(N_Immigration)),
    P_LawCrime = sprintf("%.2f%%", 100 * N_LawCrime / sum(N_LawCrime)),
    P_International = sprintf("%.2f%%", 100 * N_International / sum(N_International)),
    P_Government = sprintf("%.2f%%", 100 * N_Government / sum(N_Government)),
    P_Culture = sprintf("%.2f%%", 100 * N_Culture / sum(N_Culture)),
    P_Rights = sprintf("%.2f%%", 100 * N_Rights / sum(N_Rights))
  ) %>%
  select(
    GovernmentSatisfaction,
    N_Economy, P_Economy,
    N_Health, P_Health,
    N_Agriculture, P_Agriculture,
    N_Education, P_Education,
    N_Environnement, P_Environnement,
    N_Immigration, P_Immigration,
    N_LawCrime, P_LawCrime,
    N_International, P_International,
    N_Government, P_Government,
    N_Culture, P_Culture,
    N_Rights, P_Rights
  )

## Croisement avec Democracy Satisfaction
IMPISS <- cbind(IMPISS, DemocracySatisfaction = CES21RAW$cps21_demsat)
DEMSAT <- IMPISS %>%
  group_by(DemocracySatisfaction) %>%
  summarize(
    N_Economy = sum(`Economy & Labour` != 0),
    N_Health = sum(`Health & Social Services` != 0),
    N_Agriculture = sum(`Public Lands & Agriculture` != 0),
    N_Education = sum(`Education` != 0),
    N_Environnement = sum(`Environment & Energy` != 0),
    N_Immigration = sum(`Immigration` != 0),
    N_LawCrime = sum(`Law & Crime` != 0),
    N_International = sum(`International Affairs & Defense` != 0),
    N_Government = sum(`Governments & Governance` != 0),
    N_Culture = sum(`Culture & Nationalism` != 0),
    N_Rights = sum(`Rights, Liberties, Minorities & Discrimination` != 0)
  ) %>%
  mutate(
    P_Economy = sprintf("%.2f%%", 100 * N_Economy / sum(N_Economy)),
    P_Health = sprintf("%.2f%%", 100 * N_Health / sum(N_Health)),
    P_Agriculture = sprintf("%.2f%%", 100 * N_Agriculture / sum(N_Agriculture)),
    P_Education = sprintf("%.2f%%", 100 * N_Education / sum(N_Education)),
    P_Environnement = sprintf("%.2f%%", 100 * N_Environnement / sum(N_Environnement)),
    P_Immigration = sprintf("%.2f%%", 100 * N_Immigration / sum(N_Immigration)),
    P_LawCrime = sprintf("%.2f%%", 100 * N_LawCrime / sum(N_LawCrime)),
    P_International = sprintf("%.2f%%", 100 * N_International / sum(N_International)),
    P_Government = sprintf("%.2f%%", 100 * N_Government / sum(N_Government)),
    P_Culture = sprintf("%.2f%%", 100 * N_Culture / sum(N_Culture)),
    P_Rights = sprintf("%.2f%%", 100 * N_Rights / sum(N_Rights))
  ) %>%
  select(
    DemocracySatisfaction,
    N_Economy, P_Economy,
    N_Health, P_Health,
    N_Agriculture, P_Agriculture,
    N_Education, P_Education,
    N_Environnement, P_Environnement,
    N_Immigration, P_Immigration,
    N_LawCrime, P_LawCrime,
    N_International, P_International,
    N_Government, P_Government,
    N_Culture, P_Culture,
    N_Rights, P_Rights
  )

## Croisement avec Government Confusing
IMPISS <- cbind(IMPISS, GovernmentConfusing = CES21RAW$cps21_govt_confusing)
GOVCONFU <- IMPISS %>%
  group_by(GovernmentConfusing) %>%
  summarize(
    N_Economy = sum(`Economy & Labour` != 0),
    N_Health = sum(`Health & Social Services` != 0),
    N_Agriculture = sum(`Public Lands & Agriculture` != 0),
    N_Education = sum(`Education` != 0),
    N_Environnement = sum(`Environment & Energy` != 0),
    N_Immigration = sum(`Immigration` != 0),
    N_LawCrime = sum(`Law & Crime` != 0),
    N_International = sum(`International Affairs & Defense` != 0),
    N_Government = sum(`Governments & Governance` != 0),
    N_Culture = sum(`Culture & Nationalism` != 0),
    N_Rights = sum(`Rights, Liberties, Minorities & Discrimination` != 0)
  ) %>%
  mutate(
    P_Economy = sprintf("%.2f%%", 100 * N_Economy / sum(N_Economy)),
    P_Health = sprintf("%.2f%%", 100 * N_Health / sum(N_Health)),
    P_Agriculture = sprintf("%.2f%%", 100 * N_Agriculture / sum(N_Agriculture)),
    P_Education = sprintf("%.2f%%", 100 * N_Education / sum(N_Education)),
    P_Environnement = sprintf("%.2f%%", 100 * N_Environnement / sum(N_Environnement)),
    P_Immigration = sprintf("%.2f%%", 100 * N_Immigration / sum(N_Immigration)),
    P_LawCrime = sprintf("%.2f%%", 100 * N_LawCrime / sum(N_LawCrime)),
    P_International = sprintf("%.2f%%", 100 * N_International / sum(N_International)),
    P_Government = sprintf("%.2f%%", 100 * N_Government / sum(N_Government)),
    P_Culture = sprintf("%.2f%%", 100 * N_Culture / sum(N_Culture)),
    P_Rights = sprintf("%.2f%%", 100 * N_Rights / sum(N_Rights))
  ) %>%
  select(
    GovernmentConfusing,
    N_Economy, P_Economy,
    N_Health, P_Health,
    N_Agriculture, P_Agriculture,
    N_Education, P_Education,
    N_Environnement, P_Environnement,
    N_Immigration, P_Immigration,
    N_LawCrime, P_LawCrime,
    N_International, P_International,
    N_Government, P_Government,
    N_Culture, P_Culture,
    N_Rights, P_Rights
  )
## Croisement avec Liberal Promises (1 = DISAGREE, 4 = AGREE)
IMPISS <- cbind(IMPISS, LiberalPromises = CES21RAW$cps21_lib_promises)
LIBPRO <- IMPISS %>%
  filter(!is.na(LiberalPromises)) %>%
  group_by(LiberalPromises) %>%
  summarize(
    N_Economy = sum(`Economy & Labour` != 0),
    N_Health = sum(`Health & Social Services` != 0),
    N_Agriculture = sum(`Public Lands & Agriculture` != 0),
    N_Education = sum(`Education` != 0),
    N_Environnement = sum(`Environment & Energy` != 0),
    N_Immigration = sum(`Immigration` != 0),
    N_LawCrime = sum(`Law & Crime` != 0),
    N_International = sum(`International Affairs & Defense` != 0),
    N_Government = sum(`Governments & Governance` != 0),
    N_Culture = sum(`Culture & Nationalism` != 0),
    N_Rights = sum(`Rights, Liberties, Minorities & Discrimination` != 0)
  ) %>%
  mutate(
    P_Economy = sprintf("%.2f%%", 100 * N_Economy / sum(N_Economy)),
    P_Health = sprintf("%.2f%%", 100 * N_Health / sum(N_Health)),
    P_Agriculture = sprintf("%.2f%%", 100 * N_Agriculture / sum(N_Agriculture)),
    P_Education = sprintf("%.2f%%", 100 * N_Education / sum(N_Education)),
    P_Environnement = sprintf("%.2f%%", 100 * N_Environnement / sum(N_Environnement)),
    P_Immigration = sprintf("%.2f%%", 100 * N_Immigration / sum(N_Immigration)),
    P_LawCrime = sprintf("%.2f%%", 100 * N_LawCrime / sum(N_LawCrime)),
    P_International = sprintf("%.2f%%", 100 * N_International / sum(N_International)),
    P_Government = sprintf("%.2f%%", 100 * N_Government / sum(N_Government)),
    P_Culture = sprintf("%.2f%%", 100 * N_Culture / sum(N_Culture)),
    P_Rights = sprintf("%.2f%%", 100 * N_Rights / sum(N_Rights))
  ) %>%
  select(
    LiberalPromises,
    N_Economy, P_Economy,
    N_Health, P_Health,
    N_Agriculture, P_Agriculture,
    N_Education, P_Education,
    N_Environnement, P_Environnement,
    N_Immigration, P_Immigration,
    N_LawCrime, P_LawCrime,
    N_International, P_International,
    N_Government, P_Government,
    N_Culture, P_Culture,
    N_Rights, P_Rights
  )

