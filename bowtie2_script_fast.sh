#!/bin/bash

echo -e "\nBuilding bowtie2 database.......\n"

# Building bowtie2 index/database using multiple threads. If the build is successful, an appropiate message will be echoed
bowtie2-build -f Tcongo_genome/TriTrypDB-46_TcongolenseIL3000_2019_Genome.fasta.gz Tcongo_db --threads 64 -q && echo -e "\nBowtie2 database successfully built\n"

# for loop iterating over paired fastq files, then running bowtie2 to map reads against reference genome using multiple threads for speed. 
# non-trimmed reads have adapter sequences present, therefore we use --sensitive-local parameter so we don't include the whole read (end-to-end) in the mapping.
# piping sam files in samtools, converting them into bam files, sorting them and then removing bulky sam files.
for i1 in fastq/*_1.fq.gz
do
  i2=`echo $i1 | sed 's/_1/_2/'`
  bowtie2 -p 64 -x Tcongo_db -1 $i1 -2 $i2 --very-fast-local | samtools sort -o ${i1%%_1.fq.gz}_sorted.bam -
done

