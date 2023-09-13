\name{Macdonald}
\alias{Macdonald}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Compute the Macdonald density function for a specified parameter
	value \code{m} at a vector of \code{x} values.
}
\description{
Compute the Macdonald density function for a specified parameter
        value \code{m} at a vector of \code{x} values.
}
\usage{
Macdonald(x, m)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{The \code{x} ordinates that you want to evaluate the density
	at. A vector of real numbers. 
}
  \item{m}{The parameter of the Macdonald's density
}
}
\details{This function computes the Macdonald probability density
	function for parameter \code{m} and values at which to
	evaluate the density supplied in \code{x}. The mean and
	variance of this density is zero and one respectively.
}
\value{The density
}
\references{
Nason, G.P. and Savchev, D. (2014) White noise testing using
wavelets. \emph{Stat}, \bold{3}, 351-362.
\doi{10.1002/sta4.69}
}
\author{Delyan Savchev and Guy Nason
}


\seealso{\code{\link{compute.rejection}}, \code{\link{hwwn.test}}
}
\examples{
#
# Work out density at x=0, 0.5 and 1 for the m=1 Macdonald density
#
Macdonald(x=c(0,0.5,1), m=2)
#[1] 0.3535534 0.2975933 0.2075131
#
# Check that the density integrates to one, e.g. for m=3
#
integrate(Macdonald, lower=-20, upper=20, m=3)
#1 with absolute error < 4.7e-07
}
% R documentation directory.
\keyword{distribution}
