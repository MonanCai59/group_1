**********************************************************************
* 			Baseline: data_visualization								  
***********************************************************************
*																	  
*	PURPOSE: Supplementary explanation of descriptive data	  
*																	  
*	OUTLINE: 	PART 1: Distribution analysis
*				PART 2: Temporal & Spatial Patterns
*				PART 3: Comparative analysis

*																	  
*																	  
*	Authors:  	Monan Cai Po-Yuan Lai	
   										  

cd "C:\Users\Administrator\Desktop\EE-Data Report\dataaftercleaning_used_in_merge"
use "data_after_merge.dta", clear
******************************************************
* part 1: distribution analysis
****************************************************
graph box solar_gen wind_gen nuclear_gen, ///
    title("Distribution of Power Generation by Energy Source") ///
    ytitle("Electricity Generation")
graph export "box_distribution.png", replace width(2000)
	
***************************************************
*  Part 2: Temporal & Spatial Patterns
*Time series plots showing evolution of variables over time
**************************************************

collapse (mean) solar_gen wind_gen nuclear_gen, by(year)
twoway ///
    (line solar_gen year) ///
    (line wind_gen year) ///
    (line nuclear_gen year), ///
    title("Trends in Electricity Generation by Energy Source") ///
    xtitle("Year") ///
    ytitle("Average Generation")
	graph export "line_trends.png", replace width(2000)
***************************************************
* Part 3: Comparative analysis
****************************************************
collapse (mean) solar_gen wind_gen nuclear_gen

graph bar solar_gen wind_gen nuclear_gen, ///
    title("Average Electricity Generation by Energy Source")

graph export "bar_average.png", replace width(2000)
