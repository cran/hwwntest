\name{sqwd}
\alias{sqwd}
\title{Compute expansion with respect to squared wavelets. 
}
\description{Compute expansion with respect to squared wavelets. See help for
	\code{\link{sqndwd}}. The coefficients are the projection of the
	input sequence onto the set of functions being the squares of
	the usual wavelets. This operation is most useful for computing
	variances of wavelet coefficients.
}
\usage{
sqwd(x, filter.number = 10, family = "DaubExPhase", type = "station", m0 = 3)
}
\arguments{
  \item{x}{Sequence that you wish to compute expansion for.
}
  \item{filter.number}{Base wavelet family (no. of vanishing moments) you
	wish to use.
}
  \item{family}{The base wavelet family you wish to use.
}
  \item{type}{Either \code{station} for the non-decimated transform or
	\code{wavelet} for the regular wavelet transform.
}
  \item{m0}{The number of scales down (finer) from the scale of the
	squared wavelet being approximated. Usually, 2 or 3 is enough. Many
	more scales results in a better approximation but at a higher
	cost as the number of coefficients at consecutive scales doubles.
}
}
\details{This function is an implementation of the `powers of wavelets'
	idea from Herrick (2000), Barber, Nason and Silverman (2002) and,
	for the associated mod-wavelets by Fryzlewicz, Nason and von Sachs
	(2008).
}
\value{An object of class \code{wd} but containing coefficients with
	respect to the squared wavelets.
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
}
\author{
Guy Nason
}

\seealso{\code{\link{genwwn.thpower}},
	\code{\link{sqcoefvec}},
	\code{\link{sqndwd}},
	\code{\link{sqndwdecomp}}
}
\examples{
#
# A made-up sequence
#
x <- 1:32
#
# Work out its expansion wrt squared wavelets
#
x.sqwd <- sqwd(1:32)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{math}
