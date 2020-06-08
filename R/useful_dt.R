#' Generate Frequency Function
#'
#' @title Useful functions to manipulate datasets.
#'
#' @param data a dataframe
#' @describeIn useful_dt frequency_table is a function to summarize data
#' @keywords frequency table
#' @importFrom rlang .data
#' @export
#' @examples
#' \dontrun{
#'   frequency_table(mtcars)
#' }
#'

frequency_table <- function(data) {

  # include only numeric variables
  dt <- data[sapply(data, is.numeric)]
  dt2 <- data[!sapply(data, is.numeric)]
  summaries <- as.data.frame(do.call(dplyr::bind_rows, lapply(dt, function(x){ summary(x) })))
  frequncy_table <- do.call(bind_rows, lapply(dt2, function(x){ table(x, useNA = 'always')})) %>% t()
  rownames(summaries) <- colnames(dt); colnames(frequncy_table) <- colnames(dt2)
  return(list(summaries = summaries, frequncy_table = frequncy_table))
}

#' @param x the value to be tested
#' @param y the vector to be tested
#' @describeIn useful_dt %!in% means x not in y. Similar to !%in%
#' @export
`%!in%` <- function(x, y){
  !(`%in%`(x, y))
}
