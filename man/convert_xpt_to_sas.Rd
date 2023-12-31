% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert_xpt_to_sas.R
\name{convert_xpt_to_sas}
\alias{convert_xpt_to_sas}
\title{convert xpt to sas function}
\usage{
convert_xpt_to_sas(xpt_folder)
}
\arguments{
\item{xpt_folder}{input a file directory where your xpt files are}
}
\value{
sas7bdat files
}
\description{
convert xpt to sas function
}
\examples{
xpt_folder <- 'XX:/convert/xpt_test'
xpt_files <- list.files(path = xpt_folder, pattern = "\\\\.xpt$", full.names = TRUE)
for (file in xpt_files) {
sas_file <- gsub("\\\\.xpt$", ".sas7bdat", file)
if (!file.exists(sas_file)) {
  df <- haven::read_xpt(file)
  haven::write_sas(df, sas_file)
  cat("Converted", file, "to SAS7BDAT format.\n")
} else {
  cat(sas_file, "already exists. Skipping...\n")
  }
  }
}
