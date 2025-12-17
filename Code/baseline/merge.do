**********************************************************************
* 			Baseline: merge data								  
***********************************************************************
*																	  
*	PURPOSE: combine all the data set into one table							  
*																	  
*	OUTLINE: 	PART 1: merge GDP  
*				PART 2: merge industrial_structur with previous data
*				PART 3: merge urban_population with previous data
*				PART 4: merge political_stability with previous data
*				PART 5: merge oil_rent with previous data
*				PART 6: merge Energy_import	with previous data
*				PART 7: merge solar,nuclear,wind_gen with previous data
*																	  
*																	  
*	Authors:  	Monan Cai Po-Yuan Lai	
   										  
***********************************************************************
* 	PART 1: 	merge GDP  		  
***********************************************************************

cd "C:\Users\Administrator\Desktop\EE-Data Report\dataaftercleaning_used_in_merge"
use "GDP.dta",replace
sort country_name year
duplicates report country_name year
duplicates drop country_name year, force
save "GDP.dta",replace

use "Energy_import.dta",replace
sort country_name year
merge 1:1 country_code year using "GDP.dta"
drop _merge
save "data_after_merge.dta",replace

***********************************************************************
* 	PART 2: 	merge industrial_structure with previous data		  
***********************************************************************
use "industrial_structure.dta",replace
sort country_name year
duplicates report country_name year
duplicates drop country_name year, force
save "industrial_structure.dta",replace
clear

use "data_after_merge.dta",replace
sort country_name year
merge 1:1 country_code year using "industrial_structure.dta"
drop _merge
save "data_after_merge.dta",replace

***********************************************************************
* 	PART 3: 	merge urban_population with previous data		  
***********************************************************************
use "urban_population.dta",replace
sort country_name year
duplicates report country_name year
duplicates drop country_name year, force
save "urban_population.dta",replace

use "data_after_merge.dta",replace
sort country_name year
merge 1:1 country_code year using "urban_population.dta"
drop _merge
save "data_after_merge.dta",replace

***********************************************************************
* 	PART 4: 	merge political_stability with previous data		  
***********************************************************************

use"political_stability.dta",replace
sort country_name year
duplicates report country_name year
duplicates drop country_name year, force
save "political_stability.dta",replace


use "data_after_merge.dta",replace
sort country_name year
merge 1:1 country_code year using "political_stability.dta"
drop _merge
save "data_after_merge.dta",replace

***********************************************************************
* 	PART 5: 	merge oil_rent with previous data		  
***********************************************************************

use "oil_rent.dta",replace
sort country_name year
duplicates report country_name year
duplicates drop country_name year, force
save "oil_rent.dta.dta",replace

use "data_after_merge.dta",replace
sort country_name year
merge 1:1 country_code year using "oil_rent.dta"
drop _merge
save "data_after_merge.dta",replace

***********************************************************************
* 	PART 6: 	merge Energy_import	with previous data	  
***********************************************************************

use "Energy_import.dta",replace
use "data_after_merge.dta",replace
sort country_code year
drop country_name
merge 1:1 country_code year using "Energy_import.dta"
drop _merge
save "data_after_merge.dta",replace
***********************************************************************
* 	PART 7: 	merge solar,nuclear,wind_gen with previous data		  
***********************************************************************
use "data_after_merge.dta",replace

sort country_name year

merge 1:1 country_name year using "solar_gen.dta"

drop _merge

merge 1:1 country_name year using "nuclear_gen.dta"
drop _merge

merge 1:1 country_name year using "wind_gen.dta"
drop _merge
save "data_after_merge.dta",replace
*********************************************************************************************






