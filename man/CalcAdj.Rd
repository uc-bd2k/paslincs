\name{CalcAdj}
\alias{CalcAdj}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate the adjacency matrix
}
\description{
Calculate the adjacency matrix of the signed undirected graph of the pathway topology
}
\usage{
CalcAdj(EdgeFrom,EdgeTo,interaction)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{EdgeFrom}{
  A character vector of gene symbols of one end of the edges. 
  }
  \item{EdgeTo}{
  A character vector of gene symbols of the other end of the edges. 
  }
  \item{interaction}{
  A numeric vector with components of 1 and -1 to denote activation and inhibition for the edges. 
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
If the graph of the pathway topology is balanced (no conflict in the interactions), then a numeric adjacency matrix is returned. The row names and column names are the nodes in the pathway.
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

# calculate the signed adjacency matrix of the pathway topology
CalcAdj(EdgeFrom=Edges$GeneSymbol_a,EdgeTo=Edges$GeneSymbol_b,interaction=Edges$Interaction)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
