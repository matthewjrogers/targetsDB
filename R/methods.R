str.targ_dbtbl <- function(object, ...){
  cat("Schema : ", object[['schema']], "\n",
      "Table  : ", object[['table_name']], "\n",
      sep = ""
  )
}


print.targ_dbtbl <- function(x, ...){
  cat("Schema : ", x[['schema']], "\n",
      "Table  : ", x[['table_name']], "\n",
      "Last Updated : ", as.character(attr(x, 'update')),
      sep = ""   
  )
}