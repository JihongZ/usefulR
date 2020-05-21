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
  dt <- data[,sapply(data, is.numeric)]
  summaries <- do.call(dplyr::bind_rows, lapply(dt, function(x){ summary(x) }))
  names = colnames(dt)
  return(cbind(variables = names, summaries))
}

# t(sapply(mtcars, summary))
# colnames(mtcars)
