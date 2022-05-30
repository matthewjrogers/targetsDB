#' Write a data frame to a database using a `db_targ`
#'
#' @param con A database connection
#' @param df A data frame
#' @param targ A `db_targ` object
#' @param ... Arbitrary arguments to pass to `DBI::dbWriteTable`
#'
#' @export
#'
write_db_targ <- function(con, df, targ, ...){
  validate_targets_dbtable(targ)
  
  tbl <- DBI::Id(schema = targ[['schema']], table = targ[['table_name']])
  
  DBI::dbWriteTable(con, tbl, df, ...)
}