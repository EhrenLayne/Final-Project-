# Final-Project-
Final Project group repository 

Data Links: 

Decriminalization status - https://disa.com/maps/marijuana-legality-by-state

Incarceration rate - https://www.sentencingproject.org/research/us-criminal-justice-data/, https://www.sentencingproject.org/app/uploads/2022/10/The-Color-of-Justice-Racial-and-Ethnic-Disparity-in-State-Prisons-2016.pdf

Crime statistics by type - https://cde.ucr.cjis.gov/LATEST/webapp/#/pages/explorer/crime/arrest

Citations:

https://heinonline.org/HOL/Page?collection=journals&handle=hein.journals/davlr50&id=704&men_tab=srchresults

https://journals.sagepub.com/doi/full/10.1177/0011128712461122

https://dl.acm.org/doi/abs/10.1145/3514094.3534184

https://heinonline.org/HOL/P?h=hein.journals/davlr50&i=755 

https://www.aclu.org/sites/default/files/assets/100413-mj-report-rfs-rel1.pdf 

https://www.moneygeek.com/living/state-policing-corrections-spending/

https://www.cato.org/tax-budget-bulletin/budgetary-effects-ending-drug-prohibition


Notes on Miron article:

  Article Purpose: examining the fiscal effects of drug liberalization 
  
  Article Message: drug legalization (or liberalization) can reduce government spending, and generate tax revenue that transfers income from drug producers and consumers to public coffers.
  
  Article Findings:
    
    State and local governments spend $29 billion on drug prohibition annually 
    
    Federal government spends an additional $18 billion 
    
Variables: 

Criminalized/Decriminalized - Status

Recreational/Medicinal - Medicinal

Illegal (Yes, No) - Illegal 

Per_black - % of a states population that is Black 

**State expenditure attributable to marijuana prohabition

Question: What are the factors that perpetuate the incarceration of Black men on marijuana possession charges?

Purpose: To examine the factors that affect the incarceration rate of Black persons on petty marijuana possession charges. 

Phenomenon we are investigating: The disparity between the incarceration of Black people to that of White people on petty marijuana possession charges. 

Context: Marijuana possession arrests make up the largest portion of total drug arrests in the US. Of those arrested for marijuana possession, Black men make up the largest portion of perpetrators. Though Black people and White people consume marijuana at similar rates, Black people are punished for marijuana usage at a significantly higher rate than their white counterparts. 

Theory and Hypothesis: The purposes of our study is to examine the significant indicators for disparities in the rate of incarceration (by state) for marijuana possession arrests amongst Black and White individuals. We theorize that the status of marijuana criminalization in a state  and a state's expenditure on marijuna prohibition are the most significant indicators when examining disparities in incarceration rates among states. We hope to prove that racial disparities in the rate of incarceration for petty marijuana possession violations are strongly correlated with [or "predicted by"] a states' drug prohibition expenditure and the status of marijuana legalization.   

  Citations in Context:
    
    Edwards, Ezekiel et al (2013) - This ACLU report provides the first comprehensive examination of marijuana possession arrests by race for all 50 states, and their respective counties between 2001 and 2010. This ACLU report provides context for the current state of marijuana violation enforcement by briefly outlining the history of marijuana prohibition and “War on Drugs” era policy. Though the data in this report is dated, the methods used by the researchers to investigate the disparities in marijuana possession arrests inspired how we examined the same phenomenon. 
    
    Bender, Steven (2016) - Steven Bender discusses the life cycle of U.S. marijuana prohibition, and the intersections between recent legalization and user consequences for people of color. Bender outlines how the racialized enforcement of marijuana prohibition laws unfairly targeted persons of color, even when POC communities and White people smoke cannabis at relatively similar rates. The data we've gathered is from 2016, and Bender's discussion of the state of marijuana prohibition 6 years ago provides good context for understanding the impact of state spending. Moreover, Bender discusses the differences between types of marijuana legalization, explaining that legalization is not actualized in the same way in every state. He instead highlights these differences and encourages state legislators to consider different types of legalization, so to reduce current racial disparities in incarceration. 
    
    Zika, Mira et al (2022) - A group of researchers from the University of Sussex, University of Cambridge, Carnegie Mellon University, and the Alan Turing Institute analyzed the racial disparities in the enforcement of marijuana violations in the U.S. The researchers investigated whether marijuana usage and purchasing behaviors could explain the racial composition of offenders. They found that racial disparities in marijuna-violation enforcement increased after legalization, and that this could be explained by an enforcement focus on the visibility of marijuana usage rather than the legality of said usage. The researcher's discussion on the enforcement mechanisms which dictate how POC are arrested on marijuana possession charges adds interesting context for our discussion on expenditure. The researchers claim that the police spend siginficant funds on various methods and resources for enforcing drug prohibition (mariuna prohibition as a subset), and so police behavior can best be  explained by the funds that are allocated towards enforcement. We then surmise that state funding towards marijuna prohibition is a significant indicator for not only police behavior, but for the incarceration of POC. 


Recommendations and Limitations (Data and Methods): For those hoping to replicate the models we've created, and continue our research on racial disparities in marijuana prohibition, we'd recommend greater consideration for differences in marijuana jurisprudence. We focused our study on decriminalization, but "decriminalization" is a blanket term for various enforcement methods states may consider when determining the status of marijuana legalization. Because decriminalization is not uniform across the nation, we'd recommend other researchers to cluster decriminalization (unpack the binary we created) into proper subgroups by similarities. For example: Boston, New York, and New Jersey have all recently  (within the past decade) legalized or decriminalized marijuana. Due to proximity, shared cultures and economics, and relatively fluid political relationships, all three states have implemented similar forms of legalization. However, these forms are starkly different from Colorado's legalization of marijuana, which is more liberal and does not harshly penalize marijuana users or sellers. Even though a state like New Jersey has legalized marijuana, marijuana users in the state are at greater threat of incarceration for their use compared to a marijuana user in Colorado. Had we clustered the different types of marijuana legalization by similarity, then we could have told a more comprehensive story about how marijuana decrminalization impacts racial disparities in incarceration. 

Scatter Plots for (Black incarceration rate vs. )

Line2 <- ggplot(df, aes(x=Possession_Expend, y= Black_Inc_Rate, fill=Possession_Expend)) +  
  geom_line()
Line2 <- Line2 + labs(title = "Line plot of the black incarceration rate vs. possesion arrest expenditure in each state")
Line2

Line3 <- ggplot(df, aes(x=Weed_Prohibition_Bil$, y= Black_Inc_Rate, fill=Weed_Prohibition_Bil$)) +  
  geom_line()
Line3 <- Line3 + labs(title = "Line plot of the black incarceration rate vs. weed prohibition expenditure in each state")
Line3

