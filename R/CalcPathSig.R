CalcPathSig <- function(EdgeFrom,EdgeTo,interaction,AdjMat=NULL,ncomp=NULL,data,ntop=100,neigen=NULL) {
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
     Top <- Score_summary[with(Score_summary,order(-Score)),][1:ntop,]

     graphobj <- graph_from_adjacency_matrix(abs(AdjMat), mode = "undirected", weighted = NULL, diag = TRUE)
     decomp <- decompose.graph(induced.subgraph(graphobj, vids=V(graphobj), impl="create_from_scratch"),min.vertices=2)
     Rank <- order(sapply(decomp,vcount),decreasing=TRUE)
     decomp_ordered <- decomp[Rank]
     Nodes <- unique(unlist(lapply(decomp_ordered[nonull],function(x) names(V(x)))))
     Cols <- na.omit(match(Nodes,colnames(data)))

     if (length(Cols) <= 2) {
      return(NULL)
     } else {
      PCAdata <- data[as.character(Top$Gene),Cols]
      Rotation <- prcomp(PCAdata,scale=TRUE)$rotation
      PCA_coef <- matrix(Rotation[,1],ncol=1)
      signature <- as.matrix(scale(PCAdata)) %*% PCA_coef
      Signature <- data.frame(Gene=Top$Gene,Signature=signature,stringsAsFactors=FALSE)
      return(Signature)
     }
    }
   }
  }
 }
}




























































