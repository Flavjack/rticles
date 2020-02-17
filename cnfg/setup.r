# -------------------------------------------------------------------------
# Packages ----------------------------------------------------------------
# -------------------------------------------------------------------------

packages <- c(
  "devtools", # For install packages and complements from dev sources
  "bookdown", # Required for use the present template
  "citr",  # Use Zotero for citations
  "knitr", # Base of the bookdown template
  "kableExtra", # Table notes!
  "inserttable", # Insert table with copy and paste
  "tidyverse", # Data manipulation
  "googlesheets4", # Read/write google sheets files
  "googledrive", # Dowload files from googledrive
  "readxl", # Read excel files
  "agricolae", # Agriculture data analisys
  "GerminaR", # Germination analisys and line and bar easy plots
  # "compareGroups", # Tables for compare treatments 
  "FactoMineR", # Multivariate data anallisys
  "cowplot", # For export and mergue figures 
  "grid", # For mergue figures 
  "png", # Import png files
  "jpeg" # Import jpeg files
)

installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}
invisible(lapply(packages, library, character.only = TRUE))
rm(packages, installed_packages)
  
# devtools::install_github("lbusett/insert_table") # Insert table with copy and paste (Not in CRAN)
# devtools::install_github("Flavjack/GerminaR") # Germination analisys and line and bar easy plots

# -------------------------------------------------------------------------
# Knitr options -----------------------------------------------------------
# -------------------------------------------------------------------------

knitr::opts_chunk$set(
  fig.align = "center", # Center images in the export file
  out.width = "98%", # Figure width in htlm
	echo = FALSE, # Avoid print code in the export file
  message = FALSE,  # Avoid print messages in the export file
  warning = FALSE # Avoid print messages in the export file
  )

# -------------------------------------------------------------------------
# Compile options ---------------------------------------------------------
# -------------------------------------------------------------------------

options(
  digits = 4, # Number of digits in the values
  OutDec= ".", # Use "." insted of "," in the decimal values
  scipen = 99, # Avoid use "6e-04"
  knitr.kable.NA = "", # NA values will appear as empty cell
  knitr.table.format = "pandoc", # Format for export tables
  citr.use_betterbiblatex = FALSE, # For zotero addin 
  gargle_oob_default = TRUE # Googlesheets4 auth process
  ) 

# -------------------------------------------------------------------------
# Folder options ----------------------------------------------------------
# -------------------------------------------------------------------------

if(!dir.exists("files"))
  {dir.create("files")}
if(dir.exists("docs"))
  {zip::zipr(zipfile = "docs/files.zip", files = "files")}


# Packages citation -------------------------------------------------------

knitr::write_bib(c(.packages()),'cnfg/pkgs.bib')
