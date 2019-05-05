CalcNodeScore <- function(EdgeFrom,EdgeTo,interaction,ncomp=NULL,neigen=NULL,data,node) {
 if (node %in% colnames(data)) {
  ScoreDFFull <- CalcScore(EdgeFrom=EdgeFrom,EdgeTo=EdgeTo,interaction=interaction,ncomp=ncomp,neigen=neigen,data=data)
  ScoreDFRed <- CalcScore(EdgeFrom=EdgeFrom,EdgeTo=EdgeTo,interaction=interaction,ncomp=ncomp,neigen=neigen,data=data[,colnames(data)!=node])

  if (length(ScoreDFFull)==0 | length(ScoreDFRed)==0) {
   return(NULL)
  } else {
   nonullFull <- sapply(ScoreDFFull,function(x) {!is.null(x)})
   nonullRed <- sapply(ScoreDFRed,function(x) {!is.null(x)})

   if (sum(nonullFull)>0 & sum(nonullRed)>0) {
    ScoreFull <- ScoreDFFull[nonullFull]
    ScoreRed <- ScoreDFRed[nonullRed]
    ScoreFull_summary <- rowSums(matrix(sapply(ScoreFull,function(x) as.numeric(x$Score)),nrow=nrow(data)))
    ScoreRed_summary <- rowSums(matrix(sapply(ScoreRed,function(x) as.numeric(x$Score)),nrow=nrow(data)))
    Diff <- ScoreFull_summary-ScoreRed_summary
    NodeScore <- data.frame(Gene=rownames(ScoreFull[[1]]),Score=Diff,stringsAsFactors=FALSE)
    return(NodeScore)
   } else {
    return(NULL)
   }
  }
 } else {
  return(NULL)
 }
}
