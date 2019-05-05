CalcScoreSummary <- function(EdgeFrom,EdgeTo,interaction,AdjMat=NULL,ncomp=NULL,data,neigen=NULL) {
  if (is.null(AdjMat)) {
    AdjMat <- CalcAdj(EdgeFrom=EdgeFrom,EdgeTo=EdgeTo,interaction=interaction)
  }
  if (is.null(AdjMat)) {
    print("Adjacency matrix is not available!")
    return(NULL)
  } else {
    ScoreDF <- CalcScore(AdjMat=AdjMat,ncomp=ncomp,data=data,neigen=neigen)

    if (length(ScoreDF)==0) {
      return(NULL)
    } else {
      nonull <- sapply(ScoreDF,function(x) {!is.null(x)})
      if (sum(nonull)==0) {
        return(NULL)
      } else {
        Score <- ScoreDF[nonull]
        Score_summary <- rowSums(matrix(sapply(Score,function(x) as.numeric(x$Score)),nrow=nrow(data)))
        if (sum(Score_summary==0)==length(Score_summary)) {
          return(NULL)
        } else {
          Score_summary <- data.frame(Gene=rownames(Score[[1]]),Score=Score_summary,stringsAsFactors=FALSE)
          return(Score_summary)
        }
      }
    }
  }
}
