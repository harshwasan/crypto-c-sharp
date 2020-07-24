# crypto-c-sharp

We created a web application to display realtime exchange data with user wallet portfolio management system as well as used machine learning to 
display predicted values to make it easier to decide when to sell or buy.
Also created a seperate service to store api data for ml operations and also compare the real time price of the crypto currencies with the cost at which the users bought
and notify them using dynamically generated mail if there is a possiblity of the users incurring a loss.
Used sql server and stored procedures for database and mljr for ml.

<h4>Changes</h4>
1)Shifted node project to c# .net webforms.

2)Added user login system.

3)Added user portfolio management system with crud operations.

4)Added crypto coin profile pages with history and graphs as well as user stock of particular coin.

5)Used api calls to display real time cryptocurrency data and used mljr to implement regression and recieve predictions about the data.

6)Displayed predictions on currency profile page.

<h4>Corrections limitations and bugs</h4>
1) need to integrate ml prediction process into the site itself.
2)need to provide forecasted value of crypto assets everyday.
3) allow support for crypto wallets and directly import data of users coin from there.
