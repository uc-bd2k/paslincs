CalcTPSig <- function(EdgeFrom,EdgeTo,interaction,AdjMat=NULL,ncomp=NULL,data,neigen=NULL) {
  if (is.null(AdjMat)) {
    AdjMat <- CalcAdj(EdgeFrom=EdgeFrom,EdgeTo=EdgeTo,interaction=interaction)
  }
  if (is.null(AdjMat)) {
    print("Adjacency matrix is not available!")
    return(NULL)
  } else {
    Score <- CalcScore(AdjMat=AdjMat,ncomp=ncomp,data=t(data),neigen=neigen)
    if (length(Score)!=0) {
      nonull <- sapply(Score,function(x) {!is.null(x)})
      if (sum(nonull)>0) {
        Score <- Score[nonull]
        Score_summary <- rowSums(matrix(sapply(Score,function(x) as.numeric(x$Score)),ncol=length(Score)))
        return(data.frame(Perturbagen=colnames(data),Score=Score_summary,stringsAsFactors=FALSE))
      } else {
        return(NULL)
      }
    } else {
      return(NULL)
    } 
  }
}
