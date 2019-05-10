downloadLINCS <- function(dataTable=c("All","LincsCGS","LincsCP","LincsMeta","LincsGeneInfo")) {
  if ("All" %in% dataTable) {
    dataTable<-c("LincsCGS","LincsCP","LincsMeta","LincsGeneInfo")
  }
  for (data in dataTable) {
    load(url(paste0("http://eh3.uc.edu/genomics/GenomicsPortals/ilincs/paslincs/", 
                    data, ".RData")))
    assign(data,get(data),envir=.GlobalEnv)
  }
    return(dataTable)
}
