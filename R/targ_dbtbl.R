#' Create a new db_targ object
#'
#' @param con A database connection
#' @param schema Name of schema containing the table
#' @param table_name Name of the table
#' @param query Query to execute against the table. Defaults to selecting all rows and columns
#'
#' @return A `db_targ` object
#' @export
#' @importFrom glue glue_sql
db_targ <- function(con, schema, table_name, query = "select * from {`schema`}.{`table_name`}"){
  
  targ <- new_targets_dbtable(con, schema, table_name, query)
  validate_targets_dbtable(targ)
  
  targ
}

new_targets_dbtable <- function(con, schema, table_name, query){
  dbtbl <- c(schema = schema, table_name = table_name, query = glue::glue_sql(query, .con = con))
  class(dbtbl) <- 'db_targ'
  attr(dbtbl, "last_update") <- Sys.time()
}

validate_targets_dbtable <- function(db_targ){
  
  if (!all(sapply(db_targ, is.character))){
    stop("schema, table_name, and query must all be character strings")
  }
  
  if (!all(c('schema', 'table_name', 'query') %in% names(db_targ))){
    stop("db_targ missing required fields")
  }
  
}