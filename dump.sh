#!/bin/bash
if [ -d data ]
then
    echo "data dir 存在"
else
    mkdir - p $(pwd)/data && chmod +R 777 $(pwd)/data
    echo '创建 data目录'
fi

host="127.0.0.1"
username="root"
password="123456"
#map_database="qh_data_szstat"
map_database="test1"
map_file="map.txt"

meta_database="qhdata_v2"

dump_str="mysqldump -u$username -p$password --databases "

#map
#echo $dump_str "$map_database --tables "
map_str=$dump_str"$map_database --tables "
tables=""
for table in `sort ./map.txt | uniq`
do
   tables="$tables $table"
done
echo "导出map 文件"

"sudo $map_str $tables > $(pwd)/data/map.sql"


