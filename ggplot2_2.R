###################################################
#   Session date : 30Nov2025
#   Batch : Sep2025
#  content : ggplot2 for graphs (lineplot)
###################################################

lineplot_self <- function(inds,plotvar = AVAL,prmn=1,x_label = "Analysis Visit",y_label = "Analysis Value",interact = FALSE,strat = TRUE) {
  
  datafig <- {{inds}} %>% 
    mutate(
      AVISIT = trimws(AVISIT),
      CHG = case_when(
        (ABLFL=="Y") ~ 0,
        TRUE ~ CHG
        )
      )
  
# factorize the visits
vis <- c("Baseline", "Week 2", "Week 4","Week 6","Week 8","Week 12", "Week 16","Week 20","Week 24","End of Treatment")

datafig$AVISIT <- factor(datafig$AVISIT,levels = vis)

param <- sort(unique(datafig$PARAM))
prm <- param[prmn]

figdf <- datafig %>% 
  dplyr::filter(PARAM==prm & !is.na({{plotvar}}))

lineplot <- figdf %>% # data layer
  ggplot(aes(AVISIT,{{plotvar}}, group = USUBJID, colour = USUBJID)) + # aesthetic mapping
  geom_line() + # geometry layer
  geom_point() + # geometry layer
  labs(x = x_label,
       y = y_label,
       title = paste("Parameter:",prm)
  ) + # labels within coordinates
  theme_classic() +
  theme(legend.position = "none",
        axis.text.x = element_text(angle = 45, hjust = 1)
        )
  if(strat){
    lineplot <- lineplot +
      facet_grid(TRTA ~ .) # facet layer
  }

  if (!interact){
    out <- lineplot
  } else {
    out <- ggplotly(lineplot)
  }

return(out)
}
