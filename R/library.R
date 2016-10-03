#' aliases i
#'
#' @importFrom utils install.packages
#' @export
install <- CmdArgsFunction(function(pkgs, ...) {
  pkgs <- unlist(strsplit(pkgs, split = ",", fixed = TRUE), use.names = FALSE)
  pkgs <- gsub("[[:space:]]+", "", pkgs)
  mprintf("Installing packages: %s", paste(sQuote(pkgs), collapse = ", "))
  install.packages(pkgs=pkgs, ...)
})

#' aliases i
#'
#' @importFrom utils update.packages
#' @export
update <- CmdArgsFunction(function(...) {
  mprintf("Updating packages:")
  update.packages(...)
})

