## First specify t

library(rvest)
library(dplyr)
library(stringr)


MetacriticPage <- 'https://www.metacritic.com/music/sawayama/rina-sawayama/critic-reviews'
Metacritic <- read_html(MetacriticPage)
#Metacritic <- str_replace_all(Metacritic, "[\r\n]" , "")

ScrapeDetails <- function(DivTag){
  Metacritic %>%
    rvest::html_nodes(DivTag) %>% 
    rvest::html_text() %>%
    str_replace_all("[\r\n]" , "") %>% 
    str_replace_all("  +", "")
}

Title2 <- ScrapeDetails('.product_title')

#Metacritic %>%
#  rvest::html_nodes('.product_title') %>% 
#  rvest::html_text() %>%
#  str_replace_all("[\r\n]" , "") %>% 
#  str_replace_all("  +", "")

# the first string replace gets rid of bunch of annoying \n stuff
# second ges rid of any string of more than 1 space.

ReviewTitles <- Metacritic %>%
  rvest::html_nodes('.source') %>% 
  rvest::html_text()
  str_replace_all("[\r\n]" , "") %>%
  str_replace_all("  +", "")

#ReviewDate <- Metacritic %>%
#  rvest::html_nodes('.source') %>% 
#  rvest::html_text()#
# This is a little broken. It will also include the dates of the 