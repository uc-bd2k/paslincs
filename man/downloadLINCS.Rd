\name{downloadLINCS}
\alias{downloadLINCS}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Download LINCS data
}
\description{
Download LINCS data
}
\usage{
downloadLINCS(dataTable = c("All", "LincsCGS", "LincsCP", "LincsMeta", "LincsGeneInfo"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataTable}{
  A character vector of types of LINCS data to be downloaded. Either \code{"All"} to download all LINCS data or any subset of \code{"LincsCGS"}, \code{"LincsCP"},\code{"LincsMeta"}, and \code{"LincsGeneInfo"} to download specific type(s) of LINCS data.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
The specified type(s) of LINCS data will be loaded in the working environment.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# download all LINCS data
downloadLINCS("All")
ls()

# download *LincsMeta* and *LincsGeneInfo*
downloadLINCS(c("LincsMeta","LincsGeneInfo"))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
