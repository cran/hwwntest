\name{hywavwn.test}
\alias{hywavwn.test}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Hybrid wavelet test of white noise.
}
\description{Combines the general wavelet test \code{\link{genwwn.test}}
	at the medium-coarse scales and the Haar wavelet test at
	fine scales.
}
\usage{
hywavwn.test(x, away.from = "standard", lowlev = 0, plot.it = FALSE,
	stopeveryscale = FALSE, filter.number = 10,
	family = "DaubExPhase", mc.method = p.adjust.methods,
	verbose = FALSE, n.cdf.grid = 1000, mac.spread = 10)
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
  \item{verbose}{If \code{TRUE} some information messages are printed.
}
  \item{n.cdf.grid}{The CDF of the Macdonald distribution is evaluated
        numerically. This argument controls the resolution of that
        grid: it controls the number of grid points there are between
        \code{-mac.spread} and \code{mac.spread}.
}
  \item{mac.spread}{Horizontal range for plotting of wavelet coefficients,
	only used if \code{plot.it=TRUE}.
}
}
\details{The \code{\link{genwwn.test}} performs pretty well, but does
	not pick up departures from the null at the finest scale of
	wavelet coefficients because it does not look at those scales
	(because of the `away.from' argument and the asymptotic normality
	that \code{\link{genwwn.test}} does not kick in at those finer
	scales). So, this test augments the \code{\link{genwwn.test}}
	with the finest scales results from \code{\link{hwwn.test}}.
	Those scales finer than \code{away.from} use the Haar wavelet
	and those coarser than \code{away.from} use the general wavelet.
}
\value{
An object of class \code{htest} with the following components.
\item{p.val.collector}{All the of unadjusted p-values}
\item{p.val.adjust}{All of the adjusted p-values}
\item{p.value}{The overall p-value of the test}
\item{method}{A text string describing the test}
\item{p.val.collector.hw}{The of unadjusted p-values from the Haar wavelet levels}
\item{p.val.collector.gw}{The of unadjusted p-values from the general wavelet levels}
}
\references{
Nason, G.P. and Savchev, D. (2014) White noise testing using
wavelets. \emph{Stat}, \bold{3}, 351-362.
\url{http://dx.doi.org/10.1002/sta4.69}
}
\author{Delyan Savchev and Guy Nason
}

\seealso{ \code{\link{genwwn.test}}, \code{\link{hwwn.test}} }

\examples{
#
# Test data
#
x <- rnorm(64)
#
# Do the test
#
answer <- hywavwn.test(x)
#
# The result in my case was:
#
#answer
#
#	Hybrid Wavelet Test of White Noise
#
#data:  
#p-value = 0.02305
}
\keyword{htest}
\keyword{ts}
