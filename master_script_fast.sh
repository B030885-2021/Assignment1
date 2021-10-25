!/bin/bash

echo "Running copy_files_script.sh......."
./copy_files_script.sh

echo "Running script_fastqc.sh......"
./script_fastqc.sh

echo "Running bowtie2_script_fast.sh....."
./bowtie2_script_fast.sh

echo "Running sam_bed_tools_script.sh......"
./sam_bed_tools_script.sh

echo "Running gene_count_processing.sh......"
./gene_count_processing.sh

echo "Running average.awk......."
./average.awk

echo "Running average.sh......."
./average.awk

echo -e "FINISHED :D :D :D"
