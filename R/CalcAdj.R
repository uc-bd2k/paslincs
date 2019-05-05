CalcAdj <- function(EdgeFrom,EdgeTo,interaction) {
 AdjData <- data.frame(A=EdgeFrom,B=EdgeTo,Interaction=interaction,stringsAsFactors=FALSE)
 AdjData <- unique(AdjData)
 AdjData$edge <- sapply(1:nrow(AdjData),function(x) paste0(sort(AdjData[x,c("A","B")])[1],":",sort(AdjData[x,c("A","B")])[2]))

 if (length(unique(AdjData$edge))!=nrow(unique(AdjData[,c("Interaction","edge")]))) {
  print("Conflict edges!")
  return(NULL)
 } else {
  NodeList <- unique(c(EdgeFrom,EdgeTo))
  AdjMat <- matrix(0,ncol=length(NodeList),nrow=length(NodeList))
  for (AdjMatRow in 1:length(EdgeFrom)) {
   matchrow <- match(EdgeFrom[AdjMatRow],NodeList)
   matchcol <- match(EdgeTo[AdjMatRow],NodeList)
   AdjMat[matchrow,matchcol] <- interaction[AdjMatRow]
  }
  AdjMat <- AdjMat+t(AdjMat)
  diag(AdjMat) <- 0
  colnames(AdjMat) <- NodeList
  rownames(AdjMat) <- NodeList
  return(AdjMat)
 }
}
