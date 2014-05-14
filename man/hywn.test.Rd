\name{hywn.test}
\alias{hywn.test}
\title{Hybrid of Box-Ljung test, Bartlett B test, Haar wavelet and
	General wavelet tests.
}
\description{Omnibus test that attempts to mitigate poor performance of
	single test on a particular class where it does poorly by running
	four different tests that work well in different directions and
	pooling their results.
}
\usage{
hywn.test(x, filter.number = 10, family = "DaubExPhase")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{The data you wish to test (dyadic length)
}
  \item{filter.number}{The number of vanishing moments of the wavelet used.
}
  \item{family}{The family of the wavelets
}
}
\value{A list with components:
\item{p.value}{The overall p-value of the test}
\item{method}{Text string containing the name of the method used}
}
\references{
Nason, G.P. and Savchev, D. (2014) White noise testing using
wavelets. \emph{Stat}, \bold{3}, 351-362.
\url{http://dx.doi.org/10.1002/sta4.69}
}

\author{Delyan Savchev and Guy Nason
}

\seealso{\code{\link{bartlettB.test}},
	\code{\link{genwwn.test}},
	\code{\link{hwwn.test}}}
\examples{
#
# Generate test data
#
x <- rnorm(64)
#
# Run the hybrid test
#
hywn.test(x)
#
#	Hybrid Test
#
#data:  
#p-value = 0.09221
}
\keyword{htest}
\keyword{ts}
