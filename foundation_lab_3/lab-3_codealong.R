#load libraries
library(tidyverse)
library(here)

data_to_explore <- read_csv(here("data", "data_to_explore.csv"))
head(data_to_explore)

library(skimr)
skim(data_to_explore)

# using the `select()` and `filter()` functions. In the code chunk below,look at descriptive for just `proportion_earned` , `time_spent` and `gender`, but only for the "OcnA" and "PhysA" subjects.

data_to_explore %>% 
  select(c('subject', 'gender', 'proportion_earned', 'time_spent')) %>% 
  filter(subject == "OcnA" | subject == "PhysA") %>%
  skim()

#layer 1: add data and aesthetics mapping 
ggplot(data_to_explore, #<<
       aes(x = time_spent_hours, 
           y = proportion_earned)) +
  #layer 2: +  geom function type
  geom_point() #<<

#layer 1: add data and aesthetics mapping 
#layer 3: add color scale by type
ggplot(data_to_explore, 
       aes(x = time_spent_hours, 
           y = proportion_earned,
           color = enrollment_status)) + #<<
  #layer 2: +  geom function type
  geom_point()


#layer 1: add data and aesthetics mapping 
#layer 3: add color scale by type
ggplot(data_to_explore, 
       aes(x = time_spent_hours, 
           y = proportion_earned,
           color = enrollment_status)) +
  #layer 2: +  geom function type
  geom_point() +
  #layer 4: add lables
  labs(title="How Time Spent on Course LMS is Related to Points Earned in the Course", x="Time Spent (Hours)", y = "Proportion of Points Earned")


#layer 1: add data and aesthetics mapping 
#layer 3: add color scale by type
ggplot(data_to_explore, aes(x = time_spent_hours, y = proportion_earned, color = enrollment_status)) +
  #layer 2: +  geom function type
  geom_point() +
  #layer 4: add lables
  x_lab(title="How Time Spent on Course LMS is Related to Points Earned in the Course", 
        x="Time Spent (Hours)",
        y = "Proportion of Points Earned")
#layer 5: add facet wrap
  facet_wrap(~subject) 
  
  ####WHY IS THIS ACTING UP!!!!!

  
  data_to_explore %>% #<<
    ggplot(aes(x = time_spent_hours)) +
    # layer 2: add histogram geom
    geom_histogram()

  # Layer 1: add data and aesthetic mapping
  data_to_explore %>% 
    ggplot(aes(x = time_spent_hours)) +
    # layer 2: add histogram geom 
    # layer 3a: add bin size
    geom_histogram(bins = 10)  

  
  data_to_explore %>% 
    ggplot(aes(x = time_spent_hours)) +
    # layer 2: add histogram geom 
    # layer 3a: add bin size
    #layer 3b: add color
    geom_histogram(bins = 10,
                   fill = "red", 
                   colour = "black")   

  
  # Layer 1: add data and aesthetic mapping
  data_to_explore %>% 
    ggplot(aes(x = time_spent_hours)) +
    # layer 2: add histogram geom 
    # layer 3a: add bin size
    # layer 3b: add color
    geom_histogram(bins = 10, fill = "red", colour = "black")+
    #layer 4: add Labels
    labs(title="Time Spent on LMS histogram plot",x="Time Spent(hours)", y = "Count")+
    theme_classic()  

  
  data_to_explore%>%
    ggplot(aes(x=time_spent_hours)) +
    geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 10)+
    geom_density(alpha=.2, fill="#FF6666") 
  labs(title="Time Spent on LMS histogram/density plot",x="Time Spent(hours)", y = "Density")+
    theme_classic()  
  
  
  
  sci_classes <- read_csv("data/sci-online-classes.csv")
  
  ggplot(data = sci_classes, mapping = aes(x = TimeSpent_hours, y = FinalGradeCEMS)) +
    geom_point(alpha=0.5) +
    geom_smooth(mapping = aes(color = subject), se = FALSE)
  