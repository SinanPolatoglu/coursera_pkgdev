#' Read FARS data into a tibble
#' 
#' This functions is a helper for reading FARS data in csv format.
#' It returns the data in a \code{\link[dplyr]{tbl_df}}
#' 
#' @param filename Path to a csv file
#' @return Returns the data in a tibble format
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#' @examples
#' \dontrun{
#' fars_read("filename.csv")
#' }
#' @export

fars_read <- function(filename) {
        if(!file.exists(filename))
                stop("file '", filename, "' does not exist")
        data <- suppressMessages({
                readr::read_csv(filename, progress = FALSE)
        })
        dplyr::tbl_df(data)
}
