# Rticles: template for technical documents using bookdown

## Features

- Thesis and articles template
- Export word and html document
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

### Use the template or clone the repository

Use the template from GitHub: <https://github.com/Flavjack/rticles>

Clone the **"rticles"** repository using the terminal in Rstudio

```{git}
bash
prj="project_name"
gituser="flavjack"
cd 
mkdir git
cd git
git clone https://github.com/Flavjack/rticles.git $prj
cd $prj
mv 'rticles.Rproj' $prj.Rproj
git remote rm origin
open $prj.Rproj
open .
```

### R packages

Run the first chunk in the "index.Rmd" called "setup" and all the packages will be installed automatically.

If all packages are installed correctly shoul be appear the **"Build"** button in the Rstudio IDE (Integrated Development Environment).

Play the **"Build"** button and wait until compile the document and if all is okay pop-up window will be appeare with webpage version of the document.

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

The document is building with _Lorem Ipsum_ text, and the examples and tables use the dataset from GerminaR package.

###  Dataset

The dataset is a germination data example* with a completely randomized design with four replications per treatment under laboratory conditions. The first factor corresponds to five levels of sodium chloride (NaCl) (0, 0.5, 1.0, 1.5 and 2 MPa), and the second factor corresponds to four levels of temperature (25°C, 30°C, 35°C and 40°C).

Source: <https://docs.google.com/spreadsheets/d/1QziIXGOwb8cl3GaARJq6Ez6aU7vND_UHKJnFcAKx0VI/edit#gid=137089581>

*Lozano-Isla, Flavio, Omar E. Benites-Alfaro, and Marcelo F. Pompelli, ‘GerminaR: An R Package for Germination Analysis with the Interactive Web Application “GerminaQuant for R”’, Ecological Research, 34.2 (2019), 339–46 <https://doi.org/10.1111/1440-1703.1275>

# Bookdown configuration

## Thesis cover page yaml

```{yaml}
title:  |-  
  Universidad Nacional  
  Facultad de  
  Carrera Profesional de  
  `r if (!knitr:::is_html_output()) knitr::include_graphics('cnfg/icons/logo.png')`  
subtitle:  |-  
  __________________________________________________________  
  TITLE  
  __________________________________________________________  
  *Tesis para Optar el Título *  
author: "Nombres y Apelidos"
date:  |-  
  `r if (knitr:::is_html_output()) {format(Sys.time(), '%d %b %Y %X')}`
  Lugar-País  
  2020  
```

## Include section only in the html document

```{section_html}
`r if (knitr:::is_html_output()) '# Figures'`
```

## Include section only in the word document


```{section_word}
`r if (!knitr:::is_html_output()) '# Figures'`
```


## Blocks

```{block, echo = T, type='rmd-important'}
<!-- caution - important - note - tip - warning -->

Texto!

```

# Markdown cheatsheet


```{markdown}
# Cita textual

@CiteKey

# Cita contextual

[@CiteKey]

# Fonts

**negrita**

*italica*

upper^indice^

sub~indice~

# Page 

# Salto de página

\newpage 

# Linea horizonatal

***
```

# Import data from Gsheets to R

```{r dataset, include=FALSE}
# source("cnfg/debug.r")
source("cnfg/setup.r")
sheets_auth(T)
url <- "googlehseet_url"
gs <- as_sheets_id(url)
# browseURL(url)
xl <- gs %>% drive_download("files/fieldbook.xlsx", overwrite = T) %>% pluck(2)
fb <- xl %>% readxl::read_excel("fb") 
```

## Insert figure

Create a Gsheet with tabname "fig". The tab should be 3 colums: 

- figure: name to identify the figure ("chunk_name")
- description: title caption
- url: image url 

```{r chunk_name, fig.cap = title}
fig <- opts_current$get('label')
sheet <- "fig"
title <- xl %>% 
  read_excel(sheet) %>% 
  filter(figure == fig) %>%
  select(description) %>% 
  as_vector()
xl %>% 
  read_excel(sheet) %>% 
  filter(figure == fig) %>%
  select(url) %>% 
  as_vector() %>% 
  include_graphics()
knitr::opts_knit$set(eval.after = 'fig.cap')
# \@ref(fig:) 
```

Cite figure:

\@ref(fig:figure_name)

## Insert table

Create a Gsheet with tabname "tab". The tab should be 3 colums: 

- table: tab name with the table ("chunk_name")
- description: title caption
- note: sub title caption

```{r chunk_name}
tab <- opts_current$get("label")
sheet <- "tab"
title <- xl %>% 
  read_excel(sheet) %>% 
  filter(table == tab) %>%
  select(description) %>% 
  as_vector()
note <- xl %>% 
  read_excel(sheet) %>% 
  filter(table == tab) %>%
  select(note) %>% 
  as_vector()
xl %>% 
  read_excel(tab) %>% 
  kable(caption = title) %>% 
  add_footnote(notation = "symbol", label = note)
# \@ref(tab:) 
```

Cite table:

\@ref(tab:chunk_name) 

## Include references

```{markdown}
`r if (knitr::is_html_output()){'
# References 
<div id="refs"></div>'}`

`r if (!knitr::is_html_output()){'
# References
<div id="refs"></div>'}`
```

## Include another Rmd file

```{r chunk_name, child = 'file.Rmd'}
``` 

## Include pdf

```{html}
<embed src="files/file_name.pdf" width="100%" height="500" alt="pdf" pluginspage="http://www.adobe.com/products/acrobat/readstep2.html">
```

## Include video or slides

```{html}
<iframe width="100%" height="450" src="https://www.youtube.com/embed/video_id" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
```

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
