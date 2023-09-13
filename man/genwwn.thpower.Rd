\name{genwwn.thpower}
\alias{genwwn.thpower}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Compute (approximation) to the theoretical power of the
	\code{\link{genwwn.test}} test for
	ARMA processes (including, of course, white noise itself).
}
\description{Compute (approximation) to the theoretical power of the
        \code{\link{genwwn.test}} test. Note: this
	function does no simulation, it merely computes an approximation
	to the likely statistical power (or size) of the
	\code{\link{genwwn.test}} function. It can be useful to establish
	the reverse question: what sample size do I require to 
	achieve a certain power for a given ARMA process?
}
\usage{
genwwn.thpower(N = 128, ar = NULL, ma = NULL, plot.it = FALSE,
	sigsq = 1, alpha = 0.05, away.from = "standard",
	filter.number = 10, family = "DaubExPhase", verbose = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{N}{The length of the series you want to get a theoretical power
	result for.
}
  \item{ar}{Autoregressive parameters. A vector with p entries for AR(p)
	with the first entry being the value for lag-one term (alpha_1),
	the second
	entry being the value for the lag-two term (alpha_2) etc.
	If this argument is NULL then there are no AR terms.
}
  \item{ma}{Similar to the \code{ar} argument except for MA terms. 
	A vector of length q for MA(q) parameters, with first entry
	being beta_1, the second being beta_2, etc. If this argument
	is NULL then there are no MA terms.
}
  \item{plot.it}{If \code{TRUE} then two plots are produced. The first is
	of the time series spectrum you are considering (controlled by
	the \code{N}, \code{ar} and \code{ma} arguments.) The second
	is a plot of the wavelet coefficients of the normalized
	spectrum.
}
  \item{sigsq}{The theoretical innovation variance (also the variance
	of white noise if \code{ar=ma=NULL}.
}
  \item{alpha}{The nominal size of the test for this theoretical power
	calculation.
}
  \item{away.from}{Describes how many fine scales to exclude, the
	same as in \code{\link{genwwn.test}}. This can be an integer
	up to the number of scales. However, mostly you can leave this
	at "standard" where the scales calculation is automatically determined.
}
  \item{filter.number}{The number of vanishing moments in the Daubechies
	series of wavelets.
}
  \item{family}{The wavelet family.
}
  \item{verbose}{If TRUE then informative messages are printed during
	the progress of the function.
}
}
\details{Function calculates the value of the power function at
	the specified arguments. It does this by: (i) specifying the
	functional spectrum of the ARMA process
	(which can be flat, ie white noise);
	(ii) calculating the variance of the ARMA process by numerical
	integration of the spectrum; (iii) calculating the spectrum
	values at the Fourier frequencies; (iv) calculating the wavelet
	coefficients at the exact spectrum values; (v) computing the
	exact variance of the wavelet coefficients of the squared normalized
	spectrum; (vi) computing the approximate power of the whole lot.
}
\value{A list containing the following components.
\item{C.alpha.c}{The critical value for the test, which is the nominal
	size critical value after correction for multiple hypothesis
	tests (correction using Bonferroni).
}
\item{th.power}{The computed theoretical power}
\item{norspecwd}{The wavelet coefficients of the true spectrum}
\item{norspecvarwd}{The squared wavelet transform of the squared normalized
	spectrum}
\item{all.hwc}{All of the wavelet coefficients from the normalized true
	specturm as a single vector}
\item{all.sdwc}{The `true' standard deviations of the wavelet coefficients}
}

\references{
Nason, G.P. and Savchev, D. (2014) White noise testing using
wavelets. \emph{Stat}, \bold{3}, 351-362.
\doi{10.1002/sta4.69}
}
\author{Delyan Savchev and Guy Nason
}

\seealso{ \code{\link{genwwn.test}}, \code{\link{sqwd}}
}

\examples{
#
# Calculate what the theoretical actual size is likely to be for the
# genwwn.test for a white noise sequence of T=64, nominal size=0.05
#
genwwn.thpower(N=64)$th.power
#[1] 0.04894124
#
# This is pretty close to the nominal size of 5%. Good.
#
# What is the power of detection for the AR(1) process with alpha=0.3?
# Let's say with sample size of T=32
#
genwwn.thpower(N=32, ar=0.3)$th.power 
#[1] 0.2294128
#
# That's pretty poor, we'll only detect about 23% of cases. Can we achieve
# a power of 90%? Actually, it turns out that by repeating these above
# functions with N=128 gives a power of 61%, and for N=256 we get a power of
# 90%. 
}
\keyword{htest}
\keyword{ts}
