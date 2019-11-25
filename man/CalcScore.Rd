\name{CalcScore}
\alias{CalcScore}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate consistency score
}
\description{
Calculate consistency score
}
\usage{
CalcScore(EdgeFrom,EdgeTo,interaction,AdjMat=NULL,ncomp=NULL,data,neigen=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{EdgeFrom}{
  A character vector of gene symbols of one end of the edges. This parameter is ignored if \code{AdjMat} is specified.
  }
  \item{EdgeTo}{
  A character vector of gene symbols of the other end of the edges. This parameter is ignored if \code{AdjMat} is specified.
  }
  \item{interaction}{
  A numeric vector with components of 1 and -1 to denote activation and inhibition for the edges. This parameter is ignored if \code{AdjMat} is specified.
  }
  \item{AdjMat}{
  The signed undirected adjacency matrix for the pathway topology. 
  }
  \item{ncomp}{
  The pre-specified number of sub-graphs used to calculate the consistency score. Default is using all sub-graphs.
  }
  \item{data}{
  A data frame of gene expression levels, with rows for profile genes and columns for perturbed pathway genes/proteins (column names are the perturbed gene/protein symbols).
  }
  \item{neigen}{
  The maximum number of eigen sub-spaces used to calculate gene scores. Default is using all eigen sub-spaces.
  }
}
\details{
}
\value{
The consistency score is returned as a list with the length of \code{ncomp} (if specified) or the number of sub-graphs in the pathway graph. Each element of the list is either \code{NULL} or a data frame. There are three reasons to cause the returned consistency score to be \code{NULL}: 1) There is a conflict in the topology; 2) Not sufficient data to calculate the consistency score (less than 2 perturbed genes/proteins connected in the graph); 3) pre-specified \code{neigen} is greater than the number of nodes in the graph. The data frame of the non-null score has two columns for the profile gene annotations (rowname of \code{data}) and the consistency scores, respectively.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# load data
downloadLINCS("LincsCGS")
Data <- LincsCGS$MCF7

# obtain edge information of a pathway
Edges <- AllEdges[AllEdges$Pathway=="hsa04150",]

# calculate consistency score by specifying edge information
CalcScore(EdgeFrom=Edges$GeneSymbol_a,EdgeTo=Edges$GeneSymbol_b,interaction=Edges$Interaction,data=Data,neigen=1)

# calculate consistency score by specifying adjacency matrix
AdjMat <- CalcAdj(EdgeFrom=Edges$GeneSymbol_a,EdgeTo=Edges$GeneSymbol_b,interaction=Edges$Interaction)
CalcScore(AdjMat=AdjMat,data=Data,neigen=1)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
