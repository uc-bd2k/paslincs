\name{CalcScoreSummary}
\alias{CalcScoreSummary}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate the summarized consistency score for each gene profiles
}
\description{
Calculate the summarized consistency score which is the sum of the consistency scores for all considered sub-graphs.
}
\usage{
CalcScoreSummary(EdgeFrom, EdgeTo, interaction, AdjMat = NULL, ncomp = NULL, data, neigen = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  item{EdgeFrom}{
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
