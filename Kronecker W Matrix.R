# Construct functions for upper and left shifted matrices #

A.mat <- function(dims){
  B <- as(diag(1, dims-1, dims-1), "CsparseMatrix")
  D <- as(matrix(rep(0, dims), nrow = dims, ncol = 1), "CsparseMatrix")
  E <- cbind(rbind(t(D[1:(dims-1),]),B), D)
  return(t(E) + E)
}

library(Matrix)
r=c;c=c
# Example of Lake Apopka Case we have #
# r=9; c=9 #

ic <- as(diag(1,ncol = c,nrow = c),"CsparseMatrix")
ir <- as(diag(1,ncol = r,nrow = r),"CsparseMatrix")
ac <- A.mat(c); ar <- A.mat(r)
  
W <- kronecker(ar,ic)+kronecker(ir,ac)+kronecker(ar,ac)
