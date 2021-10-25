#!/bin/bash

# using parallel tool to execute samtools in parallel. Converting sam to bam, sorting bam, and indexing bam.
echo -e "Running samtools......."

ls fastq/*_sorted.bam | parallel -j 32 'samtools index {} > {.}.bam.bai'

# creating sorted bam file list
ls -1 fastq/*_sorted.bam > bamfiles.list

# while loop to read in sorted bam files and run bedtools. Count duplicates parameter is applied.
while read file
do
   bedtools multicov -D -bams $file -bed TriTrypDB-46_TcongolenseIL3000_2019.bed > ${file%%_sorted.bam}.counts
done < bamfiles.list


mv fastq/*_sorted.bam bowtie2_samtools_output
mv fastq/*_sorted.bam.bai bowtie2_samtools_output
mv fastq/*.counts bedtools_output

cp gene_count_processing.sh average.awk average.sh bedtools_output; cd bedtools_output

