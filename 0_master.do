* =================================================
* 0_master.do - Master Control File (Project: group_1)
* =================================================

* 1. Initialize Environment
clear all  // Clear memory
macro drop _all  //Drop all previous macros
set more off   //Disable pagination to run continuousily

* =================================================
* 2. Set project path
global root "/Users/Administrator/Desktop/group_1"
* -------------------------------------------------

*3.Define Sub-folder Shortcuts
global raw    "$root/data/raw"
global inter  "$root/data/intermediate"
global final  "$root/data/final"
global do     "$root/scripts"
global out    "$root/results"

* 4. Create Folders Automatically
* "cap mkdir" captures the error if the folder already exists
cap mkdir "$root/data/intermediate"
cap mkdir "$root/data/final"
cap mkdir "$root/results"

* -------------------------------------------------
* 5. Execute Sub-routines in Order
* -------------------------------------------------
do "$do/1_import.do"
do "$do/2_clean.do"
do "$do/3_merge.do"
do "$do/4_correct.do"
do "$do/5_generate.do"
do "$do/6_regress.do"

* End of execution message
display"End of group_1"
