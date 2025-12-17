**********************************************************************
* 			Baseline: data_visualization								  
***********************************************************************
*																	  
*	PURPOSE: Supplementary explanation of descriptive data	  
*																	  
*	OUTLINE: 	PART 1: solar_gen regress
*				PART 2: nuclear_gen regress
*				PART 3: wind_gen regress
*																	  
*																	  
*	Authors:  	Monan Cai Po-Yuan Lai	

cd "C:\Users\Administrator\Desktop\EE-Data Report\dataaftercleaning_used_in_merge"
use "data_after_merge.dta",replace
*******************************************************************************
*           PART 1: solar_gen regress
*****************************************************************************
drop nuclear_gen wind_gen

drop if missing( Energy_import ,urban_population, industrial_structure, political_stability, oil_rent, GDP ,solar_gen)

save"data_after_clean_solar.dta" ,replace

xtset code_id year

xtreg solar_gen GDP oil_rent political_stability industrial_structure urban_population Energy_import i.year ,fe 

eststo y1
*******************************************************************************
*           PART 2: nuclear_gen regress
*****************************************************************************
use "data_after_merge.dta", replace

drop solar_gen wind_gen 

drop if missing( Energy_import ,urban_population, industrial_structure, political_stability, oil_rent, GDP ,nuclear_gen)

save"data_after_clean_nuclear.dta" ,replace

xtset code_id year
xtreg nuclear_gen GDP oil_rent political_stability industrial_structure urban_population Energy_import i.year ,fe 

eststo y2
*******************************************************************************
*           PART 3: wind_gen regress
*****************************************************************************
use "data_after_merge.dta", replace

drop solar_gen nuclear_gen 

drop if missing( Energy_import ,urban_population, industrial_structure, political_stability, oil_rent, GDP ,wind_gen)

save"data_after_clean_wind.dta" ,replace

xtset code_id year
xtreg wind_gen GDP oil_rent political_stability industrial_structure urban_population Energy_import i.year ,fe 

eststo y3
********************************************************************************************
* --- Export Table ---
* Export m1 and m2 to MyResult.rtf
* ar2: Display the adjusted R-squared
* se: Display the standard error (this will default to showing the t-value if not specified)
* star: Display the stars (* 0.05 ** 0.01 *** 0.001)
* replace: If the file already exists, overwrite it directly
* b(%9.3f): The coefficients are rounded to 3 decimal places
esttab y1 y2 y3 using "Regression.rtf", replace ///
    ar2 se star(* 0.1 ** 0.05 *** 0.01) ///
    b(%9.3f) se(%9.3f) ///
    title("Table 1: Regression Results")