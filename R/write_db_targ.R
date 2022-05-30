write_db_targ <- function(con, df, targ, ...){
  validate_targets_dbtable(targ)
  
  tbl <- DBI::Id(schema = targ[['schema']], table = targ[['table_name']])
  
  DBI::dbWriteTable(con, tbl, df, ...)
}