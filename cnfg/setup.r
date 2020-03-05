# -------------------------------------------------------------------------
# Packages ----------------------------------------------------------------
# -------------------------------------------------------------------------

packages <- c(
  "devtools", # For install packages and complements from dev sources
  "bookdown", # Required for use the present template
  "citr",  # Use zotero for citations
  "knitr", # Base of the bookdown template
  "kableExtra", # Table notes!
  "inserttable", # Insert table with copy and paste
  "tidyverse", # Data manipulation
  "googlesheets4", # Read/write google sheets files
  "googledrive", # Download files from googledrive
  "readxl", # Read excel files
  "agricolae", # Agriculture data analysis
  "GerminaR", # Germination analysis and line and bar easy plots
  "gtsummary", # Tables for compare treatments 
  "FactoMineR", # Multivariate data analysis
  "heatmaply", # Correlation plot
  "cowplot", # For export and merge figures 
  "grid", # For merge figures 
  "png", # Import png files
  "jpeg" # Import jpg files
)

installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}
invisible(lapply(packages, library, character.only = TRUE))
rm(packages, installed_packages)
  
# devtools::install_github("lbusett/insert_table") # Insert table with copy and paste (Not in CRAN)
# devtools::install_github("Flavjack/GerminaR") # Germination analysis and line and bar easy plots

# -------------------------------------------------------------------------
# Knitr options -----------------------------------------------------------
# -------------------------------------------------------------------------

knitr::opts_chunk$set(
  fig.align = "center", # Center images in the export file
  out.width = "98%", # Figure width in html
	echo = FALSE, # Avoid print code in the export file
  message = FALSE,  # Avoid print messages in the export file
  warning = FALSE # Avoid print messages in the export file
  )

# -------------------------------------------------------------------------
# Compile options ---------------------------------------------------------
# -------------------------------------------------------------------------

options(
  digits = 4, # Number of digits in the values
  OutDec= ".", # Use "." instead of "," in the decimal values
  scipen = 99, # Avoid use "6e-04"
  knitr.kable.NA = "", # NA values will appear as empty cell
  knitr.table.format = "pandoc", # Format for export tables
  citr.use_betterbiblatex = FALSE, # For zotero addin 
  gargle_oob_default = TRUE, # googlesheets auth process
  gtsummary.print_engine = "kable"
  ) 

# -------------------------------------------------------------------------
# Packages citation -------------------------------------------------------
# -------------------------------------------------------------------------

knitr::write_bib(c(.packages()),'cnfg/pkgs.bib')

# -------------------------------------------------------------------------
# Folder options ----------------------------------------------------------
# -------------------------------------------------------------------------

if(!dir.exists("files"))
{dir.create("files")}
if(dir.exists("docs"))
{zip::zipr(zipfile = "docs/files.zip", files = "files")}

# -------------------------------------------------------------------------
# authorize googledrive & googlesheets ------------------------------------
# -------------------------------------------------------------------------

sheets_auth(T)
drive_auth(T)

