#' The cleanest summary for mcmc.list object
#'
#' A function to report the summary table of mcmc object
#' @param mcmcObj mcmc.list object
#' @export
#'
#'

MCMCsummary <- function(mcmcObj) {

  stopifnot(class(model01a) == "mcmc.list")
  res = data.frame(
    cbind(round(summary(mcmcObj)$statistics[,1:2], 4),    # Posterior Mean and SD
          round(summary(mcmcObj)$quantiles[,c(1,5)], 4)), # Posterior Percentile 2.5% and 97.5%
    Rhat = gelman.diag(mcmcObj, multivariate = FALSE)[[1]][,1], check.names = FALSE)
  return(res)
}
