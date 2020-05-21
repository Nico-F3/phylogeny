for filename in ./*.gbk
do
python3 from_gbk_to_faa.py "${filename}" "${filename%.*}.faa"
done

cat *.faa > my_new_by_hand_db.faa

./makeblastdb -in my_new_by_hand_db.faa -dbtype prot -out my_new_by_hand_db 

./blastp -query bcna.fasta -db my_new_by_hand_db -out BLAST_new__by_hand_output.tab -evalue 1e-10 -outfmt '6 qseqid qstart qend sseqid slen sstart send bitscore pident evalue'

awk '{print $4}' BLAST_new__by_hand_output.tab > new_by_hand_ID.csv 