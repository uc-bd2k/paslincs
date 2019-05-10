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
  A character vector of gene symbols of one end of the topology edges. This parameter is ignored if \code{AdjMat} is specified.
  }
  \item{EdgeTo}{
  A character vector of gene symbols of the other end of the topology edges. This parameter is ignored if \code{AdjMat} is specified.
  }
  \item{interaction}{
  A numeric vector with components of 1 and -1 to denote activation and inhibition for the topology edges. This parameter is ignored if \code{AdjMat} is specified.
  }
  \item{ncomp}{
  The pre-specified number of graph components used to calculate the consistency score. Default is using all components.
  }
  \item{neigen}{
  The maximum number of eigen vectors used to calculate gene scores. Default is using all eigen vectors.
  }
  \item{data}{
  A numeric matrix of gene expression levels, with rows as gene profiles and columns as knockdown genes in the pathway (column names are the knockdown gene symbols).
  }
  \item{node}{
  A character value of the gene symbol of the node of interest.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A data frame with two columns is returned: the first column is the annotation of the profiled genes, and the second column is the node contribution score. In either one of the following two situations, \code{NULL} will be returned instead of the data frame: 1) the data does not contain the column of knocking down the node of interest; 2) the consistency score data frame(s) of the signature genes for the topology with and/or without the node of interest is/are \code{NULL}.
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
