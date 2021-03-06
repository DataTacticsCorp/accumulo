\name{accum.flush.writer}
\alias{accum.flush.writer}
\title{
accum.flush.writer: Flush a writer.
}
\description{
  Flushes buffered writes to a table in the Accumulo instance.
}
\usage{
accum.flush.writer(writer, hbc = accum.defaults("hbc"))
}
\arguments{
  \item{writer}{
The writer to flush.
}
  \item{hbc}{
The pointer to the AccumuloClient (returned from accum.init()).
}
}
\value{
   TRUE if successful, error otherwise.
}
\author{
Philip A Grim II (pgrim@data-tactics.com)
}

\seealso{
\code{\link{accum.init}}\cr
\code{\link{accum.login}}
\code{\link{accum.create.writer}}
\code{\link{accum.update}}
\code{\link{accum.close.writer}}
}
\examples{
  library(raccumulo)
  \dontrun{accum.init('localhost',42424)}
  \dontrun{accum.login('accumuser','mypassword')}
  
  updates <- list()
  updates[[1]] <- accum.create.cell("F789", "fam1", "qual1", "U&USA", 0, FALSE, "four")
  updates[[2]] <- accum.create.cell("F789", "fam1", "qual2", "U&USA", 0, FALSE, "five")
  updates[[3]] <- accum.create.cell("F789", "fam2", "qual3", "U&USA", 0, FALSE, "six")
  updates[[4]] <- accum.create.cell("M012", "fam1", "qual1", "U&USA", 0, FALSE, "FOUR")
  updates[[5]] <- accum.create.cell("M012", "fam1", "qual2", "U&USA", 0, FALSE, "FIVE")
  updates[[6]] <- accum.create.cell("M012", "fam2", "qual3", "U&USA", 0, FALSE, "SIX")
  
  \dontrun{writer <- accum.create.writer("test_proxy")}
  \dontrun{accum.update(writer,updates)}
  \dontrun{accum.flush.writer(writer)}
  \dontrun{accum.close.writer(writer)}
}
