#' Omega Reliability Function
#'
#' This function allows you to Calculate Omega Reliaility from Lavaan
#' @param lavaanobject A Lavaan Object
#' @keywords
#' @export
#' @examples
#' omega_reliability(model2)
#' omega_reliability(model1)
#' omega_reliability(fa_bi)
#' omega_reliability(fa1)
#' omega_reliability(fa3)

omega_reliability <- function(lavaanobject) {
  estimates <- parameterestimates(lavaanobject)
  factors <- lavaanNames(lavaanobject, "lv")
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
