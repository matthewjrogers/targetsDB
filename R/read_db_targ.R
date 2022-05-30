#' Read a `db_targ` table
#'
#' @param con A database connection
#' @param targ A `db_targ` object
#'
#' @return A data.frame
#' @export
#'
read_db_targ <- function(con, targ){
  validate_targets_dbtable(targ)
  
  res <- DBI::dbGetQuery(con, targ[['query']])
  
  res
}