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
EdgeInfo(pathwayid)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pathwayid}{
  A character value of KEGG pathway ID, e.g. \code{"hsa04150"}. \code{pathway} must be specified with the three- or four-letter KEGG organism code (see organism code at: \url{https://www.genome.jp/kegg-bin/get_htext?br08601.keg}).
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A data frame is returned with eight columns:
  \item{from}{
  Gene identifier with orginism code for one end of a protein-protein interaction.
  }
  \item{to}{
  Gene identifier with orginism code for the other end of a protein-protein interaction.
  }
  \item{subtype}{
  Type of the protein-protein interaction, either \code{"activation"} or \code{"inhibition"}.
  }
  \item{GeneID_a}{
  Gene ID of one end of a protein-protein interaction.
  }
  \item{GeneID_b}{
  Gene ID of the other end of a protein-protein interaction.
  }
  \item{Interaction}{
  Code of the type of the protein-protein interaction. The value \code{"1"} corresponds to \code{"activation"}, and \code{"-1"} corresponds to \code{"inhibition"}.
  }
  \item{GeneSymbol_a}{
  Gene symbol of one end of a protein-protein interaction.
  }
  \item{GeneSymbol_b}{
  Gene symbol of the other end of a protein-protein interaction.
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
