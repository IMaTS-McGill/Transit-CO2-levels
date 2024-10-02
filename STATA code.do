cls
clear


** Montreal dataset
import delimited "C:\Users\Alejandro\McGill\OneDrive - McGill University\Research\Thesis\IAQ\CO2\Can-Mex\full_data.v1.csv", varnames(1)
 
** Label variable
label variable city "City"
label variable mode2 "Mode"
label variable wo "Windows status"
label variable ac "AC/heating status"
label variable crowd "Crowdedness level"
label variable co2 "CO2 concentration"

label define City 0 "Montreal" 1 "Mexico City" 2 "Puebla"
label values city City
label define Mode 0 "Outside" 1 "BRT" 2 "Bus" 3 "Subway"
label values mode Mode
label define Wo 0 "Outside" 1 "Windows Closed" 2 "Windows opened"
label values wo Wo
label define Ac 0 "Outside" 1 "AC/Heating off" 2 "AC/Heating on"
label values ac Ac
label define Crowd 0 "Outside" 1 "Not crowded" 2 "Semi crowded" 3 "Crowded"
label values crowd Crowd

** Declare data as panel data
xtset trip obs

** Regression Montreal
xtregar lnco2 i.mode2 i.wo i.ac i.crowd if city==0, re rhotype(dw)
 
outreg2 using RegressionCity.doc, replace label bdec(3) sdec(4) title (Determinants of CO2 levels in transit units by city) ctitle (Montreal) addtext (Prob > chi2, 0.0000)

** Regression Mexico
xtregar lnco2 i.mode2 i.wo i.ac i.crowd if city==1, re rhotype(dw)
 
outreg2 using RegressionCity.doc, append label bdec(3) sdec(4) title (Determinants of CO2 levels in transit units by city) ctitle (Mexico City) addtext (Prob > chi2, 0.0001)

** Regression Puebla
xtregar lnco2 i.mode2 i.wo i.ac i.crowd if city==2, re rhotype(dw)
 
outreg2 using RegressionCity.doc, append label bdec(3) sdec(4) title (Determinants of CO2 levels in transit units by city) ctitle (Puebla) addtext (Prob > chi2, 0.0000)
