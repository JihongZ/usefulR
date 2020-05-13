#' Create a blogdown post quickly
#'
#' This will trash any non-master branch installs, and spend time re-installing the packages
#' @keywords lavaan scale_factor
#' @export


newpost <- function(lang="en") {

  filename <- readline(prompt="Your filename > ")
  title <- readline(prompt="Your post's title > ")

  draft = TRUE

  md.metadata =
    paste0("---
  title: ", title,"
  date: ",Sys.Date(),"
  draft: ", tolower(draft) ,"
  categories:
    - blog
  tags:
    - Blog
---")

  if (lang == "zh"){
    ## create a file name
    postname = paste0(Sys.Date(), "-",gsub(" ", "-", filename, fixed = TRUE), "." ,lang,".md")
    ## Chinese Path
    path = "/Users/jihong/Documents/hugo-academic-jihong/content/post/zh/"
    filepath = paste0(
      path,
      postname)

  } else {
    postname = paste0(Sys.Date(), "-",gsub(" ", "-", filename, fixed = TRUE), ".md")

    ## English Path
    path = "/Users/jihong/Documents/hugo-academic-jihong/content/post/"
    filepath = paste0(
      path,
      postname)

  }


  write.table(md.metadata, file = filepath, quote = FALSE, row.names = FALSE,col.names = FALSE)
  cat("Post file created successfully!!!\n")
  cat(paste0("FILENAME: ", postname, "\n"))
  cat(paste0("LOCATION: ", path, "\n"))
  cat("METADATA: \n", md.metadata)
  file.edit(filepath)
}
