#To create LBP-TOP feature storage directory tree.
if [ -d "CKFeatureData" ]
then
	echo "CKFeature have exists."
	exit
else
	echo "is creating CKFeature tree."
	mkdir CKFeatureData
fi
cd CKFeatureData

list="anger contempt disgust fear happy sadness surprise"
for expression in $list
do
	mkdir $expression
	cd $expression
	mkdir ${expression}"_face"
	touch ${expression}"_check.txt" ${expression}"_feature.txt"
	cd -
done
