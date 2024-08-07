library(safetyData)
library(tidyverse)

#calling ADSL data
asl<- adam_adsl

#calling EX data
sdmex <- sdtm_ex

#merging data
ds01 <- merge(asl,sdmex, by = c("USUBJID", "STUDYID"),all.y = TRUE)

#creating ASTDT & AENDT
ds01 <- ds01 %>%
        mutate(ASTDT = as.Date(EXSTDTC, format="%Y-%m-%d"),
               AENDT = as.Date(EXENDTC, format="%Y-%m-%d"),
               ASTDY = (ASTDT-TRTSDT)+1,
               AENDY = (AENDT-TRTSDT)+1
               )


