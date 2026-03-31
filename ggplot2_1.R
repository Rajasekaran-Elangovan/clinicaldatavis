###################################################
#   Session date : 29Nov2025
#   Batch : Sep2025
#  content : ggplot2 for graphs (boxplot)
###################################################
# data preparation
library(plotly)

boxplot_self <- function(inds,prm,x_label = "Analysis Visit", y_label = "Laboratory values",interact = FALSE,strat=TRUE) {
  # browser() ## to debug a function
  # data selection
  df <- {{inds}}  %>% 
    mutate(
      AVISIT = trimws(AVISIT)
    )
  
  # factorize the visits
  vis <- c("Baseline", "Week 2", "Week 4","Week 6","Week 8","Week 12", "Week 16","Week 20","Week 24","End of Treatment")
  
  df$AVISIT <- factor(df$AVISIT, levels = vis)
  
  ## select parameter
  
  prma <- sort(unique(df$PARAM))
  
 # prm <- prma[prmn]
  
  # filter parameter from data
  figdf <- df %>% 
    dplyr::filter(PARAM==prm)
  
  # create a boxplot
  boxfig <- figdf %>% # Data
    ggplot(aes(AVISIT,AVAL, colour = TRTA)) + # Mapping aesthetics
    geom_boxplot() + # geometry layer
   # stat_boxplot(geom = "errorbar", width = 0.3) + # stat. transformation layer
    scale_colour_brewer(type = "qual", palette = "Dark2") + # scale layer
    labs(x = x_label,
         y = y_label,
         title = paste("Parameter:",prm)) + # labes in the coordinates
    theme_classic() +
    theme(legend.position = "bottom",
          axis.line.x = element_line(),
          axis.text.x = element_text(angle = 45,hjust = 1))  # coordinate ops
  
  if(strat){
    boxfig <- boxfig +
      facet_grid(TRTA ~ .) # Facet layer
  }
  
  if (!interact){
    out <- boxfig
  } else {
    out <- ggplotly(boxfig)
  }
  
  return(out)
}
