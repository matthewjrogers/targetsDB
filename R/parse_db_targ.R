#' Partse a `db_targ` stored as a .rds file
#'
#' @param file_path Path to a .rds file
#'
#' @return A `db_targ` object
#' @export
#'
parse_db_targ <- function(file_path){
  if (!grepl("rds$|Rds$|RDS$", file_path)){
    stop("Please provide a path to a .rds file")
  }
  
  if (!file.exists(file_path)){
    stop("File does not exist. Please provide a valid filepath")
  }
  
  targ <- readRDS(file_path)
  
  validate_targets_dbtable(targ)
  
  targ
  
}