ModeOpenQuestion <- function(data, col_name, top_n = 1)
{
  COLUMN <- data[[col_name]]
  TABLE <- table(COLUMN)
  sorted_indices <- order(-TABLE)

  top_modes <- names(TABLE)[sorted_indices[1:min(top_n, length(TABLE))]]
  top_freq <- TABLE[top_modes]

  result <- data.frame(frequency = top_freq)
  return(result)
}
