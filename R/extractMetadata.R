extractMetadata = function(df,varnames,idvar){

  list_df =  lapply(varnames, function(x) df %>%
                      dplyr::select(SUBJID = all_of(idvar), all_of(x)) %>%
                      na.omit() %>%
                      distinct())

  names(list_df) = names(varnames)

  metadata = list_df %>% reduce(left_join , by = 'SUBJID')

  return(metadata)


}
