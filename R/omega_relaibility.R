#' Calculate Omega reliability values of factors
#'
#' This function automate calculating omega reliability from lavaan package
#' @param object The lavaan model object provided after runing the 'cfa', 'sem', 'growth', or 'lavaan' functions.
#' @keywords omega reliability
#' @export
#' @examples
#' \dontrun{
#' library(dplyr)
#' HS.model <- ' visual  =~ x1 + x2 + x3
#'               textual =~ x4 + x5 + x6
#'               speed   =~ x7 + x8 + x9 '
#' fit <- cfa(HS.model, data=HolzingerSwineford1939)
#' omega_reliability(fit)
#' }

omega_reliability <- function(object) {
  estimates <- parameterestimates(object)
  factors <- lavaanNames(object, "lv")
  ome_calculate <- function(factor) {
    # factor loadings
    factor_loadings <- estimates %>% filter(lhs == factor, op == "=~")
    # indicators for factor 1
    indicators <- unique(factor_loadings$rhs)
    # error variances
    error_variances_covariances <- estimates %>% filter(lhs %in% as.character(indicators))
    error_variances <- error_variances_covariances %>% filter(lhs == rhs)
    error_covariances <- error_variances_covariances %>% filter(!(lhs==rhs))
    ## output omega result
    if (nrow(error_covariances) == 0) {
      res <- (sum(factor_loadings$est)^2)/((sum(factor_loadings$est)^2)+sum(error_variances$est))
    }else{
      res <- (sum(factor_loadings$est)^2)/((sum(factor_loadings$est)^2)+sum(error_variances$est)+2*error_covariances$est)

    }
    return(res)
  }
  sapply(factors, ome_calculate)
}
