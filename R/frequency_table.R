#' Generate Frequency Function
#'
#' This function allows you to save file compatible for MPlus
#' @param data a dataframe
#' @param file the filename you want to save
#' @keywords frequency table
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

# t(sapply(mtcars, summary))
# colnames(mtcars)
# frequency_table(iris)
# iris[sapply(iris, is.numeric)] %>% head()
# data = iris
