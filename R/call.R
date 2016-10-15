#' @export
call <- CmdArgsFunction(function(fcn, ...) {
  fcn <- .getfcn(fcn)
  fcn(...)
}, output = print)

#' @export
callc <- CmdArgsFunction(function(fcn, ...) {
  fcn <- .getfcn(fcn)
  fcn(...)
}, output = cat)


.getfcn <- function(fcn, ...) { 
  fcn <- as.character(fcn)
  parts <- unlist(strsplit(fcn, split="::", fixed=TRUE))
  str(list(fcn=fcn, parts=parts))
  if (length(parts) == 2) {
    envir <- getNamespace(parts[1])
    fcn <- parts[2]
  } else {
    envir <- parent.frame()
  }
  get(fcn, envir = envir, mode = "function")
} ## .getfcn()


#' @importFrom R.utils isUrl downloadFile
#'
#' @export
source <- CmdArgsFunction(function(file, ...) {
  if (isUrl(file)) {
    file <- downloadFile(file)
  }
  base::source(file = file, ...)
})

