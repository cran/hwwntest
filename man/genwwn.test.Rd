\name{genwwn.test}
\alias{genwwn.test}
\title{White noise test using general wavelets.
}
\description{Performs test for white noise using a general wavelet
	decomposition of a normalized periodogram.
}
\usage{
genwwn.test(x, away.from = "standard", lowlev = 0, plot.it = FALSE,
	stopeveryscale = FALSE, filter.number = 10,
	family = "DaubExPhase", mc.method = p.adjust.methods,
	mac.spread = 10, verbose = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{The time series you wish to test (of dyadic length).
}
  \item{away.from}{Number of fine scales to stay away from, see details below.
	If "standard" then this is automatically computed for sample sizes
	up to length of 1024. If you have a longer series then the test
	will still work but might not be quite as powerful (but probably
	not too bad either).
}
  \item{lowlev}{The coarsest coefficient to evaluate. This should
	always be left at 0. 
}
  \item{plot.it}{If TRUE then a series of plots similar to the ones produced
	in the \code{\link{hwwn.test}} function is produced. See that help
	page for further details on what the plots show.
}
  \item{stopeveryscale}{If TRUE then if \code{plot.it=TRUE} then a
	`scan' is issued after every plot. Just hit RETURN to continue.
}
  \item{filter.number}{The number of vanishing moments of the wavelet
	used to compute coefficients that are then evaluated to see whether
	they are zero. In principle, best compression for a sparse evaluation
	of the normalized spectrum should mean we use the smoothest wavelets
	with the highest number of vanishing moments which is ten. The
	other components of the function are optimized for ten vanishing
	moments. The function will still work for other numbers of vanishing
	moments but maybe with slightly reduced power.
}
  \item{family}{Wavelet family to go with \code{filter.number}.
}
  \item{mc.method}{The type of multiple hypothesis correction, see
	\code{p.adjust} for details.
}
  \item{mac.spread}{Horizontal range for plotting of wavelet coefficients,
	only used if \code{plot.it=TRUE}.
}
  \item{verbose}{If \code{TRUE} some information messages are printed.
}
}
\details{This function computes the normalized periodogram, and then
	subjects it to a wavelet transform with respect to any wavelet
	(in wavethresh). Under the null hypothesis of white noise
	the coefficients should all close to zero and this function
	works out, for each coefficient, how close statistically it is
	to zero by assuming a Gaussian null distribution with mean zero
	and variance one. Then the multiple p-values from each of these
	tests are adjusted for multiple hypothesis test by using the
	\code{p.adjust} function before returning an overall p-value
	for the test. The test has been optimized for using the
	\code{filter.number=10} wavelet and \code{away.from="standard"},
	but should work pretty well for other wavelets and even away.from
	values of more than 2-3 for moderate numbers of scales, and potentially
	higher for longer data sets. 

	An approximation to the theoretical power of this test
	can be obtained using the \code{\link{genwwn.thpower}} function.
}
\value{An object of class \code{htest} with the following components.
\item{p.val.collector}{All the of unadjusted p-values}
\item{p.val.adjust}{All of the adjusted p-values}
\item{p.value}{The overall p-value of the test}
\item{method}{A text string describing the test}
}

\references{
Nason, G.P. and Savchev, D. (2014) White noise testing using
wavelets. \emph{Stat}, \bold{3}, 351-362.
\doi{10.1002/sta4.69}
}

\author{Delyan Savchev and Guy Nason
}

\seealso{\code{\link{compute.rejection}},
	\code{\link{genwwn.thpower}} }
\examples{
#
# Generate test set, of dyadic length
#
x <- rnorm(64)
#
# Do the test:
#
answer <- genwwn.test(x)
#
# What do we get?
#
#answer
#
#	Wavelet Test of White Noise
#
#data:  
#p-value = 0.4629
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{htest}
\keyword{ts}
