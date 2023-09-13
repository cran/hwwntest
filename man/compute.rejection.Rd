\name{compute.rejection}
\alias{compute.rejection}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Function to compute empirical size or power for various
	tests of white noise. 
}
\description{Can generate white noise sequences, or ARMA time series
	and subject multiple realizations of these to various tests for
	white noise. The function then counts how many have
	been rejected to give some idea of empirical size (if no \code{ar}
	or \code{ma} term is specified) or power (if such terms are specified). 
}
\usage{
compute.rejection(ar = NULL, ma = NULL, npow = 100, nom.size = 0.05,
	ndata = 1024, lapplyfn = lapply, Box.lag = 1, rand.gen = rnorm,
	hwwn = TRUE, box = TRUE, bartlett = TRUE, 
	d00test = TRUE, genwwn = TRUE, hywn = TRUE, hywavwn = TRUE,
	filter.number = 10, family = "DaubExPhase",
	away.from = "standard", ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ar}{Any autoregressive terms to go directly to the
	\code{arima.sim} function. Leave as it is if you wish to
	simulate white noise.
}
  \item{ma}{As \code{ar} but for moving average terms.
}
  \item{npow}{The number of realizations to carry out. The best
	assessments are carried out with high values of \code{npow},
	e.g. 1000 or even 10000. 
}
  \item{nom.size}{The nominal statistical size of the test. Note: this
	does not change the nomimal size for ALL tests. You need to check
	each help pages for each function to check what can be changed.
}
  \item{ndata}{The length of the white noise or ARMA realizations.
	Power for both these tests depends on sample size.
}
  \item{lapplyfn}{If you have the library \code{parallel} and a suitable
	multicore machine then this function can run the realizations
	in parallel. If so, then you can change this argument to
	\code{lapplyfn=mclapply} to take advantage of this.
}
  \item{Box.lag}{The Box test tests for white noise by examining
	autocorrelation coefficients. This argument specifies the max number
	of autocorrelation coefficients, ie. coefficients from lag 1 up
	to \code{Box.lag}.
}
  \item{rand.gen}{Alternative innovation generator. By default Gaussian
	innovations are used, but you can specify alternatives to get
	heavy-tailed innovations, for example. 
}
  \item{hwwn}{If TRUE then the \code{\link{hwwn.test}} will be evaluated,
	if FALSE then it won't be. 
}
  \item{box}{If TRUE then the \code{\link{Box.test}} will be evaluated,
	if FALSE then it won't be. 
}
  \item{bartlett}{If TRUE then the \code{\link{bartlettB.test}}
	will be evaluated,
	if FALSE then it won't be. 
}
  \item{d00test}{If TRUE then the \code{\link{d00.test}}
	will be evaluated, if FALSE then it won't be. 
}
  \item{genwwn}{If TRUE then the \code{\link{genwwn.test}}
	will be evaluated, if FALSE then it won't be. 
}
  \item{hywn}{If TRUE then the \code{\link{hywn.test}}
	will be evaluated, if FALSE then it won't be. 
}
  \item{hywavwn}{If TRUE then the \code{\link{hywavwn.test}}
	will be evaluated, if FALSE then it won't be. 
}
 \item{filter.number}{The number of vanishing moments of wavelets
	used in the general wavelet tests (genwwn, hywn and hywavwn).
}
  \item{family}{Wavelet family, as for \code{filter.number} argument.
}
  \item{away.from}{The number of finer scales not to use for the
	general wavelet tests. These tests work by relying on the
	asymptotic normality of wavelet coefficients, but this only
	becomes useful away from the finer scales. This argument
	can be an integer in which case it defines the number of fine
	scales to ignore. Alternatively, you can supply the argument
	\code{"standard"} which chooses an automatically selected number
	of scales to stay away from which works well up to time series
	in length of 1000. Better performance can be obtained for
	series longer than 1000 by adapting the \code{away.from} argument.
}
  \item{...}{Other arguments to \code{\link{hwwn.test}}.
}
}
\details{This function repeatedly runs the hypothesis tests on 
	realizations from a stochastic process which can be white
	noise (if \code{ar} and \code{ma} are \code{NULL}) or an ARMA
	process specified by \code{ar} and \code{ma}. It then counts how
	many times the null was rejected and returns this as proportion
	of the total number of realizations. In this way, this function
	can compute the empirical size and power of the tests.
}
\value{A list with eight components. Each component is a number, between
	zero and one, which corresponds to the empirical size or power
	of each test. Note, if any component is \code{NULL} this means
	that it was not evaluated and was `turned off' in the command
	line by setting its name equal to \code{FALSE}.
}

\references{
Nason, G.P. and Savchev, D. (2014) White noise testing using
wavelets. \emph{Stat}, \bold{3}, 351-362.
\doi{10.1002/sta4.69}
}
\author{Delyan Savchev and Guy Nason
}

\seealso{\code{\link{bartlettB.test}},
	\code{\link{d00.test}},
	\code{\link{genwwn.test}},
	\code{\link{hwwn.test}}, 
	\code{\link{hywn.test}},
	\code{\link{hywavwn.test}}
}
\examples{
#
# Compute empirical size of both tests using 1000 realizations
# with data of length 32
#
answer <- compute.rejection(npow=100, ndata=32)
#
# Print the answer
#
print(answer)
#$hwwntest.rejprop
#[1] 0.03
#
#$box.rejprop
#[1] 0.02
#
#$bartlett.rejprop
#[1] 0.01
#
#$d00.pow
#[1] 0.03
#
#$genwwn.pow
#[1] 0.02
#
#$hywn.pow
#[1] 0.01
#
#$hywavwn.pow
#[1] 0.03
#
#
# So, all empirical sizes should be close to their nominal value of 0.05
#
# Now let's try and ascertain the empirical power on an AR(1)
#
answer <- compute.rejection(ar=0.8, npow=100, ndata=32)
#
# Print the answer
#
print(answer)
#$hwwntest.rejprop
#[1] 0.79
#
#$box.rejprop
#[1] 0.98
#
#$bartlett.rejprop
#[1] 0.97
#
#$d00.pow
#[1] 0.97
#
#$genwwn.pow
#[1] 0.94
#
#$hywn.pow
#[1] 0.95
#
#$hywavwn.pow
#[1] 0.85
#
# Most powers are pretty good. 
}
\keyword{htest}
