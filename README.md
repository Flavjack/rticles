# Rticles: template for technical documents using bookdown package.

## Features

- Thesis and articles template
- Export in word and html document
- Word improved template
- Bibliography citation
- R workflow for data analysis
- Scientific graphic quality

Example: <https://flavjack.github.io/rticles/>

## Softwars to install

It is recommended install and create an account if is needed for the following apps, all are free and can be complemented with reproducible research.

- R <https://cran.rstudio.com/>
- Rstudio <https://rstudio.com/products/rstudio/download/>
- Git <https://git-scm.com/>
- Zotero <https://www.zotero.org/download/>
- Google account: Gsuit

## How to use the template

### Clone the repository

Clone the **"rticles"** repository in the following link.
Use the terminal in Rstudio

```{git}

bash
prj="project_name"
mkdir git
cd git
git clone https://github.com/Flavjack/rticles.git $prj
cd $prj
mv 'rticles.Rproj' $prj.Rproj
open $prj.Rproj
open .

```

### Install the following R packages

```{r packagas}

install.packages("devtools")# For install packages and complements from dev sources
install.packages("bookdown") # Required for use the present template
install.packages("citr") # Use Zotero for citations
install.packages("knitr") # Base of the bookdown template
install.packages("tidyverse") # Data manipulation
install.packages("googlesheets4") # Read/write google sheets files
install.packages("agricolae") # Agriculture data analisys
install.packages("GerminaR") # Germination analisys and line and bar easy plots
install.packages("compareGroups")  # Tables for compare treatments 
install.packages("FactoMineR")  # Multivariate data anallisys
install.packages("cowplot") # For export and mergue figures 
install.packages("grid") # For mergue figures 
install.packages("png") # Import png files
install.packages("jpeg") # Import jpeg files

devtools::install_github("lbusett/insert_table") # Insert table with copy and paste (Not in CRAN)
devtools::install_github("flavjack/GerminaR")
devtools::install_github("tidyverse/googlesheets4")

```

If all packages are installed correctly shoul be appear the **"Build"** button in the Rstudio IDE (Integrated Development Environment).

Play the **"Build"** button and wait until compile and if all is okay pop-up window will be appeare with webpage version of the document.

If you want to modify the document, open **"index.Rmd"** file and change the text and code.

So, now you are ready to go and produce your first document!

## Folders and files

| Type   	| Name          	| Removable   	| Description                                                	|
|--------	|---------------	|-------------	|------------------------------------------------------------	|
| fle    	| index.Rmd     	| NO          	| File that produce the article (code/figures/tables).      	|
| file   	| rticle.Rproj  	| NO          	| Rename the file according your repository name.            	|
| file   	| .gitignore    	| NO          	|                                                            	|
| file   	| _bookdown.yml 	| NO          	| Options to compile the document.                          	|
| file   	| _output.yml   	| NO          	| html options for the web page.                            	|
| file   	| README.rmd    	| YES         	| It is the repository description!                          	|
| folder 	| cnfg          	| NO          	| The web page style, bib files, R and word style templates.	|
| folder 	| files          	| YES         	| Images and files that are included in the document.        	|
| folder 	| docs          	| YES         	| Files for deploy the web page using github pages).        	|


## About the docuent

A document is building with _Lorem Ipsum_ and the examples and tables use the dataset from GerminaR package.

###  Dataset

The dataset is a germination data example* with a completely randomized design with four replications per treatment under laboratory conditions. The first factor corresponds to five levels of sodium chloride (NaCl) (0, 0.5, 1.0, 1.5 and 2 MPa), and the second factor corresponds to four levels of temperature (25°C, 30°C, 35°C and 40°C).

Source: <https://docs.google.com/spreadsheets/d/1QziIXGOwb8cl3GaARJq6Ez6aU7vND_UHKJnFcAKx0VI/edit#gid=137089581>

*Lozano-Isla, Flavio, Omar E. Benites-Alfaro, and Marcelo F. Pompelli, ‘GerminaR: An R Package for Germination Analysis with the Interactive Web Application “GerminaQuant for R”’, Ecological Research, 34.2 (2019), 339–46 <https://doi.org/10.1111/1440-1703.1275>

# Bookdown configuration

## Thesis cover page yaml

```{yaml}
title: "UNIVERSIDAD <br> FACULTAD <br> `r if (!knitr:::is_html_output()) knitr::include_graphics('cnfg/icons/unalm.png')`"
subtitle: "THESIS TITLE"
author: "TESIS PARA OPTAR EL TITULO DE  <br> NOMBRES Y APELLIDOS"
date: "`r if (knitr:::is_html_output()) {format(Sys.time(), '%d %b %Y %X')} else {'PLACE <br> YEAR'}`"
```

## Include section only in the htlm document

`r if (knitr:::is_html_output()) '# Figures'`

## Include section only in the word document

`r if (!knitr:::is_html_output()) '# Figures'`

## Blocks

```{block, echo = T, type='rmd-important'}
<!-- caution - important - note - tip - warning -->

Texto!

```

# Markdown cheatsheet

Salto de página

\newpage 

Cita textual

@CiteKey

Cita contextual

[@CiteKey]

**negrita**

*italica*

upper^indice^

sub_indice_

Linea horizonatal

***

## Insert table

Create a Gsheet with tabname "tab". The tab should be 3 colums: 

- table: tab name
- description: title caption

```{r chunk_name}
sheet <- "chunk_name"
title <- "Table caption"
note <- "Nota de pie de página"
gs %>% # Gsheet dataset
  sheets_read(sheet) %>% 
  kable(caption = title) %>% 
  add_footnote(notation = "none", label = note)
```

\@ref(tab:table_name) 

## Insert figure

Create a Gsheet with tabname "fig". The tab should be 3 colums: 

- figure: "chunk_name"
- url: image url 
- description: title caption

```{r chunk_name, fig.cap="Figure caption"}
fig <- "chunk_name"
sheet <- "fig"
gs %>% 
  sheets_read(sheet) %>% 
  filter(figure == fig) %>%
  select(url) %>% 
  as_vector() %>% 
  include_graphics()
```

\@ref(fig:figure_name)

## Include references

`r if (knitr::is_html_output()){'
# References 
<div id="refs"></div>'}`

`r if (!knitr::is_html_output()){'
# References
<div id="refs"></div>'}`

## Include another Rmd file

```{r chunk_name, child = 'file.Rmd'}
```

## Include pdf

<embed src="files/file_name.pdf" width="100%" height="500" alt="pdf" pluginspage="http://www.adobe.com/products/acrobat/readstep2.html">

## Include video or slides

<iframe width="100%" height="450" src="https://www.youtube.com/embed/video_id" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# Git useful codes

```{git}

# Import changes from origen
git pull

# Push changes to origen
git add .
git commit -m "message"
git push 

# re-write local files from origen
git fetch --all
git reset --hard origin/master
git pull origin master

# Force push to origen
git push -f origin master

# Undoing Multiple Commits
git reset --hard <commit>

```



