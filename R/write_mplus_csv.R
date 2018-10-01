#' Write CSV file for Mplus Function
#'
#' This function allows you to save file compatible for MPlus
#' @param data a dataframe
#' @param file the filename you want to save
#' @keywords
#' @export
#' @examples
#' write_mplus_csv(mtcars, file="~/Desktop/mtcars.csv")
#'

write_mplus_csv <- function(data, file) {
  write.table(data, file = file, sep=",", col.names = FALSE)
}
