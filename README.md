Package: paslincs
Type: Package
Title: Pathway activity signatures from LINCS L1000 consensus gene signatures
Version: 1.2.0
Authors: Yan Ren (yan.ren@uc.edu), Mario Medvedovic (mario.medvedovic@uc.edu)
Depends: R (>= 3.4.4),igraph,org.Hs.eg.db,annotate,KEGGgraph,KEGGREST,KEGGlincs
Description: This package provides functions and data for related calculation and analysis of pathway activity signature (PAS). The KEGG pathway topology information is downloaded on Oct 20, 2018. 
License: GPL (>= 2)
Encoding: UTF-8
LazyData: true


## Installation
First make sure the R package "devtool" is installed, then the following two lines running in R will install the "paslincs" package: 

library(devtools)

install_github("uc-bd2k/paslincs")


## Using paslincs package
Please refer to the .Rmd file in this repository "Workflow_pasLINCS_UseCaseI.Rmd" for the illustration of using "paslincs" package.
