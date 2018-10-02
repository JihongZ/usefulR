#' Generate Frequency Function
#'
#' This function allows you to save file compatible for MPlus
#' @param data a dataframe
#' @param file the filename you want to save
#' @keywords
#' @export
#' @examples
#' write_mplus_csv(mtcars, file="~/Desktop/mtcars.csv")
#'

frequency_table <- function(data) {
  do.call(bind_rows, lapply(data, function(x){
    table(x)
    })) %>%
    t()
}


