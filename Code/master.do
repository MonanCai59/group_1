***********************************************************************
* MASTER DO FILE                                
***********************************************************************
* * PURPOSE:    Execute all steps of the EE-Data Report analysis      
* AUTHORS:    Monan Cai, Po-Yuan Lai                                
 
* * SEQUENCE:   1. clean.do (Data Cleaning)                           
* 2. merge.do (Data Merging)                            
* 3. summary_statistics_table .do (Descriptive Stats)   
* 4. data_visualization.do (Graphs)                     
* 5. regress.do (Regression Analysis)                   
* ***********************************************************************

*** 1.  Environment Settings ***
clear all               
macro drop _all          
set more off             
set linesize 120         


global root "C:\Users\Administrator\Desktop\EE-Data Report"
cd "$root"

***********************************************************************
* STEP 1: Data Cleaning
***********************************************************************
display as text "Running Step 1: Cleaning Data (clean.do)..."

do "clean.do" 
***********************************************************************
* STEP 2: Data Merging
***********************************************************************
global root "C:\Users\Administrator\Desktop\EE-Data Report"
cd "$root"
display as text "Running Step 2: Merging Data (merge.do)..."

do "merge.do"

***********************************************************************
* STEP 3: Summary Statistics
***********************************************************************
global root "C:\Users\Administrator\Desktop\EE-Data Report"
cd "$root"
display as text "Running Step 3: Summary Statistics (summary_statistics_table .do)..."

do "summary_statistics_table .do"

***********************************************************************
* STEP 4: Data Visualization
***********************************************************************
global root "C:\Users\Administrator\Desktop\EE-Data Report"
cd "$root"
display as text "Running Step 4: Data Visualization (data_visualization.do)..."

do "data_visualization.do"

***********************************************************************
* STEP 5: Regression Analysis
***********************************************************************
global root "C:\Users\Administrator\Desktop\EE-Data Report"
cd "$root"
display as text "Running Step 5: Regression Analysis (regress.do)..."
 
do "regress.do"

***********************************************************************
* End of Process
***********************************************************************
display as text "All tasks completed successfully."