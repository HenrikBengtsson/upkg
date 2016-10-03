#' aliases i
#'
#' @importFrom utils install.packages
#' @export
install <- function(pkgs, ...) {
  pkgs <- unlist(strsplit(pkgs, split = ",", fixed = TRUE), use.names = FALSE)
  pkgs <- gsub("[[:space:]]+", "", pkgs)
  mprintf("Installing packages: %s", paste(sQuote(pkgs), collapse = ", "))
  install.packages(pkgs=pkgs, ...)
}
class(install) <- c("CmdArgsFunction", class(install))


#' @export
call <- function(fcn, ...) {
  fcn <- get(fcn, mode="function")
  fcn(...)
}
class(call) <- c("CmdArgsFunction", class(call))

