\name{hwwn.test}
\alias{hwwn.test}
\title{Perform a test for white noise on a time series.
}
\description{Often one wishes to know whether a time series is consistent
	with a white noise model. This function tests whether the underlying
	spectrum of the time series is flat, which is identical to saying
	that all the autocorrelations of the series are zero (apart from
	the lag zero autocorrelation which is always one). This test
	is exact for Gaussian data but will also work well with heavy-tailed
	distributions whose periodogram tends to the exponential distribution
	asymptotically (see accompanying paper for details). 
}
\usage{
hwwn.test(x, lowlev = 0, plot.it = FALSE, stopeveryscale = FALSE,
	n.cdf.grid = 1000, mc.method = p.adjust.methods, mac.spread=10)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{The data set you wish to test. For now, the length of this
	series has to be a power of two. In theory, it could be any length.
}
  \item{lowlev}{Specifies the coarsest resolution level of wavelet coefficients
	computed on the spectrum. Typically, this should be left at one,
	which is the coarsest that can be achieved an still approximate
	the CDF
}
  \item{plot.it}{If \code{TRUE} then plots of the wavelet coefficients
	and their modelled underlying distribution are plotted,
	and their cumulative distributions and the resultant p-values
	as a histogram for each scale. Theoretical values are in red
	and data estimated values in black.
}
  \item{stopeveryscale}{If \code{TRUE} the code stops after every plot
	if \code{plot.it==TRUE}. This is a way of ensuring that the
	human can see every plot to stop it whizzing off the screen.
	Simply press ENTER to continue.
}
  \item{n.cdf.grid}{The CDF of the Macdonald distribution is evaluated
	numerically. This argument controls the resolution of that
	grid: it controls the number of grid points there are between
	\code{-mac.spread} and \code{mac.spread}.
}
  \item{mc.method}{The method of multiple hypothesis comparison.
	See \code{p.adjust} for details.
}
  \item{mac.spread}{The range (from \code{-mac.spread} to \code{mac.spread})
	that the CDF of the Macdonald distribution is computed on.
}
}
\details{The null hypothesis of the test contained in this function
	is H_0: series is white noise (or constant spectrum) versus
	H_A: it is not white noise.
	This test works by assessing whether the spectrum of the
	underlying series is constant or not. It does this by
	first computing the periodogram of the sample series. This
	is a well-studied estimate of the spectrum. Then it evaluates
	the constancy of the spectrum by examining the Haar wavelet
	coefficients of the periodogram. Under normality much is known
	about the asymptotic distribution of the periodogram and this
	can be transferred, through some moderately complex distribution
	theory to the distribution of the Haar wavelet coefficients
	of the periodogram. Hence, in this situation, we have a good handle
	on whether a particular wavelet coefficients is too large or
	to small as we have near theoretical knowledge of their
	CDF. Since we are testing many wavelet coefficients simultaneously
	we have to use multiple hypothesis p-value adjustment techniques,
	such as Bonferroni to obtain a final p-value.
}
\value{An object of class \code{htest} containing the results of
	the hypothesis test. Actually a list containing the following
	components:
\item{p.val.collector}{All the p-values for all Haar wavelet coefficients
	of the periodogram. These are the values before p-value adjustment
	for multiple tests.}

\item{p.val.adjust}{The p-values after adjustment for multiple tests via
	\code{p.adjust}.}

\item{p.value}{The p-value of the test}
\item{method}{Character string describing the test.}
}
\references{
Nason, G.P. and Savchev, D. (2014) White noise testing using
wavelets. \emph{Stat}, \bold{3}, 351-362.
\doi{10.1002/sta4.69}
}
\author{Delyan Savchev and Guy Nason
}

\seealso{\code{\link{compute.rejection}}, \code{\link{Macdonald}}
}
\examples{
#
# Invent test data set which IS white noise
#
x <- rnorm(128)
#
# Do the test
#
x.wntest <- hwwn.test(x)
#
# Print the results
#
#x.wntest
#
#	Wavelet Test of White Noise
#
#data:  
#p-value = 0.9606
#
# So p-value indicates that there is no evidence for rejection of
# H_0: white noise.
#
# Let's do an example using data that is not white noise. E.g. AR(1)
#
x.ar <- arima.sim(n=128, model=list(ar=0.8))
#
# Do the test
#
x.ar.wntest <- hwwn.test(x.ar)
#
# Print the results
#
print(x.ar.wntest)
#
#	Wavelet Test of White Noise
#
#data:  
#p-value < 2.2e-16
#
# p-value is very small. Extremely strong evidence to reject H_0: white noise
}
\keyword{htest}
\keyword{ts}
