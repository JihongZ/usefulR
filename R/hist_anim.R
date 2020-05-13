#' ## script to anime the histgram plot

#' #### Kevin Keenan 2014
#'
#' This function will read a standard R markdown source file and convert it to
#' an R script to allow the code to be run using the "source" function.
#'
#' The function is quite simplisting in that it reads a .Rmd file and adds
#' comments to non-r code sections, while leaving R code without comments
#' so that the interpreter can run the commands.
#' @export
#'
hist_anim <- function(data, x, groupvar, timevar, isgroupdata = T){

  if (isgroupdata) {
    # create a rank axis
    dat <- dat %>%
      group_by(year) %>%
      mutate(
        rank = rank(-y)
      ) %>%
      ungroup()
    # statistic plot
    staticplot = ggplot(dat) +
      geom_tile(aes(x = rank, y = y/2, height = y, fill = x, group = x)) +
      theme(
        axis.text.x=element_blank()
      )
  }


  anim = staticplot +
    transition_states(year, transition_length = 10, state_length = 5) +
    enter_fade() +
    exit_fade() +
    labs(title = 'Citations of The year: {closest_state}',
         subtitle  =  "Top 10 Journals in Social Sciences",
         caption = "Author: Jihong Zhang")
  anim
}
