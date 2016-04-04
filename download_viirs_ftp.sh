#!/bin/bash

# --- read arguments
args=("$@")
year=${args[0]}
doy_s=${args[1]}
hour_s=${args[2]}
path=${args[3]}

# --- calculate month, day, number of hours per this day
month_s=$(date -d "01/01/${year} +${doy_s} days -1 day" "+%m")
day_s=$(date -d "01/01/${year} +${doy_s} days -1 day" "+%d")

# --- construct search string
srch_str="_npp_d${year}${month_s}${day_s}_t${hour_s}"

# --- go to level1b folder
cd $path

# --- download from ftp
ftp -in snpp.ssec.wisc.edu << SCRIPTEND
user anonymous denis.botambekov@ssec.wisc.edu
binary
cd ingest/viirs/npp/${year}/${doy_s}/GMTCO/
mget GMTCO${srch_str}*
cd ../GDNBO/
mget GDNBO${srch_str}*
cd ../SVDNB/
mget SVDNB${srch_str}*
cd ../SVM01/
mget SVM01${srch_str}*
cd ../SVM02/
mget SVM02${srch_str}*
cd ../SVM03/
mget SVM03${srch_str}*
cd ../SVM04/
mget SVM04${srch_str}*
cd ../SVM05/
mget SVM05${srch_str}*
cd ../SVM06/
mget SVM06${srch_str}*
cd ../SVM07/
mget SVM07${srch_str}*
cd ../SVM08/
mget SVM08${srch_str}*
cd ../SVM09/
mget SVM09${srch_str}*
cd ../SVM10/
mget SVM10${srch_str}*
cd ../SVM11/
mget SVM11${srch_str}*
cd ../SVM12/
mget SVM12${srch_str}*
cd ../SVM13/
mget SVM13${srch_str}*
cd ../SVM14/
mget SVM14${srch_str}*
cd ../SVM15/
mget SVM15${srch_str}*
cd ../SVM16/
mget SVM16${srch_str}*
cd ../IICMO/
mget IICMO${srch_str}*
SCRIPTEND




