#' convert xpt to sas function
#'
#' @param xpt_folder input a file directory where your xpt files are
#'
#' @return sas7bdat files
#' @export 
#'
#' @examples
#' xpt_folder <- 'XX:/convert/xpt_test'
#' xpt_files <- list.files(path = xpt_folder, pattern = "\\.xpt$", full.names = TRUE)
#' for (file in xpt_files) {
#' sas_file <- gsub("\\.xpt$", ".sas7bdat", file)
#' if (!file.exists(sas_file)) {
#'   df <- haven::read_xpt(file)
#'   haven::write_sas(df, sas_file)
#'   cat("Converted", file, "to SAS7BDAT format.\n")
#' } else {
#'   cat(sas_file, "already exists. Skipping...\n")
#'   }
#'   }
convert_xpt_to_sas <- function(xpt_folder){
  # Load the necessary package
  library(haven)
  
  
  
  # List all the XPT files in the folder
  xpt_files <- list.files(path = xpt_folder, pattern = "\\.xpt$", full.names = TRUE)
  
  # Loop over each XPT file and convert it to SAS7BDAT format
  for (file in xpt_files) {
    sas_file <- gsub("\\.xpt$", ".sas7bdat", file)
    if (!file.exists(sas_file)) {
      df <- haven::read_xpt(file)
      haven::write_sas(df, sas_file)
      cat("Converted", file, "to SAS7BDAT format.\n")
    } else {
      cat(sas_file, "already exists. Skipping...\n")
    }
  }
}