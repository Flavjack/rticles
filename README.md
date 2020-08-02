# Rticles: template for technical documents using bookdown

## Features

-   Thesis and articles template
-   Export word and html document
-   Word improved template
-   Bibliography citation
-   R workflow for data analysis
-   Scientific graphic quality

Example: <https://flavjack.github.io/rticles/>

## Softwars to install

It is recommended install and create an account if is needed for the following apps, all are free and can be complemented with reproducible research.

-   R <https://cran.rstudio.com/>
-   Rstudio <https://rstudio.com/products/rstudio/download/>
-   Git <https://git-scm.com/>
-   Zotero <https://www.zotero.org/download/>
-   Google account: Gsuit

## How to use the template

### Use the template or clone the repository

-   You can use "**rticles**" as template from GitHub: <https://github.com/Flavjack/rticles>

or

-   You can clone the "**rticles**" repository using the terminal in Rstudio, for windows user using bash (install Git)

``` {.{git}}
bash
prj="project_name"
info="project info"
gituser="Flavjack"
repo="https://github.com/Flavjack/rticles"
cd
mkdir git
cd git
git clone $repo.git $prj
cd $prj
mv 'rticles.Rproj' $prj.Rproj
curl -u $gituser https://api.github.com/user/repos -d "{\"name\":\"$prj\", \"description\": \"$info\", \"private\": \"true\"}"
git remote rm origin
git commit -m "starting rticles"
git remote add origin https://github.com/$gituser/$prj.git
git push -u origin master
open $prj.Rproj
open .
```

### Document Setup

1.  Run the first chunk in the "**index.Rmd**" called "setup" and all the packages will be installed automatically.

2.  If all packages are installed correctly shoul be appear the "**Build**" button in the Rstudio IDE (Integrated Development Environment).

3.  Play the "**Build**" button and wait until compile the document and if all is okay pop-up window will be appeare with the html version of the document.

4.  You can modify the document changing the text and code in the "**index.Rmd**" file.

5.  Now you are ready to go and produce your first document!

## Folders and files

| Type   | Name           | Removable | Description                                          |
|--------|----------------|-----------|------------------------------------------------------|
| folder | cnfg           | NO        | Contains all document settings.                      |
| file   | index.Rmd      | NO        | File that produce the article (code/figures/tables). |
| file   | rticle.Rproj   | NO        | Rename the file according your repository name.      |
| file   | .gitignore     | NO        | System options.                                      |
| file   | \_bookdown.yml | YES       | Options to compile the document.                     |
| file   | \_output.yml   | YES       | html options for the web page.                       |
| file   | README.rmd     | YES       | It is the repository description!                    |
| folder | files          | YES       | Images and files that are included in the document.  |
| folder | docs           | YES       | Files for deploy the web page using github pages).   |

## About the docuent

The document is building with *Lorem Ipsum* text, and the dataset, examples and tables used are from `GerminaR` package.

### Dataset

The dataset is a germination data example\* with a completely randomized design with four replications per treatment under laboratory conditions. The first factor corresponds to five levels of sodium chloride (NaCl) (0, 0.5, 1.0, 1.5 and 2 MPa), and the second factor corresponds to four levels of temperature (25°C, 30°C, 35°C and 40°C).

Source: <https://docs.google.com/spreadsheets/d/1QziIXGOwb8cl3GaARJq6Ez6aU7vND_UHKJnFcAKx0VI/edit#gid=137089581>

\*Lozano-Isla, Flavio, Omar E. Benites-Alfaro, and Marcelo F. Pompelli, 'GerminaR: An R Package for Germination Analysis with the Interactive Web Application "GerminaQuant for R"', Ecological Research, 34.2 (2019), 339--46 <https://doi.org/10.1111/1440-1703.1275>

## Include another Rmd file

`{r chunk_name, child = 'file.Rmd'}`

## Include pdf

``` {.{html}}
<embed src="files/file_name.pdf" width="100%" height="500" alt="pdf" pluginspage="http://www.adobe.com/products/acrobat/readstep2.html">
```

## Include video or slides

``` {.{html}}
<iframe width="100%" height="450" src="https://www.youtube.com/embed/video_id" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
```

# Git useful codes

``` {.{git}}
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
