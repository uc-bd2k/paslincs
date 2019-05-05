downloadLINCS <- function(dataTable=c("All","LincsCGS","LincsCP","LincsMeta","LincsGeneInfo")) {
  if ("All" %in% dataTable) {
    load(url("http://eh3.uc.edu/genomics/GenomicsPortals/ilincs/paslincs/LincsCGS.RData"))
    load(url("http://eh3.uc.edu/genomics/GenomicsPortals/ilincs/paslincs/LincsCP.RData"))
    load(url("http://eh3.uc.edu/genomics/GenomicsPortals/ilincs/paslincs/LincsMeta.RData"))
    load(url("http://eh3.uc.edu/genomics/GenomicsPortals/ilincs/paslincs/LincsGeneInfo.RData"))
    return(mget(c("LincsCGS","LincsCP","LincsMeta","LincsGeneInfo")))
  } else {
    for (data in dataTable) {
      load(url(paste0("http://eh3.uc.edu/genomics/GenomicsPortals/ilincs/paslincs/",data,".RData")))
    }
    return(mget(dataTable))
  }
}
