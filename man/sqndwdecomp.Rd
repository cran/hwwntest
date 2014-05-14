\name{sqndwdecomp}
\alias{sqndwdecomp}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Brute-force calculation of the non-decimated squared wavelet transform.
}
\description{Accurate, but brute-force, direct (slow) calculation of the
	non-decimated squared wavelet transform.
}
\usage{
sqndwdecomp(x, J, filter.number, family)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{The sequence you want to transform
}
  \item{J}{The number of resolutions you want
}
  \item{filter.number}{The wavelet filter you  wish to use.
}
  \item{family}{The wavelet family you wish to use
}
}
\details{Works by computing the discrete wavelets and the necessary
	scales using \code{\link{hwwn.dw}} function. Then forms the
	direct inner product with the data with the squares of the
	discrete wavelets.
}
\value{
Returns a matrix of J rows and length(x) columns. Row j in the
     matrix returned corresponds to the level (nlev-j) resolution level
     coefficients (where nlev is nlevelsWT(x)) in the WaveThresh
     ordering.
}
\references{
Fryzlewicz, P., Nason, G.P. and von Sachs, R. (2008) A
     wavelet-Fisz approach to spectrum estimation.  \emph{J. Time Ser.  Anal.},
\bold{29}, 868-880.
}
\author{
Piotr Fryzlewicz (modified by Guy Nason)
}

\seealso{\code{\link{sqndwd}}
}
\examples{
#
# Generate random series and then take transform
x <- rnorm(128)
y <- sqndwdecomp(x=x, J=2, filter.number=3, family="DaubExPhase")
}
\keyword{math}
