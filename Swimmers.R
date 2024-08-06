library(safetyData)

#calling ADSL data
asl<- adam_adsl

#calling EX data
sdmex <- sdtm_ex

#merging data
ds01 <- merge(asl,sdmex, by = c("USUBJID", "STUDYID"),all.y = TRUE)
