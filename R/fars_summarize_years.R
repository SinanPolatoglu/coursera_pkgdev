#' @title Summarize fatal injury counts by (year, month)
#' @description Reads in FARS csv files for multiple years and
#' summarises the monthly count of fatal injuries suffered in
#' traffic crashes
#' @param years a vector that can be coerced into an integer vector
#' of valid years
#' @return a \code{data.frame} with monthly counts of fatal injuries
#' for each year
#' @examples
#' \dontrun{
#' fars_summarize_year(2013:2015)
#' }
#' @seealso
#'  \code{\link[dplyr]{bind}},\code{\link[dplyr]{group_by}},\code{\link[dplyr]{summarise}}
#'  \code{\link[tidyr]{spread}}
#' @rdname fars_summarize_years
#' @export
#' @importFrom magrittr `%>%`
#' @importFrom dplyr bind_rows group_by summarize
#' @importFrom tidyr spread

fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
