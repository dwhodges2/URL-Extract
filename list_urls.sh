#!/bin/bash
#

#IFS=$'\n' read -d '' -r -a filelist < ./urllist.txt

fileList=(
files/testfile1.html
files/testfile2.html
)



extractURLs () {
awk -v var=$1 'BEGIN{
RS="</a>"
IGNORECASE=1
}
{
  for(o=1;o<=NF;o++){
    if ( $o ~ /href/){
      gsub(/.*href=\042/,"",$o)
      gsub(/\042.*/,"",$o)
      print var "|" $(o)
    }
  }
}' "$1"  

}




for i in ${fileList[@]}


do 
	extractURLs $i
done 

echo "Done."

