\name{bartlettB.test}
\alias{bartlettB.test}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Bartlett's B test for white noise 
}
\description{Bartlett's test uses the Kolmogorov-Smirnov test applied
	to the cumulative normalized periodogram.
}
\usage{
bartlettB.test(x, plot.it = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{The time series you wish to test, of any length.
}
  \item{plot.it}{If TRUE then the normalized cumulative periodogram
	is plotted along with a straight line that indicates the theoretical
	line of this object under the null hypothesis. A further plot
	of the density of the true statistic under the null hypothesis is
	produced. 
}
}
\details{This test: (i) computes the periodogram, (ii) derives the
	normalized cumulative periodogram using the
	\code{\link{cumperiod}} function. Under the null hypothesis
	of white noise the periodogram is a set of iid exponential
	random variables, asymptotically. So, the cumulative periodogram
	should look like a straight line at a 45 degree angle.
	The test statistic is the maximum deviation of the normalized
	cumulative periodogram and this straight line. The p-value of
	the test is computed within the function by the \code{b.power}
	function. This is an example of a Kolmogorov-Smirnov statistical
	test.
}
\value{An object of class \code{htest}. A list containing the following
components:
\item{statistic}{The value of the Bartlett test statistic.}
\item{p.value}{The p-value of the test}
\item{method}{A text string saying what the method was}
}
\references{
Bartlett, M.S. (1967) Some Remarks on the Analysis of Time-Series.
\emph{J. R. Statist. Soc. B}, \bold{54}, 25-38.

\url{http://www.stat.tamu.edu/~jnewton/stat626/topics/topics/topic13.pdf} Link to Professor H. Joseph Newton's web page on Bartlett's test

Nason, G.P. and Savchev, D. (2014) White noise testing using
wavelets. \emph{Stat}, \bold{3}, 351-362.
\url{http://dx.doi.org/10.1002/sta4.69}
}
\author{
G. P. Nason
}
\note{Code was based on Professor Newton's explanation
}


\seealso{\code{\link{compute.rejection}}, \code{\link{cumperiod}}
}
\examples{
#
# Do white noise test on smallish data set
#
x <- rnorm(30)
bartlettB.test(x)
#
# For my realization the answer was:
#
#
#	Bartlett B Test for white noise
#
#data:  
#= 0.3747, p-value = 0.999
#
# So, we accept H_0
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ts}
