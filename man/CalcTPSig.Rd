\name{CalcTPSig}
\alias{CalcTPSig}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate the association signature by using topology information only
}
\description{
Calculate the association signature of a pathway to perturbation signatures
}
\usage{
CalcTPSig(EdgeInfo,EdgeFrom="GeneSymbol_a",EdgeTo="GeneSymbol_b",pathway="Pathway",interaction="Interaction",ncomp=NULL,data,neigen=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{EdgeInfo}{
  A dataframe containing interaction information of all pathways. There are at least three columns for the gene symbols of each end of an interaction and the interaction type. 
  }
  \item{EdgeFrom}{
  A character value for the column name of one end of the edges in the dataframe *EdgeInfo*. Default is "GeneSymbol_a".
  }
  \item{EdgeTo}{
  A character value for the column name of the other end of the edges in the dataframe *EdgeInfo*. Default is "GeneSymbol_b".
  }
  \item{pathway}{
  A character value for the column name of the pathway ID in the dataframe *EdgeInfo*. Default is "Pathway".
  }
  \item{interaction}{
  A numeric value for the column name of the interaction type in the dataframe *EdgeInfo*. Default is "Interaction".
  }
  \item{ncomp}{
  The pre-specified number of graph components used to calculate the consistency score. Default is to use all components.
  }
  \item{data}{
  A numeric matrix of gene expression levels, with rows as gene profiles and columns as perturbations.
  }
  \item{neigen}{
  The maximum number of eigen vectors used to calculate gene scores. Default is to use all eigen vectors.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
The correlation signature is returned as a data frame with two columns. The first column is the annotations of the perturbations, and the second column is the pathway activity scores, which is a measure of the correlations of a pathway to the perturbations.
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
downloadLINCS("LincsCP")
Data <- LincsCP$MCF7

# calculate the association signature 
CalcTPSig(EdgeInfo=AllEdges,data=Data,neigen=1)

# calculate the association signature for a specific pathway
pathway <- "hsa04150"
edge <- AllEdges[AllEdges$Pathway==pathway,]
CalcTPSig(EdgeInfo=edge,data=Data,neigen=1)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
