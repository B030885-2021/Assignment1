#!/bin/bash

echo -e "\n\nRunning fastqc on fastq files....\n\n"

#running fastq program on 64 threads, on all fq files in directory, and extracting content of zip files 
fastqc fastq/*.fq.gz -o fastqc_output -extract -t 64 -q

#remove zip files
rm  -f fastqc_output/*.zip

#concatenated all data.txt files to one output
cat fastqc_output/*fastqc/*summary.txt > all_fastqc_summaries.txt
#mv fastqc_output/*.html html_output

#create variable for summary. Counting all the unique outputs
summaryvariable=$(cut -f1,2 all_fastqc_summaries.txt | sort | uniq -c)


# display summary information and point user to more information regarding fails and warnings.
echo -e "\nFastqc output summary (number represents total fastq files):\n\n$summaryvariable\n\nIf your RNA-Seq fastq files fail the Per base sequence content module, take into account the information on the fastqc website, as the failed module may not adversely affect the downstream analysis: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/3%20Analysis%20Modules/4%20Per%20Base%20Sequence%20Content.html\n"

echo -e "\n\nWarnings for the overrespresented sequences module may indicate the presence of adapter. See https://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/3%20Analysis%20Modules/9%20Overrepresented%20Sequences.html for more details. Cutadapt may be a useful option to remove unwanted sequences https://cutadapt.readthedocs.io/en/stable/\n\n"


# running conditional loop for pass, warn and fail, on combined text file. Outputting sample files onto screen with description and sending pass, fail and warn samples files into text file list.
unset IFS; IFS=$'\t';
while read qc1 qc2 qc3
do
if test $qc1 == "PASS"
then
    echo "Reads for sample $qc3 passed the $qc2 module";
    echo -e "$qc3\t$qc2" >> passed_samples.qc;
elif test $qc1 == "FAIL" 
then
    echo "Reads for sample $qc3 failed the $qc2 module";
    echo -e "$qc3\t$qc2" >> failed_samples.qc;
else
    echo "Reads for sample $qc3 contain a warning for the $qc2 module";
    echo -e "$qc3\t$qc2" >> warning_samples.qc;
fi
done < all_fastqc_summaries.txt

#some informative message for user
echo -e "\n\nSample fastq id and the respective passed module are stored in the passed_samples.qc file\nSample fastq id and the respective failed module are stored in the failed_samples.qc file\nSample fastq id and the respective warned module are stored in the warning_samples.qc file.\n\n"

# some other informative message about html directory if user want to manual inspect
echo -e "\n\nHTML files for visual inspection can be found in the html_output directory.\n\n" 


