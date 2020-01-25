## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

datfolder <- system.file("extdata", package = "courseraFARS")
file.copy(
  file.path(datfolder, dir(datfolder)),
  file.path(getwd(), dir(datfolder))
)

## -----------------------------------------------------------------------------
datfolder <- system.file("extdata", package = "courseraFARS")
dir(datfolder)

## -----------------------------------------------------------------------------
library(courseraFARS)

## -----------------------------------------------------------------------------
(x <- fars_read(dir(datfolder)[1]))

## -----------------------------------------------------------------------------
(x <- fars_read_years(2013:2015))

## -----------------------------------------------------------------------------
(x <- fars_summarize_years(2013:2015))

## ----fig.align='center', fig.height=4, fig.width=5----------------------------
fars_map_state(1, 2013)

## ----deletefiles, include=FALSE-----------------------------------------------
file.remove(dir(datfolder))
rm(datfolder)

