\name{sqndwd}
\alias{sqndwd}
\title{Compute the non-decimated squared wavelet transform.
}
\description{A transform of the data with respect to an expansion
	comprised of squared wavelets.
}
\usage{
sqndwd(x, ec)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{The sequence that you want transformed, of dyadic length.
}
  \item{ec}{A structure containing the necessary information to
	transform the wavelet transform of the sequence to the
	squared wavelet transform. This is provided by the
	function \code{\link{sqcoefvec}}.
}
}
\details{
This function first computes the wavelet transform of the \code{x}
     data. Then, level by level it is retransformed into the
     coefficients of the squared-wavelet transform using the \code{ec}
     structure. Fine levels, that cannot be computed using the
     approximate method are computed directly by the brute-force method
     in \code{sqndwdecomp}.  Method used is described in Fryzlewicz, Nason and
     von Sachs (2008), and is analogous to the `powers of wavelets'
     transform described in Herrick (2000) and Barber, Nason and
     Silverman (2002).
}
\value{An object of class \code{wd} containing the non-decimated
	squared wavelet transform.
}
\references{
Barber, S., Nason, G.P. and Silverman, B.W. (2002) Posterior
     probability intervals for wavelet thresholding.
        \emph{J. R. Statist.  Soc. B}, \bold{64}, 189-206.

Fryzlewicz, P., Nason, G.P. and von Sachs, R. (2008) A
wavelet-Fisz approach to spectrum estimation.
\emph{J. Time Ser.  Anal.},
\bold{29}, 868-880.

Herrick, D.R.M. (2000) \emph{Wavelet Methods for Curve Estimation}, PhD
     thesis, University of Bristol, U.K.

Nason, G.P. and Savchev, D. (2014) White noise testing using
wavelets. \emph{Stat}, \bold{3}, 351-362.
\doi{10.1002/sta4.69}
}
\author{
Guy Nason
}

\seealso{\code{\link{sqwd}}
}
\examples{
#
# Random data
#
x <- rnorm(16)
#
# Compute the projection of x onto the squared wavelets... 
#
ans <- sqndwd(x, ec=sqcoefvec(m0=2, filter.number=4))
}
\keyword{math}
