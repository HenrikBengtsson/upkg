#' @export
build <- CmdArgsFunction(function(...) {
  devtools::build(...)
})

#' @export
check <- CmdArgsFunction(function(...) {
  devtools::check(...)
})


