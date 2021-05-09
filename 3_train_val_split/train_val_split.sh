INPUT_PATH=$2
TRAIN_RATIO=$4

HEADER=$(cat $INPUT_PATH | head -n 1)
echo $HEADER > train
echo $HEADER > val
NUM_LINES=$(cat $INPUT_PATH | wc -l)
cat $INPUT_PATH | tail -n +2  | awk 'BEGIN{srand();}{print rand()"\t"$0}' | sort -k1n | cut -f2 | awk -v lines=$NUM_LINES -v ratio=$TRAIN_RATIO '{if(NR < ratio * lines ) {print >> "train"} else {print >> "val"}}' 
