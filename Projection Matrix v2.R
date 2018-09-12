# Land Indicator of D matrix #
# Let assume we have D matrix for spatial lattice matrix #
ymx = nrow(D); xmx = ncol(D)

land.indicator <- matrix(0, ncol = 1, nrow = (ymx*xmx))

for (m in 1:(ymx*xmx)) {
  if(is.na(D[m])==TRUE) {
    land.indicator[m]<-0
  } else {
    land.indicator[m]<-1
  }
}

datasize <- sum(land.indicator)

# Construction of Projection Matrix

P <- matrix(0, nrow = (ymx*xmx), ncol = datasize)

count=0
for (p in 1:(ymx*xmx)) {
  if (land.indicator[p]==1) {
    count=count+1;
    P[p, count]<-1
  }
}

H_STAR <- t(P) %*% W %*% P
