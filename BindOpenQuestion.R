BindOpenQuestion <- function(...)
{
  DATAFRAMES <- list(...)
  if (!all(sapply(DATAFRAMES, inherits, "data.frame"))) 
  {
    stop("Input must be a list of data frames")
  }
  BINDDF <- Reduce(cbind, DATAFRAMES)
  DUPLICATECOL <- names(BINDDF)[duplicated(names(BINDDF))]
  for (col in DUPLICATECOL) 
  {
    COLINDICES <- grep(col, names(BINDDF))
    rowsNA <- apply(BINDDF[, COLINDICES], 1,
                     function(row) any(is.na(row)))
    for (idx in COLINDICES) 
    {
      BINDDF[[idx]][rowsNA] <- NA
    }
    BINDDF <- BINDDF[, -c(COLINDICES[-1]), drop = FALSE]
  }
  return(BINDDF)
}
