\name{d00.test}
\alias{d00.test}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Test for white noise based on the coarsest scale Haar
	wavelet coefficient of the spectrum.
}
\description{Computes the coarsest scale Haar wavelet coefficient
	of the periodogram but directly using a formula based on
	a particular linear combination of autocorrelation coefficients. 
	Then performs a hypothesis test by comparing the test statistic
	to a standard normal distribution.
}
\usage{
d00.test(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{The time series you want to test, of arbitrary length.
}
}
\value{An object of class \code{htest} containing the following components.
\item{statistic}{The test statistic}
\item{p.value}{The p-value of the test}
\item{method}{A test string indicating the method}
}

\references{
Nason, G.P. and Savchev, D. (2014) White noise testing using
wavelets. \emph{Stat}, \bold{3}, 351-362.
\doi{10.1002/sta4.69}
}

\author{Delyan Savchev and Guy Nason
}

\seealso{\code{\link{compute.rejection}},\code{\link{hwwn.test}}
}

\examples{
#
# Test data set
#
x <- rnorm(30)
#
#
answer <- d00.test(x)
#
# My answer was:
#
#	d00 test on acfs
#
#data:  
#= -1.696, p-value = 0.08989
}
\keyword{ts}
