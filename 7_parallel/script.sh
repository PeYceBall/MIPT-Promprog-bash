while getopts ":n:c:o:" opt; do
  case $opt in
    n) NUM_WORKERS="$OPTARG";;
    c) LINK_COL="$OPTARG";;
    o) OUTPUT="$OPTARG";; 
  esac
done

cat data.csv | tail -n +2 | awk -v link_col=$LINK_COL -F\; '{print $link_col}' | parallel -j $NUM_WORKERS wget -q {} -P $OUTPUT

