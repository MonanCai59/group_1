**********************************************************************
* 			Baseline: Clean data								  
***********************************************************************
*																	  
*	PURPOSE: 	clean all the data set, delete unnessecary data, reshape						  
*																	  
*	OUTLINE: 	PART 1: control variable 1：Energy import	 	  
*				PART 2: control variable 2:	Oil rent 
*				PART 3: control variable 3: Political stability
*				PART 4: control variable 4:	Urban population
*				PART 5: control variable 5: Industrial structure
*				PART 6: Core independent variable: GDP
*               PART 7: dependent variable 1: nuclear generation
*				PART 8: dependent variable 2: solar generation
*				PART 9: dependent variable 3: wind generation
*																	  
*																	  
*	Authors:  	Monan Cai Po-Yuan Lai	
***********************************************************************
*				Part 1: control variable 1：Energy import
***********************************************************************

cd "C:\Users\Administrator\Desktop\EE-Data Report\Raw"
import delimited "Control variable\API_EG.IMP.CONS.ZS_DS2_en_csv_v2_110333.csv",varnames(3) clear

drop v3 v4 v5-v58 v70 v69

* 1  First, rename the fixed variables in the first few columns to facilitate subsequent processing.
rename lastupdateddate country_name
rename v2 country_code

* 2. Batch rename the year column
foreach v of varlist v59-v68 {  
    local year_label = `v'[1]    
    
    * Check if the year has been retrieved. If it has, rename it.
    if "`year_label'" != "" {
        rename `v' yr`year_label'   
    }
}

* 3. Delete the first row (as it is now an unnecessary header)
drop in 1


* reshape long [new variable prefix], i([unique identification ID]), j([new generated time variable name])

reshape long yr, i(country_code) j(year)

* At this point, the "yr" variable contains a numerical value, while the "year" variable contains the year.
* We can rename the "yr" variable to the desired one.
rename yr value

* Delete rows with empty values
drop if value == .

* Sort the data to make it look more organized.
sort country_code year

rename value energy_import

save "Energy_import.dta",replace

***********************************************************************
*				Part 2: control variable 2:oil rent
***********************************************************************
import delimited "Control variable\API_NY.GDP.PETR.RT.ZS_DS2_en_csv_v2_111202",varnames(3) clear

drop v3 v4 v5-v58 v70 v69

 *1 First, rename the fixed variables in the first few columns to facilitate subsequent processing.
rename lastupdateddate country_name
rename v2 country_code

* 2. Batch rename the year column
foreach v of varlist v59-v68 {   
    local year_label = `v'[1]   
    
    * Check if the year has been retrieved. If it has, rename it.
    if "`year_label'" != "" {
        rename `v' yr`year_label'   
    }
}

* 3. Delete the first row (as it is now an unnecessary header)
drop in 1


* reshape long [new variable prefix], i([unique identification ID]), j([new generated time variable name])

reshape long yr, i(country_code) j(year)

* At this point, the "yr" variable contains a numerical value, while the "year" variable contains the year.
* We can rename the "yr" variable to the desired one.
rename yr oil_rent

* Delete rows with empty values
drop if oil_rent == .

* Sort the data to make it look more organized.
sort country_code year

save "oil_rent.dta",replace

***********************************************************************
*				Part 3: control variable 3: political stability
***********************************************************************
import delimited "Control variable\API_PV.EST_DS2_en_csv_v2_110488",varnames(3) clear

drop v3 v4 v5-v58 v70 v69

*1 First, rename the fixed variables in the first few columns to facilitate subsequent processing.
rename lastupdateddate country_name
rename v2 country_code

* 2. Batch rename the year column
foreach v of varlist v59-v68 {   
    local year_label = `v'[1]   
    
    * Check if the year has been retrieved. If it has, rename it.
    if "`year_label'" != "" {
        rename `v' yr`year_label'   
    }
}

* 3. Delete the first row (as it is now an unnecessary header)
drop in 1


* reshape long [new variable prefix], i([unique identification ID]), j([new generated time variable name])

reshape long yr, i(country_code) j(year)

* At this point, the "yr" variable contains a numerical value, while the "year" variable contains the year.
* We can rename the "yr" variable to the desired one.
rename yr political_stability

* Delete rows with empty values
drop if political_stability == .

* Sort the data to make it look more organized.
sort country_code year

save "political_stability.dta", replace

***********************************************************************
*				Part 4: control variable 4: urban population
***********************************************************************
import delimited "Control variable\API_SP.URB.TOTL.IN.ZS_DS2_zh_csv_v2_7889",varnames(3) clear

drop v3 v4 v5-v58 v70 v69

*1 First, rename the fixed variables in the first few columns to facilitate subsequent processing.
rename lastupdateddate country_name
rename v2 country_code

* 2. Batch rename the year column
foreach v of varlist v59-v68 {   
    local year_label = `v'[1]   
    
    * Check if the year has been retrieved. If it has, rename it.
    if "`year_label'" != "" {
        rename `v' yr`year_label'   
    }
}

* 3. Delete the first row (as it is now an unnecessary header)
drop in 1


* reshape long [new variable prefix], i([unique identification ID]), j([new generated time variable name])

reshape long yr, i(country_code) j(year)

* At this point, the "yr" variable contains a numerical value, while the "year" variable contains the year.
* We can rename the "yr" variable to the desired one.
rename yr urban_population

* Delete rows with empty values
drop if urban_population == .

* Sort the data to make it look more organized.
sort country_code year

save " urban_population.dta",replace

***********************************************************************
*				Part 5: control variable 5: industrial structure
***********************************************************************
import delimited "Control variable\API_NV.IND.TOTL.ZS_DS2_en_csv_v2_110701.csv",varnames(3) clear

drop v3 v4 v5-v58 v70 v69

*1 First, rename the fixed variables in the first few columns to facilitate subsequent processing.
rename lastupdateddate country_name
rename v2 country_code

* 2. Batch rename the year column
foreach v of varlist v59-v68 {   
    local year_label = `v'[1]   
    
    * Check if the year has been retrieved. If it has, rename it.
    if "`year_label'" != "" {
        rename `v' yr`year_label'  
    }
}

* 3. Delete the first row (as it is now an unnecessary header)
drop in 1


* reshape long [new variable prefix], i([unique identification ID]), j([new generated time variable name])

reshape long yr, i(country_code) j(year)

* At this point, the "yr" variable contains a numerical value, while the "year" variable contains the year.
* We can rename the "yr" variable to the desired one.
rename yr industrial_structure

* Delete rows with empty values
drop if industrial_structure == .

* Sort the data to make it look more organized.
sort country_code year

save "industrial_structure.dta",replace

***********************************************************************
*				Part 6: Core independent variable: GDP
***********************************************************************
import delimited "Core independent variable\API_NY.GDP.PCAP.KD_DS2_zh_csv_v2_111244",varnames(3) clear

drop v3 v4 v5-v58 v70 v69

*1 First, rename the fixed variables in the first few columns to facilitate subsequent processing.
rename lastupdateddate country_name
rename v2 country_code

* 2. Batch rename the year column
foreach v of varlist v59-v68 {   
    local year_label = `v'[1]   
    
    * Check if the year has been retrieved. If it has, rename it.
    if "`year_label'" != "" {
        rename `v' yr`year_label'   
    }
}

* 3. Delete the first row (as it is now an unnecessary header)
drop in 1


* reshape long [new variable prefix], i([unique identification ID]), j([new generated time variable name])

reshape long yr, i(country_code) j(year)

* At this point, the "yr" variable contains a numerical value, while the "year" variable contains the year.
* We can rename the "yr" variable to the desired one.
rename yr GDP

* Delete rows with empty values
drop if GDP == .

* Sort the data to make it look more organized.
sort country_code year

save "GDP.dta", replace

***********************************************************************
*            PART 7: dependent variable 1: nuclear generation
***********************************************************************

* cellrange(A3) indicates that data is read from the 3rd row of the A column.
* firstrow represents the first row of the reading range (i.e., the 3rd row of the original file) and is used as the variable name.

import excel "Dependent variable\Nuclear generation.xlsx", sheet("Sheet1") firstrow cellrange(A2) clear
drop B-AX BI-Share


*1 First, rename the fixed variables in the first few columns to facilitate subsequent processing.
rename A country_name

* 2. Batch rename the year column
foreach v of varlist AY-BH {   
    local year_label = `v'[1]   
    
    * Check if the year has been retrieved. If it has, rename it.
    if "`year_label'" != "" {
        rename `v' yr`year_label'   
    }
}

* 3. Delete the first row (as it is now an unnecessary header)
drop in 1


* reshape long [new variable prefix], i([unique identification ID]), j([new generated time variable name])
encode country_name, gen(name_id)

drop if name_id ==.

* if (strpos(strtolower($variable_name), "search_term") > 0) { ... }
drop if strpos(lower(country_name), "total") > 0
drop if strpos(lower(country_name), "other") > 0
drop in 85/93
drop name_id

reshape long yr, i(country_name) j(year)

* At this point, the "yr" variable contains a numerical value, while the "year" variable contains the year.
* We can rename the "yr" variable to the desired one.
rename yr nuclear_gen

* Delete rows with empty values
drop if nuclear_gen == 0

save "nuclear_gen.dta",replace

***********************************************************************
*               PART 8: dependent variable 2: solar generation
***********************************************************************
* cellrange(A3) indicates that data is read from the 3rd row of the A column.
* firstrow represents the first row of the reading range (i.e., the 3rd row of the original file) and is used as the variable name.

import excel "Dependent variable\Solar generation.xlsx", sheet("Sheet1") firstrow cellrange(A2) clear
drop B-AX BI-Share


*1 First, rename the fixed variables in the first few columns to facilitate subsequent processing.
rename A country_name

* 2. Batch rename the year column
foreach v of varlist AY-BH {   
    local year_label = `v'[1]    
    
    * Check if the year has been retrieved. If it has, rename it.
    if "`year_label'" != "" {
        rename `v' yr`year_label'   
    }
}

* 3. Delete the first row (as it is now an unnecessary header)
drop in 1


* reshape long [new variable prefix], i([unique identification ID]), j([new generated time variable name])
encode country_name, gen(name_id)
//drop country_name
drop if name_id ==.

* Syntax: if (strpos(strtolower($variable_name), "search_term") > 0) { ... }
drop if strpos(lower(country_name), "total") > 0
drop if strpos(lower(country_name), "other") > 0
drop in 85/93
drop name_id

reshape long yr, i(country_name) j(year)

* At this point, the "yr" variable contains a numerical value, while the "year" variable contains the year.
* We can rename the "yr" variable to the desired one.
rename yr solar_gen

* Delete rows with empty values
drop if solar_gen == 0

save "solar_gen.dta",replace

***********************************************************************
*               PART 9: dependent variable 2: wind generation
***********************************************************************
* cellrange(A3) indicates that data is read from the 3rd row of the A column.
* firstrow represents the first row of the reading range (i.e., the 3rd row of the original file) and is used as the variable name.

import excel "Dependent variable\Wind generation.xlsx", sheet("Sheet1") firstrow cellrange(A2) clear
drop B-AX BI-Share


*1 First, rename the fixed variables in the first few columns to facilitate subsequent processing.
rename A country_name

* 2. Batch rename the year column
foreach v of varlist AY-BH {    
    local year_label = `v'[1]   
    
    * Check if the year has been retrieved. If it has, rename it.
    if "`year_label'" != "" {
        rename `v' yr`year_label'   
    }
}

* 3. Delete the first row (as it is now an unnecessary header)
drop in 1



* reshape long [new variable prefix], i([unique identification ID]), j([new generated time variable name])
encode country_name, gen(name_id)
//drop country_name
drop if name_id ==.

* Syntax: if (strpos(strtolower($variable_name), "search_term") > 0) { ... }
drop if strpos(lower(country_name), "total") > 0
drop if strpos(lower(country_name), "other") > 0
drop in 85/93
drop name_id

reshape long yr, i(country_name) j(year)

* At this point, the "yr" variable contains a numerical value, while the "year" variable contains the year.
* We can rename the "yr" variable to the desired one.
rename yr wind_gen

* Delete rows with empty values
drop if wind_gen == 0

save "wind_gen.dta",replace