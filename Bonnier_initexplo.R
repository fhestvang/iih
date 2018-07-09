library(tidyverse)
library(magrittr)
library(dplyr)
library(ggplot2)

setwd("~/Downloads/")

df <- read_csv("ga-meta-download-acc2018-07-02.csv") %>% select(-X1)

df %<>% group_by(accountId) %>% mutate(countProperties = n_distinct(webPropertyId))

df %>% group_by(name, countProperties) %>% tally() %>% 
  ggplot(aes(reorder(name, n), n, fill = as.factor(countProperties))) + geom_col() +
  labs(title = "No. of views under each account") + 
  coord_flip() + 
  xlab("Accounts") + 
  ylab("Views") + 
  labs(fill="No. of properties")

df %>% select(websiteUrl) %>% distinct(websiteUrl) %>% View()

