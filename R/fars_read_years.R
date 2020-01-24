#' @title Read FARS data of multiple years into a list
#' @description This function is a helper for reading FARS data in csv format.
#' It returns the data in a list with each element being a tibble for 
#' the specified years
#' @param years  a vector that can be coerced to an integer vector
#' of valid years
#' @return Returns a list with each element being the data for that
#' year in a \code{tbl_df}
#' @examples
#' \dontrun{
#' fars_read_years(2013:2015)
#' }
#' @seealso 
#'  \code{\link[dplyr]{mutate}},\code{\link[dplyr]{select}}
#' @rdname fars_read_years
#' @export 
#' @importFrom dplyr mutate select

fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>% 
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
