#' aliases u
#'
#' @importFrom R.utils use
#' @export
use <- CmdArgsFunction(function(pkg, ...) {
  pkgs <- unlist(strsplit(pkg, split = ",", fixed = TRUE), use.names = FALSE)
  pkgs <- gsub("[[:space:]]+", "", pkgs)
  mprintf("Installing packages: %s", paste(sQuote(pkgs), collapse = ", "))
  R.utils::use(pkg=pkgs, ...)
})

