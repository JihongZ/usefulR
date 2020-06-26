test_that("Omega Reliabilies Works", {
  library(lavaan)
  HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '
  fit <- cfa(HS.model, data=HolzingerSwineford1939)
  res <- omega_reliability(fit)
  expect_equal(length(res), 3)
  expect_equal(length(res), sum(res > 0 & res < 1))
})
