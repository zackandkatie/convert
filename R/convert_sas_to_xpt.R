#' convert sas to xpt function
#'
#' @param sas_folder input a file directory where your sas files are
#'
#' @return xpt files
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
convert_sas_to_xpt <- function(sas_folder){
  # Load the necessary package
  library(haven)
  
  
  
  # List all the SAS files in the folder
  sas_files <- list.files(path = sas_folder, pattern = "\\.sas7bdat$", full.names = TRUE)
  
  # Loop over each SAS7BDAT file and convert it to XPT format
  for (file in sas_files) {
    xpt_file <- gsub("\\.sas7bdat$", ".xpt", file)
    if (!file.exists(xpt_file)) {
      df <- haven::read_sas(file)
      haven::write_xpt(df, xpt_file)
      cat("Converted", file, "to XPT format.\n")
    } else {
      cat(xpt_file, "already exists. Skipping...\n")
    }
  }
}