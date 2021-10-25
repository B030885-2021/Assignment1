#!/bin/bash

echo -e "Processing bedtools gene count data........"

#keep gene name, description and count fields for bedtools output files
#IFS=$'\t'
#for i in *.counts; do
#  cut -d$'\t' -f 4-6 < $i > $i.new
#  mv $i.new $i
#done

#processing gene count data
paste *.Clone1.0.Uninduced.counts | cut -d$'\t' -f 1,2 > Clone1.0.Uninduced.id #pasting specific groups files together, then extracting gene id and name into file
paste *.Clone1.0.Uninduced.counts | cut -d$'\t' -f 3,6,9 > Clone1.0.Uninduced.values # same again, but extracting count fields
#repeat for all groups
paste *.Clone1.24.Uninduced.counts | cut -d$'\t' -f 1,2 > Clone1.24.Uninduced.id
paste *.Clone1.24.Uninduced.counts | cut -d$'\t' -f 3,6,9 > Clone1.24.Uninduced.values
paste *.Clone1.24.Induced.counts | cut -d$'\t' -f 1,2 > Clone1.24.Induced.id
paste *.Clone1.24.Induced.counts | cut -d$'\t' -f 3,6,9 > Clone1.24.Induced.values
paste *.Clone1.48.Uninduced.counts | cut -d$'\t' -f 1,2 > Clone1.48.Uninduced.id
paste *.Clone1.48.Uninduced.counts | cut -d$'\t' -f 3,6,9 > Clone1.48.Uninduced.values
paste *.Clone1.48.Induced.counts | cut -d$'\t' -f 1,2 > Clone1.48.Induced.id
paste *.Clone1.48.Induced.counts | cut -d$'\t' -f 3,6,9 > Clone1.48.Induced.values

paste *.Clone2.0.Uninduced.counts | cut -d$'\t' -f 1,2 > Clone2.0.Uninduced.id
paste *.Clone2.0.Uninduced.counts | cut -d$'\t' -f 3,6,9 > Clone2.0.Uninduced.values
paste *.Clone2.24.Uninduced.counts | cut -d$'\t' -f 1,2 > Clone2.24.Uninduced.id
paste *.Clone2.24.Uninduced.counts | cut -d$'\t' -f 3,6,9 > Clone2.24.Uninduced.values
paste *.Clone2.24.Induced.counts | cut -d$'\t' -f 1,2 > Clone2.24.Induced.id
paste *.Clone2.24.Induced.counts | cut -d$'\t' -f 3,6,9 > Clone2.24.Induced.values
paste *.Clone2.48.Uninduced.counts | cut -d$'\t' -f 1,2 > Clone2.48.Uninduced.id
paste *.Clone2.48.Uninduced.counts | cut -d$'\t' -f 3,6,9 > Clone2.48.Uninduced.values
paste *.Clone2.48.Induced.counts | cut -d$'\t' -f 1,2 > Clone2.48.Induced.id
paste *.Clone2.48.Induced.counts | cut -d$'\t' -f 3,6,9 > Clone2.48.Induced.values

paste *.WT.0.Uninduced.counts | cut -d$'\t' -f 1,2 > WT.0.Uninduced.id
paste *.WT.0.Uninduced.counts | cut -d$'\t' -f 3,6,9 > WT.0.Uninduced.values
paste *.WT.24.Uninduced.counts | cut -d$'\t' -f 1,2 > WT.24.Uninduced.id
paste *.WT.24.Uninduced.counts | cut -d$'\t' -f 3,6,9 > WT.24.Uninduced.values
paste *.WT.24.Induced.counts | cut -d$'\t' -f 1,2 > WT.24.Induced.id
paste *.WT.24.Induced.counts | cut -d$'\t' -f 3,6,9 > WT.24.Induced.values
paste *.WT.48.Uninduced.counts | cut -d$'\t' -f 1,2 > WT.48.Uninduced.id
paste *.WT.48.Uninduced.counts | cut -d$'\t' -f 3,6,9 > WT.48.Uninduced.values
paste *.WT.48.Induced.counts | cut -d$'\t' -f 1,2 > WT.48.Induced.id
paste *.WT.48.Induced.counts | cut -d$'\t' -f 3,6,9 > WT.48.Induced.values

#to get average of each group over time
paste WT.0.Uninduced.values WT.24.Induced.values WT.48.Induced.values > WT.values.time
paste Clone1.0.Uninduced.values Clone1.24.Induced.values Clone1.48.Induced.values > C1.values.time
paste Clone2.0.Uninduced.values Clone2.24.Induced.values Clone2.48.Induced.values > C2.values.time

#to get average of induced and uninduced
paste WT.0.Uninduced.values WT.24.Uninduced.values WT.48.Uninduced.values > WT.values.un
paste Clone1.0.Uninduced.values Clone1.24.Uninduced.values Clone1.48.Uninduced.values > C1.values.time.un
paste Clone2.0.Uninduced.values Clone2.24.Uninduced.values Clone2.48.Uninduced.values > C2.values.time.un
paste WT.24.Induced.values WT.48.Induced.values > WT.values.time.in
paste Clone1.24.Induced.values Clone1.48.Induced.values > C1.values.time.in
paste Clone2.24.Induced.values Clone2.48.Induced.values > C2.values.time.in
