# SPSA_article_CPET

## Auteurs : Benjamin Carignan

## Abstract (ENVOYÉ À SPSA) : 

Empirical evidence suggests an increasing cynicism among Canadian citizens,
which would be partly rooted in the belief that politicians often break their
promises. Whether it is in response to this sentiment, to act as politicians’ 
watchdogs or to democratize factual information about politics, experts have 
started to create campaign pledge evaluation tools (CPET) in the last decade. 
Using Justin Trudeau’s Polimeter as a case study, this paper seeks to determine 
the effect of CPETs on Canadian citizens’ perceptions of the Liberal Party of 
Canada’s (LPC) ability to fulfill election promises. Using data from the Canadian 
Electoral Studies between 2015 and 2021, we evaluate indicators of public 
salience and mistrust during election periods based on socio-economic status and
 specific survey responses. We cross-reference these results with data from 
Trudeau’s Polimeter, allowing a comprehensive analysis of how citizens’ 
perception of the LPC evolved over time. By aggregating data on verdicts, major 
issues and the number of page clicks from the Polimeter website with the 
Canadian Electoral Studies, we develop a unique dataset on citizen-government 
perception dynamics. Preliminary findings suggest noteworthy correlations 
between Polimeter web site traffic data on the pledges related to important 
issues of survey respondents. This article contributes to a novel body of work 
on the dynamic between CPETs and public trust by exploring if such tools 
correlate with a decline in mistrust when it comes to describing how politicians 
uphold their electoral promises.

## Abstract (NOUVEAU) : xxxxxxxxxxx

## Variables intéressantes du CES : 

# 2015: issAllEcnMI, issEnvMI, issAllSocPrMI, issAllMoralMI, issQcMI, 
	issHlthMI, issCorrupMI, issCrimMI, issFrgnMI, issRghtsMI, 
	issImmgAborMI (Most important issues/ Saillance)

# 2015: noCarePeoThink, corrupGovt, losetouchElect, distrustMedia, distrustGovt,
	cantTrustOthers, ppFeelLibALL, leadFeelLibALL, issCanadaFeelALL, 
	issEcnBORWALL, polInter1FedALL, polInter2GenALL, persoCriticalALL, 
	persoAnxiousALL (Cynisme, Distrust)

# P.S. 	Il reste à voir l'étendue des possibilitées offertes par google 
	analytics. Cela pourrait ouvrir la porte à de nouvelles questions

# P.S.	Il n'est pas possible de lier les réponses invididuelles des 
	répondants du CES avec les "pages views" du polimètre. Il est plutôt
	souhaitable de comparer l'évolution de certaines tendances du CES au
	fil des élections, afin de voir si ces tendances se retrouvent également
	dans les données de google analytics.

# P.S. 	Les variables sociodémographiques du CES sont pour la plupart
	inutiles. Par exemple, il serait intéressant de comparer le niveau 
	d'éducation avec les préférences d'enjeux de promesses. Cependant, il
	est probablement impossible d'avoir ces informations avec google
	analytics. 

## Possibilités de questions

#  avec les données de google analytics : 

1. 	Quel type de promesse est davantage visitée par les utilisateurs? 
	(Catégorie d'enjeux, mais aussi état de réalisation)
2. 	Quels Polimètres sont les plus visités?
3. 	Quels Polimètres sont les plus en vogue dans une période de temps 
	précise?
4. 	À travers le temps, les visites ont-elles augmenté?
5. 	De quels pays viennent les utilisateurs du Polimètre?
6. 	De quelle ville viennent-ils? (Pas sûr à 100 % mais je crois 
	qu'on peut checker) --> À VÉRIFIER (crucial pour éliminer les visites
	des auxiliaires de recherche
7. 	Les visiteurs du Polimètre Trudeau visitent-ils surtout le site en 
	anglais ou en français?

#  avec les données du CES : 

1. 	Quelles sont les perceptions des Canadiens du gouvernement Trudeau en 
	général? (Des données de sondage pourraient aussi être mobilisées)
2. 	Quels sont les enjeux les plus importants pour les Canadiens?

#  avec le croisement de google analytics et des CES

1. 	Est-ce que les données du Polimètre peuvent potentiellement être des 
	indicateurs de l'opinion public ? (par exemple : préférence de catégories
	d'enjeux, cynisme,  confiance envers le gouvernement en place, etc). 

## Question de recherche (OFFICIELLE) : xxxxxxxxxxxx

## Méthodologie envisagée : Hierarchical Linear Modeling (HLM):

# INDIVIDUAL LEVEL
Yij = β0j + β1jXij + eij

# GROUP LEVEL 
β0j = F00 + F01Wj + u0j
β1j = F10 + F11Wj + u1j

# Légende 
Y = Cynisme
i = Répondant individuel
j = Groupe (Catégorie d'enjeu)
β0j = Intercept par groupe
β1j = Slope de x par groupe
Xij = Page view (oui/non) par individu au niveau du groupe respectif
F00 / F01 / F10 / F11 = Effets fixes au niveau du groupe.
Wj = Prédicture au niveau du groupe	
u0j / u1j = effets aléatoires au niveau du groupe
eij = effets aléatoires au niveau individuel				 