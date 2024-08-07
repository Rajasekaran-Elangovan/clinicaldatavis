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
               AENDY = (AENDT-TRTSDT)+1,
               prefl = if_else(ASTDT<TRTSDT,"Y","")
               )
ds02 <- ds01 %>% select(USUBJID, SUBJID,starts_with("TRT"),ASTDY,ASTDT,AENDY, AENDT,
                        starts_with("VISIT"),SAFFL,starts_with("COMP"),DISCONFL,DCDECOD,DTHFL)

ds03 <- ds02 %>% 
          filter(SAFFL == "Y") %>%
          group_by(USUBJID, VISITNUM,VISIT) %>%
          mutate(
            VISEND = if_else(row_number()==n() & VISITDY > 1,VISITDY/7,
                             if_else(row_number()==n() & VISITDY == 1, VISITDY,NA_real_))
          ) %>%
          ungroup() %>%
          group_by(USUBJID) %>%
          filter(row_number()==n())%>%
          ungroup() %>%
          mutate(
            MAXVIS = if_else(COMP24FL == "Y",24,
                             if_else(COMP16FL == "Y",16,
                                     if_else(COMP8FL == "Y", 8,VISEND)))
          ) %>%
         arrange(USUBJID) %>%
         mutate(
           cnt = row_number(),
           grpnum = ceiling(cnt/15)
         )

plotdata <- ds03 %>%
            filter(grpnum == 1)

theme_set(
  theme_classic()+
    theme(legend.position = "right")
)
swim <- ggplot(plotdata,aes(x = MAXVIS, y = SUBJID, fill = SUBJID)) + 
        geom_col() + 
        theme(legend.position = "none")
swim
