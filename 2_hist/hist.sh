case $3 in 

"survival" ) c=2 ;;
"pclass" ) c=3 ;;
"age" ) c=7 ;;
"embarked" ) c=13 ;;
esac


tail -n +2 $1 | awk -F, -v c=$c '{count[$c]++} END {for (word in count) print word, count[word]}'