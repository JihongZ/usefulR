#' Update all packages from github
#'
#' This will trash any non-master branch installs, and spend time re-installing the packages
#' @keywords lavaan scale_factor
#' @export
#'
update_github <- function() {
  pkgs = loadedNamespaces()
  print(pkgs)
  desc <- lapply(pkgs, packageDescription, lib.loc = NULL)
  for (d in desc) {
    message("working on ", d$Package)
    if (!is.null(d$GithubSHA1)) {
      message("Github found")
      install_github(repo = d$GithubRepo, username = d$GithubUsername)
    }
  }
}
