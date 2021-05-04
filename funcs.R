library(tidyr)
library(dplyr)
library(gutenbergr)

library(tidytext)

colorWords <- function(df) {
  wordhist <- df %>% unnest_tokens(word,text) %>% 
    filter( word %in% c("white","black","red","yellow","green","blue") ) %>% count(word)
  wordhist
}

works %>%filter(grepl("Seneca|Cicero|Pliny|Homer|Aurelius|Julius",author,ignore.case = T)) %>% select(id = gutenberg_id,title,author) %>% print(n=200)
