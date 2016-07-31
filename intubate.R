library(intubate)

## Packages needed
library(dplyr)     ## Does data transformation
library(magrittr)  ## Implements pipelines


library(yrbss) #Youth Risk Behaviour Surveillance System Data
data(survey)

#Count of NA in the data frame
survey %>%
group_by(year) %>%
summarise(count = n(),
            countNA = sum(is.na(stheight)),
            propNA = mean(is.na(stheight))) %>%
knitr::kable()

#Simple Linear model
survey %>%
  filter(!is.na(stheight) & !is.na(stweight) &
           year == 2013 & sex == "Male"
         ) %>%
  select(stheight, stweight) %>%
  ntbt_lm(stweight ~ stheight) %>%  #Using intubate
  summary()