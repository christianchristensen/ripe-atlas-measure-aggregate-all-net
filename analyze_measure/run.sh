UUID=$1
./get_result_ids.sh $UUID > result_ids.txt
echo "created_timestamp,is_error,error_message,total_hops,last_median_rtt,last_hop_responded,is_success,probe_id" > $UUID.csv
for rid in `cat result_ids.txt`; do echo $rid; ./get_results.sh $rid; ./transform_results_to_csv.sh $rid; cat $rid.ripe.csv >> $UUID.csv; done

# Cleanup
mkdir ${UUID}_a
mv *.ripe.* ${UUID}_a/.
mv $UUID.csv ${UUID}_a/.
