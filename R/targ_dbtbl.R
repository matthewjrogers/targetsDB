#' Create a new db_targ object
#'
#' @param schema Name of schema containing the table
#' @param table_name Name of the table
#' @param query Query to execute against the table. Defaults to selecting all rows and columns
#'
#' @return A `db_targ` object
#' @export
#'
db_targ <- function(schema, table_name, query = "select * from {`schema`}.{`table_name`}"){
  
  targ <- new_targets_dbtable(schema, table_name, query)
  validate_targets_dbtable(targ)
  
  targ
}

new_targets_dbtable <- function(schema, table_name, query = "select * from {`schema`}.{`table_name`}"){
  dbtbl <- c(schema = schema, table_name = table_name, query = glue::glue_sql(query))
  class(dbtbl) <- 'db_targ'
  attr(dbtbl, "last_update") <- Sys.time()
}

validate_targets_dbtable <- function(db_targ){
  
  if (!all(sapply(db_targ, is.character))){
    stop("schema, table_name, and query must all be character strings")
  }
  
}