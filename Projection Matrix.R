# Let us assume the spatial lattice matrix denotes as D #
# Separate the NA cells of D and store the information in 'no.na' object2 #
# The NA cells are originated from grid-cells such as GPWv4 #
no.na <- which(as.numeric(t(D)) != "NA", arr.ind = TRUE)

library(Matrix)
P <- as(matrix (0, nrow = (ncol(D)*nrow(D)), ncol = length(no.na)), "CsparseMatrix")

count=0
for (i in 1:nrow(P)){
 if (is.element(i, no.na)){
 count = count+1;
 P[i, count] <- 1;
 }
}
