# CRYPTOCURRENCY PROCESSING CHALLENGE


CHALLENGE1-CRYPTO | [CHALLENGE-2-TROLL_BOT](LAB2-TROLL/README.md) | [Home](../README.md) 

![alt text](https://news.yale.edu/sites/default/files/styles/featured_media/public/cryptocurrency-aleh-tsyvinski-ynews.jpeg?itok=3Wm2RTst&c=07307e7d6a991172b9f808eb83b18804)

# CHALLENGE GUIDELINES

Note this is not a lab, so there will not be step by step instructions rather a list of guidelines and target objectives to try and reach. Some key points to consider when working through this challenge 

* Improvise - my steps are just a set of guidelines, if you find a better way or another way that works for you then stick with that. 
* Try to keep this a learning process, rather than sticking to only the steps you know.
* Remember to make use of key learning resources such as [StackOverflow](https://stackoverflow.com/)
    
    

# CHALLENGE OUTLINE


The aim of this challenge is to make use of a cryptocurrency site, and utilize their metrics so that you can build your own reporting and alerting app. This will help you know when to buy and sell crypto currencies or at least keep on top of the action. 

![alt text](https://blog.digitexfutures.com/wp-content/uploads/2018/05/CoinMarketCap.png)

## OUTLINE 

1. FIRST have a look at [CoinMarketCap](https://coinmarketcap.com/) get a feel for what the site does.
2. **BONUS POINTS** if you can find documentation on their API, its important you have a look at this even if to get a feel for what it may/may not do.
3. Understand what JSON is, do not spend too much time on this but most APIs deal with passing information in JSON format, so its worth getting used to that format. Google sample JSON to have a look.
4. Work with the following URL to download data on all coins and their GBP values [CoinMarketCapAPI](https://api.coinmarketcap.com/v1/ticker/?convert=GBP) 
5. Build your first python job to pull that URL and convert to CSV. The easiest way to do this is to google for the answer, I have given you a start below - it prints to screen but now you need to figure out how to save this to csv:

   
```

import urllib.request, json 
with urllib.request.urlopen("MYURL") as url:
    data = json.loads(url.read().decode())
    print(data)

```
   


6. Now comes the hard work - parse the data. Its best to start googling 'how to parse json with python'. High level you will want to work with the data like the step above, but pass it into an array or dictionary that you can iterate (loop through). And pull out information you want into variables to work with. What you want to aim for is an orgnised way you can work with the data, such as 'pull all GBP values for all coins' or 'only pull gbp values for certain coins'. This will involve you either looking into arrays or dictionaries. Personally I prefer working with arrays they are more simple.
7. Now you know how to work your data - run the save to csv job - but now in a structured way that you can your python code can read that csv at a later date. 
8. Automate your python script so it saves to csv file every hour. Each hour it must overwrite your CSV file with the new data **BUT** it must include metrics for data changes. I.e. if BTC was 5000 but now is 5001 add a change column to say +1. The target is to track how your data changes each hour. 
9. Automate a python script to append metrics every hour to a 'HISTORY.CSV' file. Unlike the last file, this one will grow. You will need to look into how to append data to a file with Python. **NOW** we can start automating trades or predicting prices.
10. Add a column to your History file 'average rate', 'peak rate', 'min rate' etc. With these values appended each time, you can build another python program to monitor the current rate via the API call you did above, but also keep track of the average rate (by reading from the HISTORY.CSV file).
11. Build a Python Email alert to send you an email if any of the coins reach within 10% of their minimum or maximum value.



## ROUNDUP


I definitely don't expect you to be able to follow all the steps above or produce programs that run exactly as prescribed above. More the steps above is to get you thinking in the right process for building the layers in order to learn key features for building an API and a sophisticate service.   

If you were however to make it this far, then a huge congratulations and a stretch goal will be added in a couple of days. For now, you want to be thinking about how you can use your historical data to automate microtransactions so that your bot can trade on your behalf making you a small amount of money but also keeping you in a safetynet. 

