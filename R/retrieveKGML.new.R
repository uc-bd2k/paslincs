retrieveKGML.new <- function (pathwayid, organism, destfile, method = "auto", ...)
{
    kgml <- paste0("http://rest.kegg.jp/get/",pathwayid,"/kgml")
    download.file(kgml, destfile = destfile, method = method,
        ...)
    return(invisible(kgml))
}
