CalcTopoSig <- function(EdgeFrom,EdgeTo,interaction,AdjMat=NULL) {
 if (is.null(AdjMat)) {
  AdjMat <- CalcAdj(EdgeFrom=EdgeFrom,EdgeTo=EdgeTo,interaction=interaction)
 }
 if (is.null(AdjMat)) {
  return(NULL)
 } else {
  DegMat <- diag(apply(AdjMat,1,function(x) sum(abs(x))))
  LapMat <- DegMat-AdjMat

  Eigen <- eigen(LapMat)
  if (Eigen$values[length(Eigen$values)]<1e-10) {
   print("Balanced graph")
   rownames(Eigen$vectors) <- colnames(AdjMat)
   return(Eigen)
  } else {
   print("Un-balanced graph!")
   return(NULL)
  }
 } 
}





