\name{CalcScoreSummary}
\alias{CalcScoreSummary}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate the summarized consistency score for each gene profiles
}
\description{
Calculate the summarized consistency score which is the total value of the absolute consistency scores of a gene profile for each connected sub-network.
}
\usage{
CalcScoreSummary(EdgeFrom, EdgeTo, interaction, AdjMat = NULL, ncomp = NULL, data, neigen = NULL)
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
  \item{ncomp}{
  The pre-specified number of graph components used to calculate the consistency score. Default is using all components.
  }
  \item{data}{
  A numeric matrix of gene expression levels, with rows as gene profiles and columns as knockdown genes in the pathway (column names are the knockdown gene symbols).
  }
  \item{neigen}{
  The maximum number of eigen vectors used to calculate gene scores. Default is using all eigen vectors.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
The summarized consistency score is returned as a data frame with two columns. The first column is the annotations of the profile genes, and the second column is the summarized consistency score.
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
# load data
downloadLINCS("LincsCGS")
Data <- LincsCGS$MCF7

# obtain edge information of a pathway
Edges <- AllEdges[AllEdges$Pathway=="hsa04150",]

# calculate summarized consistency score by specifying edge information
CalcScoreSummary(EdgeFrom=Edges$GeneSymbol_a,EdgeTo=Edges$GeneSymbol_b,interaction=Edges$Interaction,data=Data,neigen=1)

# calculate summarized consistency score by specifying adjacency matrix
AdjMat <- CalcAdj(EdgeFrom=Edges$GeneSymbol_a,EdgeTo=Edges$GeneSymbol_b,interaction=Edges$Interaction)
CalcScoreSummary(AdjMat=AdjMat,data=Data,neigen=1)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
