CmdArgsFunction <- function(fcn=function() {}, output=print, ...) {
  # Argument 'fcn':
  stopifnot(is.function(fcn))

  # Argument 'output':
  stopifnot(is.function(output))

  attr(fcn, "output") <- output
  class(fcn) <- c("CmdArgsFunction", class(fcn))
  fcn
}

#' @export
print.CmdArgsFunction <- function(x, ..., call=!interactive(), envir=parent.frame()) {
  # Nothing todo?
  if (!call) return(NextMethod("print"))

  # Call function...
  res <- withVisible(cmdArgsCall2(x, ..., envir=envir))

  # Should the result be printed?
  if (res$visible) {
    output <- attr(x, "output")
    if (is.null(output)) output <- print
    output(res$value)
  }

  # Return nothing
  invisible(return())
}


#' @importFrom R.utils cmdArgs
#'
cmdArgsCall2 <- function (..., args = cmdArgs(unique = FALSE), envir = parent.frame()) {
  names <- names(args)
  unnamed <- which(nchar(names) == 0L)
  if (length(unnamed) > 0) {
    o <- seq_along(args)
    o <- c(o[unnamed], o[-unnamed])
    args <- args[o]
  }

  do.call(..., args = args, envir = envir)
}
