**********************************************************************
* 			Baseline: summary statistics table								  
***********************************************************************
*																	  
**# Bookmark #1
*	PURPOSE:  compare nuclear, solar and wind generation through providing comprehensive descriptive statistics						  
*																	  
*	OUTLINE: 	PART 1: table
*																	  
*																	  
*	Authors:  	Monan Cai Po-Yuan Lai	
   										  
***********************************************************************
*                           PART 1: table
***********************************************************************


cd "C:\Users\Administrator\Desktop\EE-Data Report\dataaftercleaning_used_in_merge"
use "data_after_merge.dta", clear
tabstat solar_gen wind_gen nuclear_gen, ///
    statistics(mean median sd min max n) ///
    columns(statistics)
	
estpost tabstat solar_gen wind_gen nuclear_gen, ///
    statistics(mean median sd min max n) ///
    columns(statistics)
	
esttab using "SummaryTable.rtf", replace ///
    cells("mean(fmt(2)) median(fmt(2)) sd(fmt(2)) min(fmt(2)) max(fmt(2)) count(fmt(0))") ///
    noobs nomtitle nonumber label title("summary statistics table")