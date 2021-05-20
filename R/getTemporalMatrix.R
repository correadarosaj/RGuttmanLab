# dx is a dataframe with 3 metadata columns : SUBJID , timepoint and tissue
# the remaining columns are biomarkers metrics

get.temporal.matrix<-function(dx = anx.d,
                              tx = 'V3',
                              tsx = 'NL'
){

  # build a long format dataframe
  mdx = reshape2::melt(dx,id.vars=c('SUBJID','timepoint','tissue'))

  # filter by timpoint and tissue
  if(is.null(tsx)){
    mat.time   = mdx %>% filter(timepoint == tx)
    }else{
    mat.time   = mdx %>% filter(timepoint == tx  & tissue == tsx)
  }


  # reshape to data matrix
  mat = reshape2::dcast(mat.time %>% dplyr::select(SUBJID, biomarker = variable,
                                                   expression = value),
                        SUBJID~biomarker,value.var = 'expression') %>%
    column_to_rownames(var = 'SUBJID')

  return(mat)
}
