######################################     Recoding file CES 2021 - SPSA CPET EFFECTS     ##########################################

## Library used ##
library(foreign)
library(tidyverse)
library(haven)
library(readstata13)

#********************************#
####_____ 0. LOADING DATA_____####
#********************************#

## Loading/Reading a Datafile ##


# 2.1. Loading SES dataset


CES21RAW <- data.frame(read_dta("2021 Canadian Election Study v1.0.dta", col_select = c("cps21_imp_iss")))

# Cleaning de cps21_imp_iss : What is the most important issue to you personally in this federal election?


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
                                                           "economy and cost of living", "economique", "economie du pays","economic recovery post covid"
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
                                                          "transfert en sante", "transferts en sante", "care for seniors", "covid crisis", "covid passports"
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
                                                          "addressing climate change"
                                                          ), "Environment & Energy")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSd)
IMPISSe <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("Immigration", "limmigration", "stop immigration"), "Immigration")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSe)
IMPISSf <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("Crime", "gun control", "safety", "firearms"), "Law & Crime")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSf)
IMPISSg <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("Technology"), "Technology")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSg)
IMPISSh <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("International Affairs", "Defense", "war"), "International Affairs & Defense")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSh)
IMPISSi <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("Government Operations", "accountability", "honesty", "leadership", "integrity", "electoral reform", "ethics",
                                                          "transparency", "government spending", "corruption", "truth", "trust", "respect des competences provinciales",
                                                          "un gouvernement majoritaire", "avoir un gouvernement minoritaire", "avoir un gouvernement majoritaire",
                                                          "democracy", "honestly", "proportional representation", "le pouvoir", "le respect des competences provinciales",
                                                          "government corruption", "gouvernement majoritaire", "election reform"
                                                          ), "Governments & Governance")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSi)
IMPISSj <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("Culture", "le francais", "lindependance du quebec", "la langue francaise", "le quebec"), "Culture & Nationalism")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSj)
IMPISSk <- FilterOpenQuestion2(IMPISS, "cps21_imp_iss", c("womens rights", "womans rights", "racism", "racisme", "racisme systemique", "freedom", "equality",
                                                          "human rights", "indigenous rights", "indigenous issues", "reconciliation", "freedom of choice",
                                                          "indigenous reconciliation", "inequality", "liberte", "freedom of speech", "indigenous affairs",
                                                          "rights and freedoms", "social justice", "equity", "fair", "fairness", "personal freedom", "unity",
                                                          "abortion"), "Rights, Liberties, Minorities & Discrimination")
IMPISS <- BindOpenQuestion(IMPISS, IMPISSk)
IMPISS$cps21_imp_iss[IMPISS$cps21_imp_iss %in% c("99", "nothing", "not sure", "getting rid of trudeau", "i dont know", "none", "je ne sais pas", "dont know",
                                                 "aucun", "get rid of trudeau", "n/a", "aucune idee", "idk", "na", "je sais pas", "unsure", "rien",
                                                 "getting rid of the liberals", "getting trudeau out", "no comment", "no issue", "?", "sortir trudeau", "trudeau",
                                                 "no", "ubi", "change", ".", "economie et environnement", "la sante et leducation", "changer de gouvernement",
                                                 "aucune", "everything", "getting rid of justin trudeau", "getting trudeau out of office", "tout", "to get trudeau out",
                                                 "who is going to win the election", "china")] <- NA
CleanOpenQuestion("IMPISS")
ModeOpenQuestion(IMPISS, "cps21_imp_iss", 10)
