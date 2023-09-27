#opening the fastq file
fastq = open('SRR2012208_1.fastq', 'r')

#opening a new file for fasta output
fasta = open('SRR2012208_1.fasta', 'w')

#initialize counter
line_count = 0

#loop through all lines in the fastq, and add 1 to the counter
for line in fastq:
	line_count += 1

#per set of 4 lines, find the first line
	if line_count % 4 == 1:
		fasta.write('>' + line[1:]) #replaces @ with >
#if the line is 2nd in a set of 4, it'll write the line
	elif line_count % 4 == 2:
	    fasta.write(line)
	
#if the line is the 3rd or 4th, this will ignore them


fastq.close()
fasta.close()