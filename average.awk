#!/bin/bash

cd bedtools_output

echo -e "Calculating averages for group-wise comparison....."

#averaging the values file for each group using awk script and for loop
for file in *.values;
do
   awk '{FS="\t"; s=0; for (i=1;i<=NF;i++)s+=$i; print s/NF;}' $file > $file.nm
done

#average for group over time and uninduced
awk '{FS="\t"; s=0; for (i=1;i<=NF;i++)s+=$i; print s/NF;}' WT.values.time > WT.values.time.nm
awk '{FS="\t"; s=0; for (i=1;i<=NF;i++)s+=$i; print s/NF;}' C1.values.time > C1.values.time.nm
awk '{FS="\t"; s=0; for (i=1;i<=NF;i++)s+=$i; print s/NF;}' C2.values.time > C2.values.time.nm
awk '{FS="\t"; s=0; for (i=1;i<=NF;i++)s+=$i; print s/NF;}' *.un > uninduced.nm
awk '{FS="\t"; s=0; for (i=1;i<=NF;i++)s+=$i; print s/NF;}' *.in > induced.nm

cd ..
