library(knitr)
library(dplyr)
library(readr)
library(tidyr)
library(stargazer)
library(ggplot2)
library(knitr)
library(stringr)
library(kableExtra)
library(beepr)

build_table <- function(table, caption, col.names, position){
  num_col <- ncol(table)

  return(
    kable(
      table
      , caption=caption
      , align = c('r',rep('c', num_col - 1))
      , col.names=col.names
      , digits=4
      , format.args = list(big.mark=',', nsmall=3, scientific=F, drop0trailing=T)
      , format='latex'
      , booktabs=T
      , escape=F)
    %>% kable_styling(
      latex_option=c("scale_down")
      , position='left'
    )
    %>% row_spec(0, bold=T)
  )
}

polish <- function(x, prefix, suffix){
  cleaned <- (
    x
    %>% str_replace_all('per\\_', '% ')
    %>% str_replace_all('sc\\_', 'Augmented Search Results ')
    %>% str_replace_all('sr\\_', 'Standard Search Results ')
    %>% str_replace_all('avg_', '')
    %>% str_replace_all('\\_w\\_', ' with ')
    %>% str_replace_all('\\_', ' ')
    %>% str_to_title()
    %>% str_replace_all('Num ', 'Num. ')
    %>% str_replace_all('Pla', 'PLA ')
  )
  return(paste0(prefix, cleaned, suffix))
}

extract_coeff <- function(model){
  x <- summary(model)$coeff
  out <- c(x[2, ], x[1,1])
}
