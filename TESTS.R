# Cleaning pour analyse factorielle

#### 0.1 Creating a clean empty dataframe ####
#### 0.1 Creating a clean empty dataframe ####
numRows <- nrow(CES21)
CleanData <- data.frame(length = numeric(numRows))

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
table(CleanData$DemSat2)

CleanData$DemSat2 <- NA
CleanData$DemSat2[CES21$pes21_dem_sat == 1] <- 1
CleanData$DemSat2[CES21$pes21_dem_sat == 3] <- 0.66
CleanData$DemSat2[CES21$pes21_dem_sat == 2] <- 0.33
CleanData$DemSat2[CES21$pes21_dem_sat == 4] <- 0
CleanData$DemSat2[CES21$pes21_dem_sat == 5] <- NA
table(CleanData$LibPro)

CleanData$PolPro <- NA
CleanData$PolPro[CES21$pes21_keepromises == 1] <- 1
CleanData$PolPro[CES21$pes21_keepromises == 2] <- 0.75
CleanData$PolPro[CES21$pes21_keepromises == 5] <- 0.5
CleanData$PolPro[CES21$pes21_keepromises == 3] <- 0.25
CleanData$PolPro[CES21$pes21_keepromises == 4] <- 0
CleanData$PolPro[CES21$pes21_keepromises == 6] <- NA
table(CleanData$PolPro)

CleanData$GovCare <- NULL
CleanData$GovCare[CES21$pes21_govtcare == 1] <- 0
CleanData$GovCare[CES21$pes21_govtcare == 2] <- 0.25
CleanData$GovCare[CES21$pes21_govtcare == 3] <- 0.5
CleanData$GovCare[CES21$pes21_govtcare == 4] <- 0.75
CleanData$GovCare[CES21$pes21_govtcare == 5] <- 1
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
CleanData$Populism3[CES21$pes21_populism_3 == 1] <- 0
CleanData$Populism3[CES21$pes21_populism_3 == 2] <- 0.25
CleanData$Populism3[CES21$pes21_populism_3 == 3] <- 0.5
CleanData$Populism3[CES21$pes21_populism_3 == 4] <- 0.75
CleanData$Populism3[CES21$pes21_populism_3 == 5] <- 1
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
CleanData$Populism8[CES21$pes21_populism_8 == 1] <- 0
CleanData$Populism8[CES21$pes21_populism_8 == 2] <- 0.25
CleanData$Populism8[CES21$pes21_populism_8 == 3] <- 0.5
CleanData$Populism8[CES21$pes21_populism_8 == 4] <- 0.75
CleanData$Populism8[CES21$pes21_populism_8 == 5] <- 1
CleanData$Populism8[CES21$pes21_populism_8 == 6] <- NA
table(CleanData$Populism8)

CleanData$length <- NULL

CleanData$Economy <- 0
CleanData$Economy[CPSIMPISS$`Economy & Labour` != 0] <- 1
CleanData$Health <- 0
CleanData$Health[CPSIMPISS$`Health & Social Services` != 0] <- 1
CleanData$Environment <- 0
CleanData$Environment[CPSIMPISS$`Environment & Energy`!= 0] <- 1
CleanData$Governance <- 0
CleanData$Governance[CPSIMPISS$`Governments & Governance` != 0] <- 1
CleanData$"Rights & Liberties" <- 0
CleanData$"Rights & Liberties"[CPSIMPISS$`Rights, Liberties, Minorities & Discrimination` != 0] <- 1
CleanData$Education <- 0
CleanData$Education[CPSIMPISS$Education != 0] <- 1
CleanData$Immigration <- 0
CleanData$Immigration[CPSIMPISS$Immigration != 0] <- 1
CleanData$"Law & Crime" <- 0
CleanData$"Law & Crime"[CPSIMPISS$`Law & Crime` != 0] <- 1











#### TEST DE CLEANING POUR LES PES  --> non-concluant

# Cleaning de pes21_mostimpissue : Now we'd like to ask you some questions about the recent federal election. What was the main issue in the campaign?

PESIMPISS <- FilterOpenQuestion2(CES21RAW, "pes21_mostimpissue", c("taxes", "taxation", "over taxation", "tax the rich", "economy", "economie", "work", "housing affordability",
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
                                                                   "poverty and inequality", "reducing taxes", "reduction du deficit", "remboursement de la dette", "standard of living",
                                                                   "covid and the economy", "cost", "post covid economy", "pandemic spending", "economy and covid", "economy and pandemic",
                                                                   "federal spending", "post pandemic economy"
), "Economy & Labour")
PESIMPISSa <- FilterOpenQuestion2(PESIMPISS, "pes21_mostimpissue", c("Vaccine", "health", "santé", "healthcare", "health care", "covid19", "covid", "covid 19", "child care", "seniors",
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
                                                                     "managing covid", "post pandemic recovery", "post covid recovery", "seniors pensions", "universal health care",
                                                                     "vaccinations", "covid19 pandemic", "corona virus", "pandemic management", "the covid pandemic", "covid 19 response",
                                                                     "garderies", "vaccination obligatoire", "covid relief", "covid response and recovery", "covid vaccines", "covid?",
                                                                     "pandemic handling", "covid", "les garderies"
), "Health & Social Services")
PESIMPISS <- BindOpenQuestion(PESIMPISS, PESIMPISSa)
PESIMPISSb <- FilterOpenQuestion2(PESIMPISS, "pes21_mostimpissue", c("Agriculture", "autonomie des provinces"), "Public Lands & Agriculture")
PESIMPISS <- BindOpenQuestion(PESIMPISS, PESIMPISSb)
PESIMPISSc <- FilterOpenQuestion2(PESIMPISS, "pes21_mostimpissue", c("Education", "student loans", "student debt", "leducation"), "Education")
PESIMPISS <- BindOpenQuestion(PESIMPISS, PESIMPISSc)
PESIMPISSd <- FilterOpenQuestion2(PESIMPISS, "pes21_mostimpissue", c("Environment", "environnement"," the environment", "lenvironnement", "pollution", "climat", "climate",
                                                                     "climate change", "changement climatique", "the environment", "les changements climatiques", "global warming",
                                                                     "changements climatiques", "climate crisis", "environmental issues", "le climat", "rechauffement climatique",
                                                                     "climate control", "environement", "environmental", "climate action", "ecologie", "the climate crisis",
                                                                     "le rechauffement climatique", "climate emergency", "le changement climatique", "crise climatique", "lecologie",
                                                                     "enviroment", "environment/climate change", "environmental protection", "la crise climatique", "pipelines",
                                                                     "addressing climate change", "ethics in government", "environnement et changements climatiques",
                                                                     "climate change/environment", "lenvironement", "environment and climate change", "the environment/climate change",
                                                                     "lenvironnement et les changements climatiques", "carbon tax"
), "Environment & Energy")
PESIMPISS <- BindOpenQuestion(PESIMPISS, PESIMPISSd)
PESIMPISSe <- FilterOpenQuestion2(PESIMPISS, "pes21_mostimpissue", c("Immigration", "limmigration", "stop immigration", "inmigrations"), "Immigration")
PESIMPISS <- BindOpenQuestion(PESIMPISS, PESIMPISSe)
PESIMPISSf <- FilterOpenQuestion2(PESIMPISS, "pes21_mostimpissue", c("Crime", "gun control", "safety", "firearms", "les armes a feu", "fraud"), "Law & Crime")
PESIMPISS <- BindOpenQuestion(PESIMPISS, PESIMPISSf)
PESIMPISSg <- FilterOpenQuestion2(PESIMPISS, "pes21_mostimpissue", c("Technology"), "Technology")
PESIMPISS <- BindOpenQuestion(PESIMPISS, PESIMPISSg)
PESIMPISSh <- FilterOpenQuestion2(PESIMPISS, "pes21_mostimpissue", c("International Affairs", "Defense", "war", "china"), "International Affairs & Defense")
PESIMPISS <- BindOpenQuestion(PESIMPISS, PESIMPISSh)
PESIMPISSi <- FilterOpenQuestion2(PESIMPISS, "pes21_mostimpissue", c("Government Operations", "accountability", "honesty", "leadership", "integrity", "electoral reform", "ethics",
                                                                     "transparency", "government spending", "corruption", "truth", "trust", "respect des competences provinciales",
                                                                     "un gouvernement majoritaire", "avoir un gouvernement minoritaire", "avoir un gouvernement majoritaire",
                                                                     "democracy", "honestly", "proportional representation", "le pouvoir", "le respect des competences provinciales",
                                                                     "government corruption", "gouvernement majoritaire", "election reform", "ethics in government", "honnetete",
                                                                     "honest government", "devenir majoritaire", "majorite", "obtenir la majorite", "obtenir une majorité",
                                                                     "etre majoritaire", "obtenir un gouvernement majoritaire", "majority government", "elire un gouvernement majoritaire",
                                                                     "credibility", "getting a majority", "avoir la majorite", "trudeau wanted a majority", "majority",
                                                                     "trudeau wanted a majority government", "trudeau voulait un gouvernement majoritaire", "trudeau wanting a majority",
                                                                     "majoritaire", "minority government", "the election itself", "calling an election during a pandemic",
                                                                     "avoir une majorite", "getting a majority government", "gouvernement majoritaire liberal",
                                                                     "liberals wanted a majority", "to get a majority", "un gouvernement liberal majoritaire",
                                                                     "avoir un gouvernement liberal majoritaire", "early election", "election", "majorite liberale",
                                                                     "liberals wanted a majority government", "trudeau getting a majority", "trudeau voulait une majorite",
                                                                     "trudeau wanting a majority government", "trying to get a majority government",
                                                                     "avoir un gouvernement majoritaire liberal", "justin trudeau wanted a majority",
                                                                     "les liberaux voulaient un gouvernement majoritaire", "liberal majoritaire", "liberal majority",
                                                                     "liberals wanting a majority government", "mandat majoritaire", "que le parti liberal soit majoritaire"
), "Governments & Governance")
PESIMPISS <- BindOpenQuestion(PESIMPISS, PESIMPISSi)
PESIMPISSj <- FilterOpenQuestion2(PESIMPISS, "pes21_mostimpissue", c("Culture", "le francais", "lindependance du quebec", "la langue francaise", "le quebec", "respect du quebec"
), "Culture & Nationalism")
PESIMPISS <- BindOpenQuestion(PESIMPISS, PESIMPISSj)
PESIMPISSk <- FilterOpenQuestion2(PESIMPISS, "pes21_mostimpissue", c("womens rights", "womans rights", "racism", "racisme", "racisme systemique", "freedom", "equality",
                                                                     "human rights", "indigenous rights", "indigenous issues", "reconciliation", "freedom of choice",
                                                                     "indigenous reconciliation", "inequality", "liberte", "freedom of speech", "indigenous affairs",
                                                                     "rights and freedoms", "social justice", "equity", "fair", "fairness", "personal freedom", "unity",
                                                                     "abortion", "freedom of rights", "justice", "la liberte", "indigenous relations"
), "Rights, Liberties, Minorities & Discrimination")
PESIMPISS <- BindOpenQuestion(PESIMPISS, PESIMPISSk)
PESIMPISS$pes21_mostimpissue[PESIMPISS$pes21_mostimpissue %in% c("","99", "nothing", "not sure", "getting rid of trudeau", "i dont know", "none", "je ne sais pas", "dont know",
                                                                 "aucun", "get rid of trudeau", "n/a", "aucune idee", "idk", "na", "je sais pas", "unsure", "rien",
                                                                 "getting rid of the liberals", "getting trudeau out", "no comment", "no issue", "?", "sortir trudeau", "trudeau",
                                                                 "no", "ubi", "change", ".", "economie et environnement", "la sante et leducation", "changer de gouvernement",
                                                                 "aucune", "everything", "getting rid of justin trudeau", "getting trudeau out of office", "tout", "to get trudeau out",
                                                                 "who is going to win the election", "getting trudeau out of power", "ne sais pas", "no opinion", "ne sait pas",
                                                                 "health care and taxes", "sortir les liberaux", "to get rid of trudeau", "undecided", "who to vote for", "no idea",
                                                                 "timing",  "trudeaus ego", "there wasnt one", "do not know", "there was none", "waste of money", "trudeaus vanity",
                                                                 "trudeaus leadership", "justin trudeau", "covid and climate change", "it was unnecessary", "power",
                                                                 "prefer not to answer", "ok", "too quick", "too short"

)] <- NA
CleanOpenQuestion("PESIMPISS")
ModeOpenQuestion(PESIMPISS, "pes21_mostimpissue", 10)


PESIMPISS <- cbind(PESIMPISS, TrustworthyPoliticians = CES21RAW$pes21_populism_4)
PolTrust <- PESIMPISS %>%
  group_by(TrustworthyPoliticians) %>%
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
    TrustworthyPoliticians,
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













## Test analyse factorielle








AgencyScale <- na.omit(CCPIS[, c(
  "sexrole_independent", "sexrole_passive", "sexrole_competitive",
  "sexrole_easydecisions_rev", "sexrole_giveup", "sexrole_selfconfident",
  "sexrole_inferior", "sexrole_underpressure")])
AgencyCronbach <- round(as.numeric(psy::cronbach(AgencyScale)[3]), digits = 2)
AgencyFactorAnalysis <- factanal(AgencyScale, factors = 1)
AgencyVariableNames <- c(
  "Very independent", "Very active", "Very competitive",
  "Have difficulty making\ndecisions (reversed)", "Never give up easily",
  "Very self confident", "Feel very superior", "Stand up well\nunder pressure")
AgencyFactorLoadings <- AgencyFactorAnalysis$loadings[, 1]
AgencyFirstEigenvalue <- round(eigen(cor(AgencyScale))$values[1], digits = 2)

CCPIS$agentic <- (
  CCPIS$sexrole_independent * AgencyFactorLoadings[1] +
    CCPIS$sexrole_passive * AgencyFactorLoadings[2] +
    CCPIS$sexrole_competitive * AgencyFactorLoadings[3] +
    CCPIS$sexrole_easydecisions_rev * AgencyFactorLoadings[4] +
    CCPIS$sexrole_giveup * AgencyFactorLoadings[5] +
    CCPIS$sexrole_selfconfident * AgencyFactorLoadings[6] +
    CCPIS$sexrole_inferior * AgencyFactorLoadings[7] +
    CCPIS$sexrole_underpressure * AgencyFactorLoadings[8]) /
  sum(AgencyFactorLoadings) # 0 = not agentic, 1 = agentic
length(na.omit(CCPIS$agentic)) / nrow(CCPIS) * 100 # 72% available data







ggplot(data.frame(AgencyVariableNames, AgencyFactorLoadings),
       aes(x = AgencyVariableNames, y = AgencyFactorLoadings)) +
  coord_flip() +
  geom_bar(stat = "identity", colour = "black", fill = "black", linewidth = 1,
           width = 0.4) +
  geom_text(aes(label = as.character(round(AgencyFactorLoadings, digits = 2))),
            vjust = 0.35, hjust = -0.3, family = "CM Roman") +
  geom_hline(yintercept = 0.3, colour = "gray", linetype = "longdash") +
  annotate("text", label = paste("Cronbach's alpha =", as.character(
    AgencyCronbach)), x = 1.2, y = 0.85, size = 3.8, family = "CM Roman") +
  annotate("text", label = paste("First eigenvalue =", as.character(
    AgencyFirstEigenvalue)), x = 0.8, y = 0.85, size = 3.8,
    family = "CM Roman") +
  scale_y_continuous(name = "Factor loadings", limits = c(-0.1, 1),
                     breaks = seq(-0.1, 1, by = 0.1)) +
  xlab("") +
  theme_linedraw() +
  theme(axis.text.y = element_text(size = 14),
        axis.title.x = element_text(hjust = 0.3, vjust = -0.17, size = 14),
        panel.grid = element_blank(),
        text = element_text(family = "CM Roman"))
ggsave("_graphs/AgencyScale.pdf", width = 11, height = 4.25)
