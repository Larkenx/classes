from Bio import SeqIO
handle = open("/Users/larken/Desktop/data.fastq", "rU")
for record in SeqIO.parse(handle, "fastq") :
    print(record.seq);
handle.close()
