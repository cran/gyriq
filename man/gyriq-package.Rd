% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gyriq.R
\docType{package}
\name{gyriq-package}
\alias{gyriq}
\alias{gyriq-package}
\title{Kinship-Adjusted Survival SNP-Set Analysis}
\description{
SNP-set association testing for censored phenotypes in the presence of 
intrafamilial correlation
}
\details{
\tabular{ll}{
Package: \tab gyriq\cr
Type: \tab Package\cr
Version: \tab 1.0.2\cr
Date: \tab 2016-01-06\cr
License: \tab GPL (>= 2) \cr
}

This variance-components test between a set of SNPs and a survival trait
is valid for both common and rare variants. A proportional hazards Cox model 
(written as a transformation model with censored data; Cheng et al., 1995)
is specified for the marginal distribution of the survival trait. The 
familial dependence is modelled via a Gaussian copula with a correlation 
matrix expressed in terms of the kinship matrix. The statistical procedure
has been described in full detail by Leclerc et al. (2015).

Censored values are treated as partially missing data and a multiple 
imputation procedure is employed to estimate vectors of residuals. These 
residuals and the SNPs in the genomic region under study are used to 
compute measures of phenotypic and genotypic similarity between pairs of 
subjects. The contribution to the score statistic is maximal when these 
measures are both high which corresponds to departure from the null 
hypothesis of no association between the set of SNPs and the survival 
outcome. The selection of the SNPs forming the SNP set can be based on 
biological information such as linkage disequilibrium (LD) blocks or rely on 
a sliding window method.

The procedure is convenient for GWAS as the multiple imputation procedure
for the estimation of a completed vector of residuals has to be performed 
only once using the function \link{genComplResid}. A sliding window approach
can then be used to examine the evidence of association across the SNP set. 
In each run, the p-value is computed with the function \link{testGyriq}.
}
\examples{
data(simGyriq)
for (i in seq_along(simGyriq)) assign(names(simGyriq)[i], simGyriq[[i]])

cr <- genComplResid(U, Delta, Phi, blkID, m=50, X)
testGyriq(cr$compResid, G, w, ker="LIN", asv=NULL, method="davies", 
starResid=NULL, bsw, tsw, pos)
}
\author{
Martin Leclerc <martin.leclerc.5@ulaval.ca> and Lajmi Lakhal Chaieb 
<lakhal@mat.ulaval.ca>
}
\references{
Cheng SC, Wei LJ, Ying Z. 1995. Analysis of transformation models
with censored data. Biometrika 82:835-845.

Leclerc M, The Consortium of Investigators of Modifiers of BRCA1/2, Simard J, 
Lakhal-Chaieb L. 2015. SNP set association testing for survival outcomes in 
the presence of intrafamilial correlation. Genetic Epidemiology 39:406-414.

Lin X, Zhou Q. 2015. coxKM: Cox kernel machine SNP-set association test. R 
package version 0.3, URL http://www.hsph.harvard.edu/xlin/software.html#coxkm.

Lin X, Cai T, Wu M, Zhou Q, Liu G, Christiani D, Lin X. 2011. Survival 
kernel machine SNP-set analysis for genome-wide association studies. Genetic 
Epidemiology 35:620-631.

Cai T, Tonini G, Lin X. 2011. Kernel machine approach to testing the 
significance of multiple genetic markers for risk prediction. Biometrics 
67:975-986.
}
\keyword{package}

