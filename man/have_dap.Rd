% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/access.R
\name{have_dap}
\alias{have_dap}
\title{OpenDAP capability}
\usage{
have_dap(u, ...)
}
\arguments{
\item{u}{OpenDAP source string}

\item{...}{ignored}
}
\value{
logical, TRUE if we have capability
}
\description{
Check that we are online and we can connect
}
\examples{
src_url <- canon_dap_url()
have_dap(src_url)
}
\seealso{
canon_dap_url
}
