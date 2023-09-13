\name{cumperiod}
\alias{cumperiod}
\title{Compute cumulative normalized periodogram.
}
\description{Computes cumulative normalized periodogram.
}
\usage{
cumperiod(x)
}
\arguments{
  \item{x}{The time series you wish to compute the cumulative
	normalized periodogram.
}
}
\details{Does as the title suggests
}
\value{A list containing the following two components:
\item{wp}{The Fourier frequencies where the cumulative normalized periodogram
	is evaluated at}
\item{cumperiod}{The cumulative normalized periodogram.}
}
\references{
Bartlett, M.S. (1967) Some Remarks on the Analysis of Time-Series.
\emph{J. R. Statist. Soc. B}, \bold{54}, 25-38.

\href{https://web.stat.tamu.edu/~jnewton/stat626/topics/topics/topic13.pdf}{Link to Professor H. Joseph Newton's web page on Bartlett's test}

Nason, G.P. and Savchev, D. (2014) White noise testing using
wavelets. \emph{Stat}, \bold{3}, 351-362.
\doi{10.1002/sta4.69}
}
\author{
G. P. Nason
}
\note{Code was based on Professor Newton's explanation
}


\seealso{\code{\link{bartlettB.test}}, \code{\link{compute.rejection}}
}
\examples{
#
# Use example time series
#
x <- rnorm(100)

x.cp <- cumperiod(x)
#
# Can plot it, if you like
#
plot(x.cp$wp, x.cp$cumperiod, type="l", xlab="Frequency",
	ylab="Cumulative Normalized Periodogram")
#
# You can try replacing the x by, say, an AR(1) using arima.sim and
# you'll get a very different shaped line, depending on the AR(1)
# parameter.
}
\keyword{ts}
