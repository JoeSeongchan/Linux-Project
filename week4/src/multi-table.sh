#!/bin/sh

#multiple
function multiple() {
    local x=$1
    local y=$2
    local result=$(expr $x \* $y)
    echo $result
}

#check whether number of input parameter is 2
if [ $# -ne 2 ]; then
    echo "Number of input parameter should be 2"
    exit -1
fi

rowNum=$1
colNum=$2

#regex pattern
naturalNumberPattern='^[1-9][0-9]*$'

#check whether all input parameters are natural numbers
if ! [[ $rowNum =~ $naturalNumberPattern ]] ||
    ! [[ $colNum =~ $naturalNumberPattern ]]; then
    echo "All input parameters should be natural number."
    exit -1
fi

for ((i = 1; i <= $rowNum; i++)); do
    for ((k = 1; k <= $colNum; k++)); do
        printf "$i*$k=$(multiple $i $k)  "
    done
    echo
done
