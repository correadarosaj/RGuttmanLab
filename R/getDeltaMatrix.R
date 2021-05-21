# This function returns a difference between two matrices

getDeltaMatrix<-function(M1 , M2){

  common.rownames = intersect(rownames(M1),rownames(M2))
  common.colnames = intersect(colnames(M1),colnames(M2))

  dm = M1[common.rownames,common.colnames] - M2[common.rownames,common.colnames]

  return(dm)

}
