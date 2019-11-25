\name{EdgeInfo}
\alias{EdgeInfo}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Parse the protein-protein interactions of a KEGG pathway
}
\description{
Parse the protein-protein inhibition/activation interactions of a KEGG pathway
}
\usage{
EdgeInfo(pathway)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pathway}{
  A character value of KEGG pathway ID, e.g. \code{"hsa04150"}. \code{pathway} must be specified with the three- or four-letter KEGG organism code (see organism code at: \url{https://www.genome.jp/kegg-bin/get_htext?br08601.keg}).
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A data frame is returned with six columns:
  \item{Subtype}{
  Type of the protein-protein interaction, either \code{"activation"} or \code{"inhibition"}.
  }
  \item{GeneID_a}{
  Gene ID of one end of protein-protein interactions.
  }
  \item{GeneID_b}{
  Gene ID of the other end of protein-protein interactions.
  }
  \item{GeneSymbol_a}{
  Gene symbol of one end of protein-protein interactions.
  }
  \item{GeneSymbol_b}{
  Gene symbol of the other end of protein-protein interactions.
  }
  \item{Interaction}{
  Code of the types of protein-protein interactions. The value \code{"1"} corresponds to \code{"activation"}, and \code{"-1"} corresponds to \code{"inhibition"}.
  }

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
EdgeInfo("hsa04150")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
