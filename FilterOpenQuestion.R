FilterOpenQuestion <- function(data, col_name, patterns, result_col_name)
{
  COLUMN <- data[[col_name]]
  REMOVEACCENT <- function(text)
  {
    text <- iconv(text, to = "ASCII//TRANSLIT")
    return(text)
  }
  patterns <- tolower(sapply(patterns, REMOVEACCENT))
  COLUMN <- tolower(REMOVEACCENT(COLUMN))
  MATCH <- lapply(patterns, function(pattern)
    grep(pattern, COLUMN, value = TRUE))
  MATCH <- unique(unlist(MATCH))
  NONMATCH <- COLUMN
  NONMATCH[NONMATCH %in% MATCH] <- NA_character_
  COLUMN[!(COLUMN %in% MATCH)] <- "0"
  ResultDF <- data.frame(NONMATCH, COLUMN)
  names(ResultDF) <- c(col_name, result_col_name)
  return(ResultDF)
}



# version pour les strings précises.
FilterOpenQuestion2 <- function(data, col_name, patterns, result_col_name)
{
  COLUMN <- data[[col_name]]
  REMOVEACCENT <- function(text)
  {
    text <- iconv(text, to = "ASCII//TRANSLIT")
    return(text)
  }
  patterns <- tolower(sapply(patterns, REMOVEACCENT))
  COLUMN <- tolower(REMOVEACCENT(COLUMN))
  # Remove "-" from the column
  COLUMN <- gsub("[-']", "", COLUMN)
  MATCH <- lapply(patterns, function(pattern) {
    grep(paste0("^", pattern, "$"), COLUMN, value = TRUE)
  })
  MATCH <- unique(unlist(MATCH))
  NONMATCH <- COLUMN
  NONMATCH[NONMATCH %in% MATCH] <- NA_character_
  COLUMN[!(COLUMN %in% MATCH)] <- "0"
  ResultDF <- data.frame(NONMATCH, COLUMN)
  names(ResultDF) <- c(col_name, result_col_name)
  return(ResultDF)
}
