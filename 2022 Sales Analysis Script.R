library(tidyverse)
library(readxl)
library(scales)

# Load the data
sales_data <- read_xlsx("2022 Sales Data.xlsx")


# Extracting Insights/Basic Analysis:
# Find the total count of each sale type
count_saletype <- sales_data %>% 
  group_by(`Sale Type`) %>% 
  summarise(count = n())

print(count_saletype)

#Find the total sale volume by each agent
agent_sale_volume <- sales_data %>% 
  group_by(Agent) %>% 
  summarise(sum(`Sale Price`))

print(agent_sale_volume)  

# Create new column to estimate the commission earned off each sale
sale_commission <- sales_data %>% 
  mutate(sales_data, Estimated_Commission = `Sale Price` * 0.02)

glimpse(sale_commission)

# Use estimated commision to see the top earning agents
agent_earnings <- sale_commission %>% 
  group_by(Agent) %>% 
  summarise(sum(Estimated_Commission))

print(agent_earnings)

# Count of sales + Sale Volume by city
City_Count_Volume <- sales_data %>% 
  group_by(City) %>% 
  summarise(count = n(),
            sum(`Sale Price`))

print(City_Count_Volume)

# Average sale price by city
mean_sale_price <- sales_data %>% 
  group_by(City) %>% 
  summarise(mean(`Sale Price`))

print(mean_sale_price)





# Few Basic Data Viz's
# Agent Sale Volume Compared (Bar Chart)

ggplot(agent_sale_volume, aes(x = reorder(Agent, `sum(\`Sale Price\`)`), y = `sum(\`Sale Price\`)`)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  labs(title = "Agent Sale Volume", x = "Agent", y = "Sale Volume (Millions)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_y_continuous(labels = label_comma(scale = 1e-6))


# Count of Sale Type (Pie Chart)
ggplot(count_saletype, aes(x = "", y = count, fill = `Sale Type`)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y") +
  labs(title = "Distribution of Sale Types", fill = "Sale Type", x = NULL, y = NULL) +
  theme_minimal()


# Top 5 Cities w/ Highest Sale Volume
top_cities <- City_Count_Volume %>%
  arrange(desc(`sum(\`Sale Price\`)`)) %>%
  head(5)

print(top_cities)

ggplot(top_cities, aes(x = reorder(City, `sum(\`Sale Price\`)`), y = `sum(\`Sale Price\`)`)) +
  geom_bar(stat = "identity", fill = "lightblue", color = "black") +
  geom_text(aes(label = scales::comma(`sum(\`Sale Price\`)`), y = `sum(\`Sale Price\`)`),
            vjust = -0.5, color = "black", size = 3) +
  labs(title = "Top 5 Cities with Highest Sale Volume", x = "City", y = "Sale Volume (Millions)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_y_continuous(labels = label_comma(scale = 1e-6))




#Deep Dive
# After understanding how much we sell in Lemont, lets look deeper into Lemont Sales Data
# Filter all our data to Lemont
lemont_sales <- filter(sales_data, City == "Lemont")

print(lemont_sales)


# Now lets see to who is Dominating the Lemont Area
lemont_agent_sales <- lemont_sales %>% 
  group_by(Agent) %>% 
  summarize(sum(`Sale Price`))

print(lemont_agent_sales)


# Lets look at the price distribution of Sales Data in Lemont
# Place the sales into different price groups <=100k, <=200k, <= 300k <=400k, <=500, <=600k, <=700k, <=800k, <= 900k >=1M 
lemont_price_groups <- lemont_sales %>%
  mutate(PriceGroup = cut(`Sale Price`, breaks = c(-Inf,100000, 200000, 300000, 400000, 500000, 600000, 700000, 800000, 900000, 1000000, Inf),
                          labels = c("<=100k", "<=200k", "<=300k", "<=400k", "<=500k", "<=600k", "<=700k", "<=800k", "<=900k", "<=1M", ">1M"),
                          include.lowest = TRUE))

print(lemont_price_groups)

lemont_price_group_counts <- lemont_price_groups %>%
  group_by(PriceGroup) %>%
  summarise(Count = n())

print(lemont_price_group_counts)


# Create a histogram to display the groups/distribution
ggplot(lemont_price_group_counts, aes(x = PriceGroup, y = Count, fill = PriceGroup)) +
  geom_bar(stat = "identity", position = "dodge", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Sale Price in Lemont", x = "Price Group", y = "Count", fill = "Price Group") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
