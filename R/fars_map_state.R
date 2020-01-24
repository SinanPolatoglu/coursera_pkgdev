#' @title Plot geographical coordinates of fatal injury locations
#' @description \code{fars_map_state} plots the geograhpical coordinates
#' of fatal injuries within a state given a year
#' @param state.num a valid state identifier, coercible to an integer
#' @param year a scalar, coercible to an integer
#' @return \code{NULL}
#' @details The plotted area is restricted to states with a longitude 
#' > 900 and latitude > 90
#' @examples 
#' fars_map_state(01, 2013)
#' \dontrun{
#' fars_map_state("stateName", 2013)
#' }
#' @seealso 
#'  \code{\link[dplyr]{filter}}
#'  \code{\link[maps]{map}}
#'  \code{\link[graphics]{points}}
#' @rdname fars_map_state
#' @export 
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points

fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)
  
  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
