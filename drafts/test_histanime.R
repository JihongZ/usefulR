# simulate a long-format data
library(gganimate)


x = rep(c("dog", "cat", "rat"), 100)
y = 1:300
year = rep(1:100, each = 3)
dat <- as.data.frame(cbind(x, y, year))
dat$y <- as.numeric(dat$y)
dat$year <- as.numeric(dat$year)
# create a rank axis
dat <- dat %>%
  group_by(year) %>%
  mutate(
    rank = rank(-y)
  ) %>%
  ungroup()

staticplot = ggplot(dat, alpha = 0.8) +
  geom_tile(aes(x = rank, y = y/2, height = y, fill = x, group = x),
            show.legend = FALSE) +
  scale_fill_viridis_d() +
  labs(x = "Something") +
  theme(
    axis.text.x=element_blank()
  )

anim = staticplot +
  transition_time(year) +
  #ease_aes('cubic-in-out')+
  labs(title = 'Citations of The year: {closest_state}',
       subtitle  =  "Top 10 Journals in Social Sciences",
       caption = "Author: Jihong Zhang")
# rendering
animate(
  anim + enter_fade() + exit_fly(y_loc = 1)
  #duration = 100
)



library(ggplot2)
library(gganimate)
library(gapminder)
head(gapminder)
gapminder$year
theme_set(theme_bw())

p <- ggplot(
  gapminder,
  aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)
) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")
p
p + transition_time(year) +
  labs(title = "Year: {frame_time}")
