#' Helper for creating FARS data filenames
#' 
#' \code{make_filename} is a helper for creating the filenames using
#' year values for the FARS data
#' 
#' @param year a scalar or vector which can be coerced integer values
#' @return a character vector with filenames according to the year
#' @examples
#' \dontrun{
#' make_filename("2013")
#' make_filename(2013)
#' make_filename(2013:2015)
#' }

make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}
