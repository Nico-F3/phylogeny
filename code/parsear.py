from Bio import SeqIO
import csv


ID=[]
i=''
with open('new_by_hand_ID.csv', newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
    for row in spamreader:
        i=', '.join(row)
        ID.append(i)

for record in SeqIO.parse("my_new_by_hand_db.fasta", "fasta"):
    if record.id in ID:
        with open("new_by_hand_blast_matches.fasta", "a") as output_handle:
            SeqIO.write(record, output_handle, "fasta")
        