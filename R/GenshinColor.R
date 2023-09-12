#' @import grDevices
#' @export genshin.cols CharColors
#' @export Elements Nahida Venti

Elements <- c(
  "#a6c938",
	"#ef7a35",
	"#a0d7e4",
	"#75c2aa",
	"#b08fc2"
)

Nahida <- c(
  "#303322",
  "#7fb591",
  "#bacd84",
  "#e6f8b7",
  "#ede8ec"
)

Venti <- c(
  "#4b3522",
  "#24574b",
  "#3e9f85",
  "#e8dcbf",
  "#3b3e86"
)

CharColors <- list(Elements, Nahida, Venti)

genshin.cols <- function (n, name = "genshin.colors")
{
  CharColorsRGB <- col2rgb(unlist(CharColors))
  genshin.colors = rgb(CharColorsRGB[1, ], CharColorsRGB[2, ], CharColorsRGB[3, ],
                                  maxColorValue = 255)
  name = match.arg(name)
  orig = eval(parse(text = name))
  rgb = t(col2rgb(orig))
  temp = matrix(NA, ncol = 3, nrow = n)
  x = seq(0, 1, length(orig))
  xg = seq(0, 1, n)
  for (k in 1:3) {
    hold = spline(x, rgb[, k], n = n)$y
    hold[hold < 0] = 0
    hold[hold > 255] = 255
    temp[, k] = round(hold)
  }
  palette = rgb(temp[, 1], temp[, 2], temp[, 3], maxColorValue = 255)
  palette
}


## A example
if (0) {
  library(tidyverse)
  g1 <- rnorm(100, -2, 1)
  g2 <- rnorm(100, -1, 1)
  g3 <- rnorm(100, 0, 1)
  g4 <- rnorm(100, 1, 1)
  g5 <- rnorm(100, 2, 1)

  data.frame(g1, g2, g3, g4, g5) |>
    pivot_longer(everything(), names_to = "G", values_to = "Value") |>
    ggplot() +
    geom_density(aes(x = Value, fill = G), alpha = 0.8, col = NA) +
    geom_text(aes(x=x, y=y, label=label), data = data.frame(x = seq(-2, 2, 1)-0.2, y = rep(0.3, 5), label = c('草','火','冰','风','雷')), family = "Heiti SC Light") +
    scale_fill_manual(values = Elements) +
    labs(title = "五元素配色") +
    theme_light() +
    theme(text = element_text(family = "Heiti SC Light"))

}


