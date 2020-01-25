library(courseraFARS)
library(testthat)

datfolder <- system.file("extdata", package = "courseraFARS")
setwd(datfolder)

test_that("Raw files are available", {
  expect_equal(length(dir()), 3)
})

test_that("Reading multiple years gives a list", {
  expect_that(fars_read_years(2013:2015), is_a("list"))
})

test_that("Summary of years gives a tibble", {
  expect_that(fars_summarize_years(2013:2015), is_a("tbl_df"))
})
