
knitr::opts_chunk$set(
  fig.align = "center", # Center images in the export file
	echo = FALSE, # Avoid print code in the export file
  message = FALSE,  # Avoid print messages in the export file
  warning = FALSE # Avoid print messages in the export file
  )

options(
  digits = 4, # Number of digits in the values
  OutDec= ".", # Use "." insted of "," in the decimal values
  scipen = 99, # Avoid use "6e-04"
  knitr.kable.NA = '', # NA values will appear as empty cell
  knitr.table.format = "pandoc", # Format for export tables
  citr.use_betterbiblatex = FALSE, # For zotero addin 
  gargle_oob_default = TRUE # Googlesheets4 auth process
  ) 

library(devtools) # For install packages and complements from dev sources
library(bookdown) # Required for use the present template
library(citr) # Use Zotero for citations
library(knitr) # Base of the bookdown template
library(inserttable) # Insert table with copy and paste
library(tidyverse) # Data manipulation
library(googlesheets4) # Read/write google sheets files
library(agricolae) # Agriculture data analisys
library(GerminaR) # Germination analisys and line and bar easy plots
library(compareGroups) # Tables for compare treatments 
library(FactoMineR) # Multivariate data anallisys
library(cowplot) # For export and mergue figures 
library(grid) # For mergue figures 
library(png) # Import png files
library(jpeg) # Import jpeg files




