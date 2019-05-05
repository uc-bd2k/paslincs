EdgeInfo <- function(pathway) {
 tmp <- tempfile()
 retrieveKGML.new(pathway,"hsa",tmp)
 path <- parseKGML2DataFrame(tmp)
 path <- path[(path$subtype %in% c("activation","inhibition")),]
 path$Subtype <- path$subtype
 path$GeneID_a <- translateKEGGID2GeneID(path$from)
 path$GeneID_b <- translateKEGGID2GeneID(path$to)

 path$Interaction <- rep(1,nrow(path))
 path$Interaction[path$subtype=="inhibition"] <- -1

 path$GeneSymbol_a <- as.character(lookUp(path$GeneID_a,'org.Hs.eg','SYMBOL'))
 path$GeneSymbol_b <- as.character(lookUp(path$GeneID_b,'org.Hs.eg','SYMBOL'))

 path <- path[,c("Subtype","GeneID_a","GeneID_b","GeneSymbol_a","GeneSymbol_b","Interaction")]
 return(path)
}
