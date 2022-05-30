read_db_targ <- function(con, targ){
  validate_targets_dbtable(targ)
  
  res <- DBI::dbGetQuery(con, targ[['query']])
  
  res
}