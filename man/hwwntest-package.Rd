\name{hwwntest-package}
\alias{hwwntest-package}
\alias{hwwntest}
\docType{package}
\title{
\packageTitle{hwwntest}
}
\description{
\packageDescription{hwwntest}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{hwwntest}
\packageIndices{hwwntest}

Contains a variety of hypothesis tests for white noise data.
        The package contains an implementation of Bartlett's B test,
        \code{\link{bartlettB.test}},
        (Kolmogorov-Smirnov test on the cumulative periodogram),
        a selection of wavelet-based tests
        \code{\link{hwwn.test}} a test using Haar wavelets,
        \code{\link{d00.test}} a single Haar wavelet coefficient test,
        \code{\link{genwwn.test}} a test using smoother Daubechies
        wavelets, a hybrid test \code{\link{hywavwn.test}}
        that uses Haar wavelets at fine scales and general wavelets
        at coarse scales and a omnibus test
        \code{\link{hywn.test}} that combines the results of  four tests
        (\code{hwwn.test}, \code{genwwn.test}, \code{bartlettB.test}
        and the \code{Box.test})
        The wavelet tests work by examining
        the wavelet transform of the regular periodogram
        and assess whether it has non-zero coefficients.
        If series is H_0: white noise,
        then the underlying spectrum is constant (flat) and all true wavelet
	 coefficients will be zero. Then all periodogram wavelet coefficients
        will have true zero mean which can be tested using knowledge of,
        or approximation to, the
        coefficient distribution.
}
\author{
\packageAuthor{hwwntest}

Maintainer: \packageMaintainer{hwwntest}
}
\references{
Nason, G.P. and Savchev, D. (2014) White noise testing using
wavelets. \emph{Stat}, \bold{3}, 351-362.
\url{http://dx.doi.org/10.1002/sta4.69}
}
\keyword{ package }
\seealso{\code{\link{hwwn.test}}}
\examples{
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
     #       Wavelet Test of White Noise
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
     #       Wavelet Test of White Noise
     #
     #data:
     #p-value < 2.2e-16
     #
     # p-value is very small. Extremely strong evidence
     # to reject H_0: white noise
     #
     #
     # Let's use one of the other tests: e.g. the general wavelet one
     #
     x.ar.genwwntest <- genwwn.test(x.ar)
     #
     # Print the results
     #
     print(x.ar.genwwntest)
     #
     #
     #  Wavelet Test of White Noise
     #
     # data:
     # p-value = 1.181e-10
     #
     # Again, p-value is very small
}
