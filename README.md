# paslincs R package
## About
The package implements the pathway activity signatures from LINCS data (pasLINCS) methodology for analysis of signaling pathways targeted by a perturbation. [The paper describing the methodology can found here](https://www.biorxiv.org/content/10.1101/705228v2). The package is distributed under MIT open source license (see LICENSE file). The example code for using the package is provided in the Workflow_pasLINCS_UseCaseI.Rmd RStudio notebook. [The knitted result of the notebook can be viewed here](http://htmlpreview.github.io/?https://github.com/uc-bd2k/paslincs/blob/master/Workflow_pasLINCS_UseCase.html).  


## Installation
Step 0. Install "devtools" package. (Skip this step if "devtools" is already installed.)
```{r}
install.packages("devtools")
```
Step 1. Install "paslincs" package.
```{r}
library(devtools)
install_github("uc-bd2k/paslincs")
```

## Using paslincs package
Please refer to the [Workflow_pasLINCS_UseCaseI.Rmd](http://htmlpreview.github.io/?https://github.com/uc-bd2k/paslincs/blob/master/Workflow_pasLINCS_UseCase.html) RStudio notebook. 
