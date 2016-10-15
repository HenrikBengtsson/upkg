#' @importFrom R.cache loadCache saveCache
#' @importFrom utils available.packages
#'
#' @export
available_packages <- function(..., force = FALSE, delta = 60 * 60) {
  key <- list(method = "available_packages", ...)
  dirs <- c("do")
  res <- if (force) NULL else loadCache(key = key, dirs = dirs)
  if (!is.null(res) && difftime(attr(res, "when"), Sys.time()) < delta)
    return(res)

  ## Load data
  data <- available.packages(...)
  res <- as.data.frame(data, stringsAsFactors = FALSE)

  class(res) <- c("available_packages", class(res))
  attr(res, "when") <- Sys.time()
  saveCache(res, key = key, dirs = dirs)
  res
}

#' @export
as.list.available_packages <- function(x, ...) {
  n <- nrow(x)
  res <- vector("list", length = n)
  names(res) <- x$Package
  for (kk in seq_len(n)) {
    x_kk <- x[kk,]
    x_kk <- unclass(x_kk)
    attr(x_kk, "row.names") <- NULL
    res[[kk]] <- as.list(x_kk)
  }
  res
}

#' @export
print.available_packages <- function(x, ...) {
  n <- nrow(x)
  if (n <= 3) {
    str(as.list(x))
  } else {
    NextMethod("print")
  }
  invisible(x)
}

#' @export
craninfo <- CmdArgsFunction(function(pkgs, ...) {
  db <- available_packages()
  res <- subset(db, Package %in% pkgs)
  res
}, output = print)


