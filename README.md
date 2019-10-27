# Rticles: template for articles using bookdown package.

## Features

- Export in word and html document
- Word improved template
- Bibliography citation
- R workflow for data analysis
- Scientific graphic quality

Example: [flavjack.github.io/rticles/](https://flavjack.github.io/rticles/){target="_blank"}.

## How to use the template

### Install the following packages:

```{r}

pkgs <- c(
  "devtools", 
  "bookdown", 
  "citr",
  "knitr",
  "tidyverse",
  "googlesheets", 
  "agricolae",
  "GerminaR",
  "compareGroups", 
  "FactoMineR",
  "cowplot", 
  "grid", 
  "png",
  "jpeg")

install.packages(pkgs)

devtools::install_github("lbusett/insert_table")

```
If all packages are installed correctly shoul be appear the **"Build"** button in the Rstudio IDE (Integrated Development Environment).

Play the "Build" button and wait until compile and if all is okay pop-up window will be appeare with webpage version of the document.

If you want to modify the document, open **"index.Rmd"** file and change the text and code.

So, now you are ready to go and produce your first document!

## Folders and files

- index.Rmd (not remove):: file for write the document.
- ref.Rmd (not remove) :: files with for generate the packages bib file and create the folders needed for the compile.
- rticle.Rproj (rename/not remove) :: rename the file according your repository name.
- .gitignore (not remove)
- .httr-oauth (removable) :: used for the process authentification in googlesheets package.
- README.rmd (removable) :: It is this document!
- _bookdown.yml (not remove) :: This file you found the compile options
- _output.yml (not remove) :: html option for the web document
- docs (removable) :: folder with the files for the html to deploy the webpage (for github pages)
- img (not remove) :: folder with the information and image files for compile the final document
- style (not remove) :: Include the webpage style, the bib files and the word style documents

## Addicional applications to install

It is recommended install and create an account for the following apps, all are free and can be complemented with reproducible research.

- Github desktop : [desktop.github.com/](https://desktop.github.com/){target="_blank"}.

- Zotero: [zotero.org/download/](https://www.zotero.org/download/){target="_blank"}.

## Dataset

The dataset is a germination data example[^*] with a completely randomized design with four replications per treatment under laboratory conditions. The first factor corresponds to five levels of sodium chloride (NaCl) (0, 0.5, 1.0, 1.5 and 2 MPa), and the second factor corresponds to four levels of temperature (25°C, 30°C, 35°C and 40°C).

Source: [https://docs.google.com/spreadsheets/d/1QziIXGOwb8cl3GaARJq6Ez6aU7vND_UHKJnFcAKx0VI/edit#gid=137089581](https://docs.google.com/spreadsheets/d/1QziIXGOwb8cl3GaARJq6Ez6aU7vND_UHKJnFcAKx0VI/edit#gid=137089581){target="_blank"}.

[^*]: Lozano-Isla, Flavio, Omar E. Benites-Alfaro, and Marcelo F. Pompelli, ‘GerminaR: An R Package for Germination Analysis with the Interactive Web Application “GerminaQuant for R”’, Ecological Research, 34.2 (2019), 339–46 [https://doi.org/10.1111/1440-1703.1275](https://doi.org/10.1111/1440-1703.1275){target="_blank"}





