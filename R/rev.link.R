#' Inverse Link Function for logistic regression
#'
#' @description  This function automate calculating reverse link function value for logistic regression
#' @param logofOdds log of odds ratio
#' @author Jihong Zhang
#' @keywords Link Function
#' @export

rev.link <- function(logofOdds) {
  mu = exp(logofOdds) / (1 + exp(logofOdds))
  return(mu)
}
