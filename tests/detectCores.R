library("parallel")

for (logical in c(FALSE, TRUE)) {
  ncores <- detectCores(logical = logical)
  msg <- sprintf("detectCores(logical = %s) = %d", logical, ncores)
  message(msg)
}

ncores <- detectCores()
msg <- sprintf("detectCores() = %d", ncores)
message(msg)
stop(msg)

