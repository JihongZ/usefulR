#' A fixed scaling correction factor HO for lavaan model to mimic Mplus
#'
#' This function allows you to get fixed scaling correction factor HO for lavaan model to mimic Mplus
#' @param lavaanmodel a lavaan object
#' @keywords lavaan scale_factor
#' @import dplyr
#' @import tidyr
#' @export
#' @examples
#' \dontrun{
#' correct_mplush0(fit1)
#' }
#'
#'
correct_mplush0 <- function(lavaanmodel){
  parms_fewer = fitmeasures(lavaanmodel)["npar"]
  parms_more = sum(fitmeasures(lavaanmodel)[c("npar","df")])
  scale_h1 = fitmeasures(lavaanmodel)["scaling.factor.h1"]
  scale_correction = fitmeasures(lavaanmodel)["chisq.scaling.factor"]
  f <- (scale_correction * (parms_fewer-parms_more) + parms_more*scale_h1)/parms_fewer

  return(data.frame(scale_factor_h0 = as.numeric(f)))
}
