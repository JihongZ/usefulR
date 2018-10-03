#' Reverse Coding Function
#'
#' This function allows you to reverse coding your vector (Max to Min)
#' @param variable A numerical vector
#' @keywords cats
#' @export
#' @examples
#' reverse_code()

reverse_code <- function(variable) {
  N <- length(variable)
  max_value <- max(variable, na.rm = TRUE)
  min_value <- min(variable, na.rm = TRUE)
  output <- rep(0, N)
  for (index in 1:N) {
    if (is.na(variable[index])) {
      output[index] <- NA
    }else{
      output[index] <- max_value + min_value - variable[index]
    }
  }
  return(output)
}
