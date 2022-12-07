UUIDFORM=`uuidgen`
echo $UUIDFORM
TARGETHOST=$1

./get_connected_probes.sh $UUIDFORM
split -l800 connected_probe_ids$UUIDFORM.txt
# TODO: Consider using a split name with UUID
# TODO: prioritize list/probes by those fastest to return a result
for f in `ls x*`; do /bin/echo -n "$f : "; ./create_measurement.sh `cat xaa | tr '\n' ',' | sed -e 's/,$//'` `wc -l $f | awk '{print $1}'` $TARGETHOST $UUIDFORM; echo "###"; done

# Cleanup
mkdir $UUIDFORM
mv *$UUIDFORM.* $UUIDFORM/.
mv x* $UUIDFORM/.
