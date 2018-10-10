# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

hello <- function() {
  item1 <- sample(1:6, size=100, replace=TRUE)
  item2 <- sample(1:6, size=100, replace=TRUE)
  item3 <- sample(1:6, size=100, replace=TRUE)
  SimpleEduData <- data.frame(item1, item2, item3)
  devtools::use_data(SimpleEduData, overwrite = T)
}

