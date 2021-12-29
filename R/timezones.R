#' Check out the timezones
#'
#' @title Check timezones.
#'
#' @param
#' @describeIn
#' @keywords frequency table
#' @importFrom lubridate now
#' @export
#' @examples
#' \dontrun{
#'   melody_time()
#' }
#'

melody_time <- function(...) {
  lubridate::now("Asia/Hong_Kong")
}

