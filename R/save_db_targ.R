#' Save a `db_targ` object. Convenience wrapper for base `saveRDS`
#'
#' @param targ A `db_targ` object
#' @param file_path File to save the `db_targ` object to. Must be a .rds file
#'
#' @return file_path, invisibly
#' @export
#'
save_db_targ <- function(targ, file_path){
  validate_targets_dbtable(targ)
  
  if (!grepl("rds$|Rds$|RDS$", file_path)){
    stop("Please provide a path to a .rds file")
  }
  
  saveRDS(targ, file_path)
  
  return(invisible(file_path))
}