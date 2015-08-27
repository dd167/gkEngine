cd ../global_task/
source set_global_env.sh

foreachd(){
# 遍历参数1
for file in $1/*
do
# 如果是目录就打印处理，然后继续遍历，递归调用
if [ -d $file ]
then
#echo $file"是目录"
foreachd $file
elif [ -f $file ]
then
#echo $file pvr process
if [ "${file##*.}" = "tga" ];
then
echo $file
#$GKENGINE_HOME/tools/pvrtextool -m -f a8r8g8b8 -shh -i $file -o ${file%.*}.dds
$GKENGINE_HOME/tools/nvcompress -rgb -silent $file ${file%.*}.dds
fi


fi
done
}

foreachd "$GKENGINE_HOME/engine/assets"

#   	%GKENGINE_HOME%\tools\pvrtextool -m -fOGL8888 -yflip0 -square -silent -i %%~fA
