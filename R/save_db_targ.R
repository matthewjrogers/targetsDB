save_db_targ <- function(targ, file_path){
  validate_targets_dbtable(targ)
  
  if (!grepl("rds$|Rds$|RDS$", file_path)){
    stop("Please provide a path to a .rds file")
  }
  
  saveRDS(targ, file_path)
  
  return(invisible(file_path))
}