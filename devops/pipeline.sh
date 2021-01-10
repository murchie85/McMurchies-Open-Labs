
# let the user know automation has begun
echo 'starting job'  
  
# Create a staging directory 
mkdir stagingTemp  
  
# copy artefacts to intrim folder
cp development/* stagingTemp  
cp tests/* stagingTemp   
  
# run tests   
cd stagingTemp  
python testprogram.py


echo 'job complete'

echo 'packaging budling artefacts'
zip -r zaraApp-1.0.1.zip .

echo 'deploying'
cp zaraApp-1.0.1.zip ../production


echo 'deleting staging folder'
rm -rf stagingTemp

echo 'Zara application deployed succesfully - version changes can be found .... operation teams please begin your checks ....'
# blah 


