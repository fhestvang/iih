install.packages("googleAnalyticsR")
library(googleAnalyticsR)
library(jsonlite)
library(listviewer)

ga_auth()

acc <- ga_accounts()
jsonedit(acc)

ga_account_list()

google_analytics_meta() %>% View()
ga_users_list(216346)
