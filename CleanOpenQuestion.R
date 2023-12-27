CleanOpenQuestion <- function(pattern) {

  GLOBENV <- ls(globalenv())
  MATCH <- grep(pattern, GLOBENV, value = TRUE)
  MATCH <- MATCH[MATCH != pattern]
  for (match_obj in MATCH) {
    if (match_obj %in% GLOBENV && is.data.frame(get(match_obj))) {
      rm(list = match_obj, envir = globalenv())

    }
  }
  if (pattern %in% GLOBENV && is.data.frame(get(pattern))) {
    result <- sapply(get(pattern), function(column) sum(column != "0" & !is.na(column)))
  }
  return(result)
}
CleanOpenQuestion("info31")

