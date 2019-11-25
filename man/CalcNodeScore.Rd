\name{CalcNodeScore}
\alias{CalcNodeScore}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate the node contribution score
}
\description{
Calculate the node contribution score
}
\usage{
CalcNodeScore(EdgeFrom,EdgeTo,interaction,ncomp=NULL,neigen=NULL,data,node)
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
  \item{ncomp}{
  The pre-specified number of sub-graphs used to calculate the consistency score. Default is using all sub-graphs.
  }
  \item{neigen}{
  The maximum number of eigen sub-spaces used to calculate gene scores. Default is using all eigen sub-spaces.
  }
  \item{data}{
  A data frame of gene expression levels, with rows for profile genes and columns for perturbed pathway genes/proteins (column names are the perturbed gene/protein symbols).
  }
  \item{node}{
  A character value of the gene symbol of the node of interest.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A data frame with two columns is returned: the first column is the annotation of the profile genes, and the second column is the node contribution score. In either one of the following two situations, \code{NULL} will be returned instead of the data frame: 1) the node of interest is not within the perturbed gene/protein list in the data; 2) at least one of the consistency score data frames for the topologies with and without the node of interest is \code{NULL}.
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

# define a node of interest
Node <- "MTOR"

# calculate node contribution score
CalcNodeScore(EdgeFrom=Edges$GeneSymbol_a,EdgeTo=Edges$GeneSymbol_b,interaction=Edges$Interaction,ncomp=NULL,neigen=1,data=Data,node=Node)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
