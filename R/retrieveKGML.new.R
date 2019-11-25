retrieveKGML.new <- function (pathway, organism, destfile, method = "auto", ...)
{
    kgml <- paste0("http://rest.kegg.jp/get/",pathway,"/kgml")
    download.file(kgml, destfile = destfile, method = method,
        ...)
    return(invisible(kgml))
}
