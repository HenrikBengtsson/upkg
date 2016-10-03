#' @export
call <- CmdArgsFunction(function(fcn, ...) {
  fcn <- get(fcn, mode = "function")
  fcn(...)
}, output = print)

#' @export
callc <- CmdArgsFunction(function(fcn, ...) {
  fcn <- get(fcn, mode = "function")
  fcn(...)
}, output = cat)


#' @importFrom R.utils isUrl downloadFile
#'
#' @export
source <- CmdArgsFunction(function(file, ...) {
  if (isUrl(file)) {
    file <- downloadFile(file)
  }
  base::source(file = file, ...)
})

