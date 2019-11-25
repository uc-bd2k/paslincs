CalcTPSig <- function(EdgeInfo,pathway="Pathway",EdgeFrom="GeneSymbol_a",EdgeTo="GeneSymbol_b",interaction="Interaction",ncomp=NULL,data,neigen=NULL) {
  PathwayList <- unique(EdgeInfo[,pathway])
  ScoreTab <- matrix(NA,ncol=ncol(data),nrow=length(PathwayList))
  rownames(ScoreTab) <- PathwayList
  for (path in PathwayList) {
   Edge <- EdgeInfo[EdgeInfo$Pathway==path,]
   AdjMat <- CalcAdj(EdgeFrom=Edge[,EdgeFrom],EdgeTo=Edge[,EdgeTo],interaction=Edge[,interaction])
   if (is.null(AdjMat)) {
    print(paste0("Adjacency matrix for ",path," is not available!"))
   } else {
    Score <- CalcScore(AdjMat=AdjMat,ncomp=ncomp,data=t(data),neigen=neigen)
    if (length(Score)!=0) {
     nonull <- sapply(Score,function(x) {!is.null(x)})
     if (sum(nonull)>0) {
      Score <- Score[nonull]
      Score_summary <- rowSums(matrix(sapply(Score,function(x) as.numeric(x$Score)),ncol=length(Score)))
      ScoreTab[path,] <- Score_summary
     }
    }
   }
  }
  ScoreTab <- data.frame(ScoreTab,stringsAsFactors=FALSE)
  colnames(ScoreTab) <- colnames(data)
  return(ScoreTab)
}
