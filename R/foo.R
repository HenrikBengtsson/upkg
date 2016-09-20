#' Foo something
#'
#' @param x An object.
#' @param y Another object.
#' @param \dots Not used.
#'
#' @export
foo <- function(x=1, y=2, ...) list(x=x, y=y)


#' Bar something
#'
#' @inheritParams foo
#' @param \dots Additional arguments passed to \code{\link{foo}()}.
#'
#' @export
bar <- function(x=1, ...) foo(x=x, ...)
