SEQ=$1
BEGIN=$2
END=$3

for i in `seq 1 $SEQ`; do paste "$BEGIN"-"$i" "$END"-"$i" | awk "
							{v1=strtonum(\$2)}
							{v2=strtonum(\$4)}
							{print \$1 \" \" v2-v1}" > tmp-vmstat-$i;
							done;
find ./ -name "tmp-vmstat-*" | xargs -n $SEQ paste | awk -v seq=$SEQ '
						{sum=0; for(i=0;i<seq;i++) sum+=strtonum($(i*2+2));}
						{print $1 " " int(sum/seq);}'
find ./ -name "tmp-vmstat-*" | xargs rm
