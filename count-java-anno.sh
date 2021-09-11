#!/bin/bash

javaFiles=`find . -name "*.java"`

random=$RANDOM$RANDOM
tempFile=${random}.tempdata

for i in ${javaFiles}; do
	sed -n '/^\s*@.*/p' "$i" >> ${tempFile}
done 

sed -i 's/ //g' ${javaFiles}
sed -i 's/(.*)//g' ${javaFiles}

cat ${tempFile} | awk '{anno[$1]++} END{for(i in anno){print anno[i],i}}' | sort -nrk 1

rm ${tempFile}
