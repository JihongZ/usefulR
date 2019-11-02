#' Save CSV file compatible for Mplus
#'
#' \code{write_mplus_csv} allows you to save file compatible for MPlus. Specifically,
#' headers will be removed.
#' @param data A dataframe stored in R.
#' @param file Tha abosulte path of saved file.
#' @keywords mplus csv
#' @export
#' @seealso This function wraps up \code{\link[utils]{write.table}}.
#' @examples
#' \dontrun{
#' write_mplus_csv(mtcars, file="~/Desktop/mtcars.csv")
#' }
#'
#'

write_mplus_csv <- function(data, file) {
  write.table(data, file = file, sep=",", col.names = FALSE, row.names = FALSE)
}

