## Creation of random dataset and merging with the worker's dataset as the population dataset

library(readxl)
workers_dataset <- read_excel("C:/Users/Chris/Desktop/Data Analytics/Datasets/exported/post_mapReduce_workers.xlsx")

# creating the vectors columns and join the two variables into a dataframe 

home_sharing <- sample(x = 1:10, size = 888, replace = TRUE) # random sampling number of people sharing

mental_health <- sample(x = c("Yes", "No"), size = 888,  replace = TRUE) # random sampling mental health conditons

# changing worker's columns name

names(workers_dataset)[1] <- "mental_health"

names(workers_dataset)[2] <- "home_sharing" 

# merging datasets with same index names

population_dataset <- rbind(workers_dataset, made_up_dataset)

# select a sample (subset) of the population for the statistics analysis

sample_selection <- sample_n(population_dataset, 1111) # 65% of the total population 


### This section will be covering the part of Statistics Analysis #####

##### Shapiro test to validate normal distribution

result <- shapiro.test(sample_selection$home_sharing)


################################################

######   Creating a frequency table of Student depression and Home Sharing rooms

freq_table_sample_dataset <- table(sample_selection$mental_health, sample_selection$home_sharing)


##### Proceeding with the Pearson's Chi-squared test                ####

chisq.test(freq_table) 

post_result <- chisq.test(freq_table, simulate.p.value = TRUE)

post_result2 <- fisher.test(freq_table, simulate.p.value = TRUE)



#######################################################################################

Plotting dataset for meaninful information

ggplot(export_dataframe) +
 aes(x = sex, y = age, fill = house_count) +
 geom_tile(size = 1L) +
 scale_fill_distiller(palette = "RdYlBu") +
 labs(x = "Gender", y = "Age range", title = "Covid-19 disease analysis in Ireland", subtitle = "House sharing") +
 coord_flip() +
 theme_bw()
 
 
ggplot(export_dataframe) +
 aes(x = sex, y = age, fill = income) +
 geom_tile(size = 1L) +
 scale_fill_brewer(palette = "Spectral") +
 labs(x = "Gender", y = "Age range", title = "Covid-19 disease analysis in Ireland", subtitle = "Income range") +
 coord_flip() +
 theme_bw()

fixed it is an issue with the x label too large organize in the countries

ggplot(students_clean) +
 aes(x = Country, weight = CostSchool) +
 geom_bar(fill = "#ef562d") +
 labs(x = "Countries", y = "Cost of Education", title = "International English Students", subtitle = "School Cost", caption = "Cost of Education") +
 theme_bw()
 
ggplot(students_clean) +
 aes(x = Country, y = CostSchool) +
 geom_boxplot(fill = "#31688e") +
 labs(x = "Countries", y = "Cost of education") +
 coord_flip() +
 theme_bw()
 
 ggplot(students_clean) +
 aes(x = Country, y = RoomShare) +
 geom_boxplot(fill = "#31688e") +
 labs(x = "Countries", y = "Room share") +
 coord_flip() +
 theme_bw()
 
 
ggplot(workersdataset) +
 aes(x = Country, y = Clean_Cost_Education) +
 geom_boxplot(fill = "#31688e") +
 labs(x = "Countries", y = "Cost of education") +
 coord_flip() +
 theme_bw()


ggplot(workersdataset) +
 aes(x = Country, y = Mental_Health_Household_sub, fill = Mental_Health_Household) +
 geom_tile(size = 1L) +
 scale_fill_brewer(palette = "YlGn") +
 labs(x = "Countries", y = "Mental Health symptoms") +
 coord_flip() +
 theme_bw()

ggplot(workersdataset) +
 aes(x = Country, y = Mental_Health_Household, fill = English_Level) +
 geom_tile(size = 1L) +
 scale_fill_brewer(palette = "RdYlGn") +
 labs(x = "Countries", y = "Mental Health symptoms") +
 coord_flip() +
 theme_bw()


ggplot(forRchisquare) +
 aes(x = Home_Share_people, fill = Mental_Health_Depression) +
 geom_histogram(bins = 30L) +
 scale_fill_hue() +
 stat_function(fun = dnorm)
 labs(title = "International students living conditions", subtitle = "Mental Health and House sharing") +
 theme_minimal()

> hist(data_frame$Home_Share_people)
data_mean <- mean(data_frame$Home_Share_people)
data_sd <- sd(data_frame$Home_Share_people)
hist(data_frame$Home_Share_people,probability=TRUE)
x <- 0:11
y <- dnorm(x = x, mean = data_mean, sd = data_sd)
lines(x = x, y = y, col = "blue")


ggplot(data_frame, aes(Home_Share_people)) +
  geom_histogram(aes(x=Home_Share_people, y=..density..), bins=50, fill= Mental_Health_Depression) +
  stat_function(fun=dnorm, args = list(mean=mean(data_frame$Home_Share_people), sd=sd(data_frame$Home_Share_people)), color="red")




curve(dchisq(x, df = 10), from = 0, to = 40,

      main = 'Chi-Square Distribution (df = 10)', #add title
      ylab = 'Density', #change y-axis label
	  xlab = 'hola'
      lwd = 2, #increase line width to 2
      col = 'steelblue') #change line color to steelblue





ggplot(roomsharingR) +
 aes(x = CleanRoomShare, fill = Mental_Health_Household) +
 geom_histogram(bins = 30L) +
 scale_fill_hue() +
 labs(x = "Number of people sharing room", title = "International English Students", subtitle = "Living conditions", fill = "Mental Health") +
 theme_minimal() 

# plotting contribution per cell 
 
> corrplot(contrib, is.cor = FALSE)

esquisse:::esquisser() R-add-in to visualize and manipulate the data. 

#### converting the expected frenquncy table to a dataframe for further analysis 

d = as.data.frame(as.table(as.matrix(kdat)))