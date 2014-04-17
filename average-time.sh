SEQ=$1
FILE=$2

for i in `seq 1 $SEQ`; do cat "$FILE"-"$i"; done | grep real | awk "
							{idx_m=index(\$2,\"m\");}
							{idx_dot=index(\$2,\".\");}
							{min=strtonum(substr(\$2,0,idx_m-1));}
							{sec=strtonum(substr(\$2,idx_m+1,idx_dot-idx_m-1));}
							{elapsed=min*60+sec; sum+=elapsed; count++};
							END {print sum/count}"

