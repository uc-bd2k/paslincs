\name{CalcTPSig}
\alias{CalcTPSig}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate the association signature by using topology information only
}
\description{
Calculate the association signature of a pathway to chemical perturbation signatures
}
\usage{
CalcTPSig(EdgeInfo,pathway="Pathway",EdgeFrom="GeneSymbol_a",EdgeTo="GeneSymbol_b",interaction="Interaction",ncomp=NULL,data,neigen=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{EdgeInfo}{
  A data frame containing interaction information of all pathways. Four columns are required in this data frame: pathway annotations, gene symbols of one end of the edges, gene symbols of the other end of the edges, interaction types of the edges. 
  }
  \item{pathway}{
  A character value for the column name of the pathway ID in the dataframe *EdgeInfo*. Default is "Pathway".
  }
  \item{EdgeFrom}{
  A character value for the column name of one end of the edges in the dataframe *EdgeInfo*. Default is "GeneSymbol_a".
  }
  \item{EdgeTo}{
  A character value for the column name of the other end of the edges in the dataframe *EdgeInfo*. Default is "GeneSymbol_b".
  }
  \item{interaction}{
  A numeric value for the column name of the interaction type in the dataframe *EdgeInfo*. Default is "Interaction".
  }
  \item{ncomp}{
  The pre-specified number of sub-graphs used to calculate the consistency score. Default is to use all sub-graphs.
  }
  \item{data}{
  A data frame of gene expression levels, with rows for profile genes and columns for chemical perturbations.
  }
  \item{neigen}{
  The maximum number of eigen sub-spaces used to calculate gene scores. Default is using all eigen sub-spaces.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
The association signature is returned as a data frame with two columns. The first column is the annotations of the chemical perturbations, and the second column is the association scores, which is a measure of the association of a pathway to the perturbations.
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
