# Rticles: template for articles using bookdown package.

## Features

- Export in word and html document
- Word improved template
- Bibliography citation
- R workflow for data analysis
- Scientific graphic quality

Example: <https://flavjack.github.io/rticles/>

## How to use the template

### Clone the repository

Clone or dowload the **"rticles"** repository in the following link.

Repository: <https://github.com/Flavjack/rticles>

1. Rename the folder. ei "rticles" --> "potato".
1. Rename the R project file. ei "rticles.Rproj" --> potato.Rproj (the same folder name is suggested).
1. Open the R project file.
1. Install the R packages required.

### Install the following packages:

```{r}
install.packages("devtools")
install.packages("bookdown")
install.packages("citr")
install.packages("knitr")
install.packages("tidyverse")
install.packages("googlesheets4")
install.packages("agricolae")
install.packages("GerminaR")
install.packages("compareGroups")
install.packages("FactoMineR")
install.packages("cowplot")
install.packages("grid")
install.packages("png")
install.packages("jpeg")

devtools::install_github("lbusett/insert_table")
devtools::install_github("flavjack/GerminaR")
```
If all packages are installed correctly shoul be appear the **"Build"** button in the Rstudio IDE (Integrated Development Environment).

Play the **"Build"** button and wait until compile and if all is okay pop-up window will be appeare with webpage version of the document.

If you want to modify the document, open **"index.Rmd"** file and change the text and code.

So, now you are ready to go and produce your first document!

## Folders and files

| Type   	| Name          	| Removable   	| Description                                                	|
|--------	|---------------	|-------------	|------------------------------------------------------------	|
| fle    	| index.Rmd     	| NO          	| File that produce the article (code/figures/tables).      	|
| file   	| rticle.Rproj  	| NO (Rename) 	| Rename the file according your repository name.            	|
| file   	| .gitignore    	| NO          	|                                                            	|
| file   	| _bookdown.yml 	| NO          	| Options to compile the document.                          	|
| file   	| _output.yml   	| NO          	| html options for the web page.                            	|
| file   	| .httr-oauth   	| YES         	| Used for authentification process in googlesheets package. 	|
| file   	| README.rmd    	| YES         	| It is the repository description!                          	|
| folder 	| cnfg          	| NO          	| The web page style, bib files, R and word style tempaltes.	|
| folder 	| docs          	| YES         	| Files for deploy the web page using github pages).        	|
| folder 	| img           	| YES         	| Images and files that are included in the document.        	|

## Addicional applications to install

It is recommended install and create an account for the following apps, all are free and can be complemented with reproducible research.

- Github desktop : <https://desktop.github.com/>
- Zotero: <https://www.zotero.org/download/>

## Dataset

The dataset is a germination data example* with a completely randomized design with four replications per treatment under laboratory conditions. The first factor corresponds to five levels of sodium chloride (NaCl) (0, 0.5, 1.0, 1.5 and 2 MPa), and the second factor corresponds to four levels of temperature (25°C, 30°C, 35°C and 40°C).

Source: <https://docs.google.com/spreadsheets/d/1QziIXGOwb8cl3GaARJq6Ez6aU7vND_UHKJnFcAKx0VI/edit#gid=137089581>


*Lozano-Isla, Flavio, Omar E. Benites-Alfaro, and Marcelo F. Pompelli, ‘GerminaR: An R Package for Germination Analysis with the Interactive Web Application “GerminaQuant for R”’, Ecological Research, 34.2 (2019), 339–46 <https://doi.org/10.1111/1440-1703.1275>


