getSubjLevelData = function(df,varnames){
  require(tidyverse)
  sbj = df %>% dplyr::select(all_of(varnames)) %>% distinct()
  return(sbj)
}
