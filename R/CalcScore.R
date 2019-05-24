CalcScore <- function(EdgeFrom,EdgeTo,interaction,AdjMat=NULL,ncomp=NULL,data,neigen=NULL) {
 if (is.null(AdjMat)) {
  AdjMat <- CalcAdj(EdgeFrom=EdgeFrom,EdgeTo=EdgeTo,interaction=interaction)
 }
 if (is.null(AdjMat)) {
  print("Adjacency matrix is not available!")
  return(NULL)
 } else {
  graphobj <- graph_from_adjacency_matrix(abs(AdjMat), mode = "undirected", weighted = NULL, diag = TRUE)
  decomp <- decompose.graph(induced.subgraph(graphobj, vids=V(graphobj), impl="create_from_scratch"),min.vertices=2)
  Rank <- order(sapply(decomp,vcount),decreasing=TRUE)
  decomp_ordered <- decomp[Rank]
  nComp <- length(decomp_ordered)
  if (!is.null(ncomp)) {
   nComp <- ncomp
  }
  ScoreDF <- rep(list(NULL),nComp)
  for (i in 1:nComp) {
   CompAdj <- AdjMat[names(V(decomp_ordered[[i]])),names(V(decomp_ordered[[i]]))]
   TopoSig <- CalcTopoSig(AdjMat=CompAdj)
   if (is.null(TopoSig)) {
    print(paste0("Conflict in topology of component graph ",i,"!"))
    ScoreDF[[i]] <- NULL
   } else {
    cols <- match(colnames(CompAdj),colnames(data))
    if (sum(!is.na(cols))<=1) {
     print(paste0("Not sufficient data for component graph ",i,"!"))
     ScoreDF[[i]] <- NULL
    } else {
     Y <- data[,na.omit(cols)]
     Y[Y>2] <- 2
     Y[Y< -2] <- -2
     Ymat <- data.matrix(Y)
     Ymat <- matrix(Ymat,ncol=length(na.omit(cols)))
     rownames(Ymat) <- rownames(data)
     colnames(Ymat) <- colnames(data)[na.omit(cols)]

     nnode <- nrow(CompAdj)
     if (is.null(neigen)) {
      neigen_t <- nnode
     } else {
      neigen_t <- neigen
     }
     if (neigen_t>nnode) {
       neigen_t <- nnode
     }
     if (neigen_t==1) {
       Score <- (as.vector(Ymat%*%cbind(sign(TopoSig$vectors[colnames(Ymat),nnode]))))^2
       names(Score) <- rownames(Ymat)
     } else {
       wt <- (0.9-TopoSig$values[(nnode-neigen_t+1):nnode])/2/(TopoSig$values[(nnode-neigen_t+1):nnode]+1.1)
       U <- TopoSig$vectors[colnames(Ymat),c((nnode-neigen_t+1):nnode)]
       quadratic <- (t(U) %*% t(Ymat))^2
       Score <- as.vector(rbind(wt)%*%quadratic)
       names(Score) <- rownames(Ymat)
     }
     ScoreDF[[i]] <- data.frame(Profile=names(Score),Score=Score,stringsAsFactors=FALSE)
    }
   }
  }
  return(ScoreDF)
 }
}


























