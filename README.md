# 2022_Real_Estate_Sales_Data_Analysis
Data Analysis of an "Unnamed" (For legal purposes) Real Estate Office 2022 Sales Data

```The goal of this project is to analyze the performance of the office and its individual agents```
```Skills to be Demonstrated: Advanced Excel, R, PowerBI, Data Viz, etc.

**1. Understanding the Data**
- 
- Brief introduction to our data:
  - Transaction Type: The Type of Transaction that proceeded
  - Listing ID: Unique number associated to the listing before it was sold 
  - Sale ID: Unique number associated to the sale
  - Escrow #: Unique number associated to the Escrow deposit as well as the amount
  - Address: Full address of the sold property
  - City: City the property was sold
  - State: The State the property was sold
  - Zip: The zip code of the property
  - Acceptance Date: The date of contract acceptance, officializing the sale 
  - Sale Price: Price the property was sold
  - Agent: The office agent representing the sale 
  - Other Agent: The agent representing the opposite side of the transaction
  - Last Name: Last name of the other agent
  - Company: Company the other agent is representing 
  - Seller: Last name of the seller of the property
  - Buyer: Last name of the buyer of the property

**2. Cleaning/Preparing data** 'Excel'
-
- Removing Confiential Data:
  - Instances that contained Buyer/Seller Names, Escrow Deposits, etc.
- Removing Junk Data
  - Attributes that provided no value to the dataset, misc. Companies, Escrow ID, Listing ID, Other Agents, etc. 
- Creating New Attributes for Analysis via Insights:
  - Sale ID => Type of sale
    - ```=IF(ISNUMBER(SEARCH("R",B2)),"Rental", IF(ISNUMBER(SEARCH("M",B2)),"Commercial","Residential"))```
  - Address => City, State, Zip
    - ```Text to Columns: Deliminated by "," and " "```
- Optimizing Old Attributes:
  - Sale ID: String Data => Numerical Data
    - ```=Left(5) eg. "22032R" => "22032"```
       



**3. Extracting Insights/Basic Analysis** 'R'
-
```All code available via the Script, all visualization in the section done in R```
- Find the total count of each sale type:
  - Allows us to gauge what type of sale is most prominent within the office, using a pie chart written in R, we can visualize just how prominent "Residential" sales are within our office.
  -  ![image](https://github.com/mkowalczyk0/Real-Estate-Sales-Analysis-Proj/assets/151803531/05d529b1-3066-4ad8-b7a1-8bb004d08841)

- Find the total sale volume by each agent:
  - This metric will allow us to see the total volume of sales done by each agent comparitivly.
    - The volume done by Luxe is over double the total combined volume of other agents.
  - ![image](https://github.com/mkowalczyk0/Real-Estate-Sales-Analysis-Proj/assets/151803531/0f015aa4-09c4-448a-a50e-c672238e07f1)


- Create new column to estimate the commission earned off each sale:
  - With an average sale commission of 2% - 2.5%, for this dataset 2%, we can surmise the commission each sold property will generate, thereby allowing us to gauge the top earning agents in the office

- Count of sales + Sale Volume by city & Average sale price by city
  - These tables allows us to see the number of sales made in each city alongside the total volume and average. These insights can allow agents to make data driven decisions on potential marketing campaigns, home appraisals, and more.





**4. Deeper Dive**
-
```After doing a more superficial analysis, we want to dive deeper into the dataset, in this case, analyzing the highest selling city```

- First we want to graphically identitify the best selling city by volume.
  - With 130 Sales in 2022, Lemont comes in at total sale volume of $65,168,637
    - ![image](https://github.com/mkowalczyk0/Real-Estate-Sales-Analysis-Proj/assets/151803531/abf30545-0e04-4d7e-b426-2d8efac50b5e)

```After understanding how much we sell in Lemont, lets look deeper into Lemont Sales Data```

- Lets Filter all our data to display Lemont in order to see to which agents are Dominating the Lemont Area:
  - After Viewing:
    - We can see that almost 70% of all Lemont sales are done by Luxe
      - ![image](https://github.com/mkowalczyk0/Real-Estate-Sales-Analysis-Proj/assets/151803531/e021b1a8-eb72-46b5-a50b-11d7321f4be0)     

```Lastly we want to see the distribution of the sale price in Lemont```

- First we want to sort the sales into different price groups <=100k, <=200k, <= 300k, <=400k...
  - After doing so, we get a new column named "PriceGroups" which help us categorize our sales
    - ![image](https://github.com/mkowalczyk0/Real-Estate-Sales-Analysis-Proj/assets/151803531/12ef80f2-1298-44b6-856c-16f87e570d8b)

- Finally lets visulaize the groups using a histogram:
  - From the distribution, we can conclude the most frequent home prices sold in Lemont were from $300,000 - $700,000. Agents, property investors, first time homeowners, can utalize this distribution to make data driven decisions when considering purchasing a home, purchasing land, finding new clients, etc.
  - ![image](https://github.com/mkowalczyk0/Real-Estate-Sales-Analysis-Proj/assets/151803531/86f54988-e574-4c22-a0ba-b30bded63546)


```Quick Summary```
By employing R, we gained valuable perspectives on the distribution and performance within this office. The creation of a commission estimate column allowed us to further assess the potential earnings of each agent. Additionally, our examination of sales counts, sale volumes, and average sale prices by city provided a comprehensive overview, aiding in strategic decision-making for marketing and client engagement. Moving on to the deeper dive section, our focus on Lemont uncovered significant insights. With graphical representation, we identified Lemont as a high-performing city, particularly dominated by Luxe with a substantial market share. Further analysis of sale price distribution in Lemont, presented through a histogram, highlighted the most common price range, offering strategic guidance for various stakeholders in the real estate industry. These analyses collectively equip the office with actionable insights for informed decision-making in the real estate market.



**5. Preparing a Dashboard in PowerBI**
-

```After extracting insights in R, we want to prepare an interactive dashboard in PowerBI to present to the managing broker, agents, or potential real estate investors.``` 

- Import the same R script used before, making sure to specify the dir, using ```setwd``` 
- Create the Dashboard: 
  - ![image](https://github.com/mkowalczyk0/Real-Estate-Sales-Analysis-Proj/assets/151803531/d788bcc3-63f5-43be-bf67-ecc40a4f54f6)



PowerBI Generated Insights using "Narritive" : 
- Insights:
  - ﻿At $23,042,901, June had the highest Sale Volume and was 318.96% higher than November, which had the lowest Sale Volume at $5,500,001.
  - ﻿﻿Sale Volume and total Number of Sales are positively correlated with each other.
  - June accounted for 13.91% of Sale Volume.
  - Sale Volume and Number of Sales diverged the most when the Month was June, when Sale Volume were $23,042,855 higher than Number of Sales.
  - Across all 16 Agent, Sale Volume ranged from $650,000 to $100,254,575.
      - ﻿```A File to the Dashboard will be uploaded```

**Final Thoughts**
-

The project on analyzing this data for this "unnamed" office (for legal reasons of course) has provided a comprehensive understanding of the office's performance and individual agents. By leveraging both Excel and R for data cleaning, preparation, and extraction of insights, we were able to generate valuable visualizations and metrics. The initial basic analysis, including the count of sale types and the total sale volume by agent, laid the foundation for deeper insights. The subsequent dive into Lemont's sales data revealed crucial information about the dominating agents and the distribution of sale prices.

The visualization of data through various charts and graphs not only facilitated a clearer comprehension of the office's dynamics but also presented actionable insights for strategic decision-making. The transition to PowerBI allowed for the creation of an interactive dashboard, enhancing the accessibility and usability of the insights for the managing broker, agents, and potential investors.

By incorporating R's capabilities for statistical analysis and visualization, we have empowered the real estate office with data driven tools for making informed decisions. The findings can be utilized to identify top performing agents, target specific market segments, and optimize marketing strategies. Overall, this project provides a robust foundation for ongoing data analysis and strategic planning within the real estate industry. Had a lot of fun!








