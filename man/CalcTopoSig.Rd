\name{CalcTopoSig}
\alias{CalcTopoSig}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate spectral decomposition of a pathway topology
}
\description{
Calculate eigenvalues and eigenvectors of a signed undirected adjacency matrix
}
\usage{
CalcTopoSig(EdgeFrom,EdgeTo,interaction,AdjMat=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{EdgeFrom}{
  A character vector of gene symbols of one end of the topology edges. This parameter is ignored if \code{AdjMat} is specified.
  }
  \item{EdgeTo}{
  A character vector of gene symbols of the other end of the topology edges. This parameter is ignored if \code{AdjMat} is specified.
  }
  \item{interaction}{
  A numeric vector with components of 1 and -1 to denote activation and inhibition for the topology edges. This parameter is ignored if \code{AdjMat} is specified.
  }
  \item{AdjMat}{
  The signed undirected adjacency matrix for the pathway topology. This parameter is ignored if \code{(EdgeFrom,EdgeTo,interaction)} is specified.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
If the pathway topology is a balanced signed graph (no conflict in the interactions), the returned value is a list of eigenvalues and eigenvectors of the signed undirected adjacency matrix of the graph, otherwise, \code{NULL} is returned.
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
# obtain edge information of a pathway
Edges <- AllEdges[AllEdges$Pathway=="hsa04150",]

# Calculate the eigenvalues and eigenvectors by specifying edge information
CalcTopoSig(EdgeFrom=Edges$GeneSymbol_a,EdgeTo=Edges$GeneSymbol_b,interaction=Edges$Interaction)

# Calculate the eigenvalues and eigenvectors by specifying adjacency matrix
AdjMat <- CalcAdj(EdgeFrom=Edges$GeneSymbol_a,EdgeTo=Edges$GeneSymbol_b,interaction=Edges$Interaction)
CalcTopoSig(AdjMat=AdjMat)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
