\name{hwwn.dw}
\alias{hwwn.dw}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Compute discrete wavelets
} 
\description{Compute discrete wavelets up to some scale
}
\usage{
hwwn.dw(J, filter.number, filter.family)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{J}{The number of scales of discrete wavelets to produce.
}
  \item{filter.number}{The wavelet filter number.
}
  \item{filter.family}{The wavelet family to produce.
}
}
\details{Uses the delta value method and uses wr to reconstruct the
	wavelets. See Nason, von Sachs and Kroisandt 2000 for details.
	
	Note: this function is the same as the \code{discrete.wavelets}
	function in the AutoSpec package, but copied here.
}
\value{A list of length J, each component of the list corresponds to
	a different scale of wavelets. Component 1 is the finest scale,
	component 2 is the next finest and so on.
}
\references{
Nason, G.P., von Sachs, R. and Kroisandt, G. (2000) Wavelet processes
	and adaptive estimation of the evolutionary wavelet spectrum.
	\emph{J. R. Statist. Soc. B}, \bold{62}, 271-292.
}
\author{
Piotr Fryzlewicz
}


\seealso{
\code{\link{sqndwdecomp}}
}
\examples{
#
# Generate three scales of Haar wavelets
#
hwwn.dw(3, 1, "DaubExPhase")
#[[1]]
#[1] 0.7071068 -0.7071068
#
#[[2]]
#[1] 0.5 0.5 -0.5 -0.5
#
#[[3]]
#[1] 0.3535534 0.3535534 0.3535534 0.3535534 -0.3535534 -0.3535534 -0.3535534
#[8] -0.3535534
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
