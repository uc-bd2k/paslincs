\name{retrieveKGML.new}
\alias{retrieveKGML.new}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Retrieve the KGML file of a KEGG pathway
}
\description{
Retrieve the KGML file of a KEGG pathway
}
\usage{
retrieveKGML.new(pathway, organism, destfile, method = "auto", ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pathway}{
  A character value of KEGG pathway ID as in \code{\link{EdgeInfo}}.
  }
  \item{organism}{
  A character value of the three- or four-letter KEGG organism code (see organism code at: \url{https://www.genome.jp/kegg-bin/get_htext?br08601.keg}).
  }
  \item{destfile}{
  The output file, to which the KGML file is saved.
  }
  \item{method}{
  A character value of the method used to download file. Default is "auto". See details of \code{KEGGgraph::retrieveKGML} (\url{https://www.rdocumentation.org/packages/KEGGgraph/versions/1.30.0/topics/getKGMLurl}).
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
The KGML file is saved in the specified file \code{destfile}.
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
tmp<- tempfile()
retrieveKGML.new("hsa04150","hsa",tmp)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
