\name{genwwn.powerplot}
\alias{genwwn.powerplot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot (approximation) to the theoretical power of the
	\code{\link{genwwn.test}} test for
	ARMA processes (including, of course, white noise itself) for
	a range of sample sizes.
}
\description{Computes and plots (approximation) to the theoretical power of the
        \code{\link{genwwn.test}} test using the
	\code{\link{genwwn.thpower}} function.
}
\usage{
genwwn.powerplot(N =c(32, 64, 128, 256, 512, 1024), ar = NULL,
	ma = NULL, plot.it = TRUE, sigsq = 1, alpha = 0.05,
	away.from = "standard", filter.number = 10,
	family = "DaubExPhase", verbose = FALSE, ylim=c(0,1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{N}{Vector of lengths of the series you want to plot
	theoretical power for.
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
  \item{plot.it}{If \code{TRUE} then a plot of theoretical power against
	sample size is produced. The computed theoretical powers for the
	fixed sample sizes specified by \code{N} are plotted as crosses.
	The crosses are then joined by a dashed line to indicate a likely
	trajectory of the theoretical power for sample sizes not computed.
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
	the progress of the function.}
  \item{ylim}{The theoretical power is a probability and lies in the range
	of zero to one and this argument specifies those limits for the
	vertical axis. These can be changed to whatever you like. E.g.
	if all the powers were similar (e.g. if the null series was white
	noise and \code{alpha}=0.05 then the theoretical powers would all
	be approximately 0.05.)}
}
\details{Function calculates the value of the power function at
	the specified sample sizes using the
	\code{\link{genwwn.thpower}} function. Then these values
	are plotted and returned.
}
\value{A list containing the following components.
\item{N}{The vector of sample sizes.}
\item{power}{The computed theoretical powers for each sample size}
\item{ar}{The autoregressive parameters, NULL if there are none.}
\item{ma}{The moving average parameters, NULL if there are none.}
\item{sigsq}{The innovation variance used}
\item{alpha}{The significance level used}
\item{away.from}{The value of the \code{away.from} argument supplied}
\item{filter.number}{The wavelet filter number used}
\item{family}{The wavelet family used}
}

\references{
Nason, G.P. and Savchev, D. (2014) White noise testing using
wavelets. \emph{Stat}, \bold{3}, 351-362.
\doi{10.1002/sta4.69}
}
\author{Delyan Savchev and Guy Nason
}

\seealso{ \code{\link{genwwn.test}}, \code{\link{genwwn.thpower}} 
}

\examples{
#
# Plot theoretical power for white noise
#
\donttest{genwwn.powerplot()}
#
# Plot theoretical power for AR(1) process
#
\donttest{genwwn.powerplot(ar=0.8)}
}
\keyword{htest}
\keyword{ts}
