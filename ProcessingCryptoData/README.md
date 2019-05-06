# PROCESSING CRYPTO DATA

This section has some sample code to work with data provided from coinmarket cap. The idea is to learn pulling down numerical, statistical and price data then parsing and manipulating fields so that you can use the results to drive your functions - be it automatic trading or building a predictive portfolio.

1. Import the data
2. Summarize the Data
3. Store selected data fields to file  (append)
4. Automate this job - so the file builds up over time.
5. Improve your data metrics - add analytics i.e. median, average, peaks etc.
6. Reporting - graph your data with nice visuals for ease of view.


```

import urllib.request, json 
import json
import datetime as datetime
with urllib.request.urlopen("https://api.coinmarketcap.com/v1/ticker/?convert=GBP") as url:
    data = json.loads(url.read().decode())

    
```

# PREVIEW YOUR DATA

Below is a snapshot of all coins and prices, by iterating first through the list then printing the **value** of the ID key and price key. 

```
for x in range(0, len(data)):# Increment x from 0, to the length of data (our list)
    print("The current coin is : " + str(data[x]['id']) + " the current rate is : " + str(data[x]['price_gbp']))
    
```

You will get something that looks a bit like the following: 

```
The current coin is : bitcoin the current rate is : 5097.61226492
The current coin is : ethereum the current rate is : 235.389443881
The current coin is : ripple the current rate is : 0.2383512517
The current coin is : bitcoin-cash the current rate is : 420.776905816
The current coin is : eos the current rate is : 3.7636120359
The current coin is : stellar the current rate is : 0.1740390529
The current coin is : litecoin the current rate is : 44.5825148608
The current coin is : tether the current rate is : 0.7900547487
The current coin is : cardano the current rate is : 0.0782919181
The current coin is : monero the current rate is : 73.8761611614
The current coin is : ethereum-classic the current rate is : 10.7315777721
```


# Get Date

Our data won't be any use if we can't track the date. Since our data only provides the time 'last updated' which looks to be in a strange format ( I will show you how to crack that later - I only figured it out in my job last week). For now we will capture a date and later write it to a file. Note I had to import a new library for this to work, look at the import statements at the top.

# Pull current date, and format it as year/month/day hour:minutes
datetime.datetime.today().strftime('%Y-%m-%d %H:%M')

# Writing to output file

In this section I will give you the basics on how to write to a file - your next step is to build the fields in the way you want them and learn to first check if the file exists - append data as you write it, or if it doesn't exist create the file.

```
filename = 'output.txt'
f = open(filename,'w')


for x in range(0, len(data)):# Increment x from 0, to the length of data (our list)
    f.write("The current coin is : " + str(data[x]['id']) + " the current rate is : " + str(data[x]['price_gbp']))
    

f.close() 
```

## WHAT TO DO NEXT?

Firstly, note the file that gets made looks a bit rubbish. Its all crushed together. So we want to take a new line at the end of each write. 

1. Change write statement to take new line at the end
2. Change write statement to write out the date (you will need to store datetime above as a variable) 
3. You write statement in total should write last_updated(we will modify this later), date, coin name price gbp and price btc. 
4. Now change your code to append if file exists - so your file will grow.

# END  - FOR NOW 

## ITERATING DICTS THE OFFICIAL WAY (IN PROGRESS/ignore) 

for key, value in data[x].items():
    if key == 'id':
        print(key,value)
        

