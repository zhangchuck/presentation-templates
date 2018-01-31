# Presentation Templates

The goal of having a presentation workflow is to:

- build a new presentation very quickly using tools we're used to using anyways
- rebuild quickly and automatically after adjusting tables/graphics (e.g., presentation as code)
- iterate quickly on the aesthetics of the presentation without having
slow build times (e.g., presentation as visual media)

Initial Build
-------------

1. Freeze Data

- Before beginning work on the presentation, stop working on the data
- Don't modify the data until after the presentation is finished.

2. Figure out what kinds of tables and graphs are required

- Let this be informed by previous intermediate analysis.
- Identify code sections where the intermediate analysis genereated the tables.

3. Generate New Tables

- Have one `.R` file for generating graphs/tables each data file from step 1.
- If a table or graph requires more than one of the data files, create a
 separate `.R` file to handle the entire section.
- For each table, write the .tex output to `./tables/`
- For each image, write the output to `./images/`
- Attach `beepr::beep(sound=8)` at the bottom of the script for job complete notifications.

4. Place tables in a presentation

- use `\input{"./tables/[table].tex}`

5. Proofread the presentation and make `\\resizebox{}{}` adjustments in step 3 to
make sure the table/graphic fits properly.

6. Build presentation and iterate until good.

Additional Notes
================

Structuring the rmd presentation
--------------------------------

RMarkdown allows you to import other RMarkdown files:

````
```{r child="[#]_[section].Rmd", eval=T}
```
````

Create a wrapper file that uses these type of sections and will be used to build
the full presentation (e.g., `./0_presentation.Rmd`).

Default Beamer Settings
-----------------------

- Use the `includes:` part of the YAML  to include a preamble in the header and load packages into the
document ([link](http://rmarkdown.rstudio.com/beamer_presentation_format.html#includes))
- Use `_output.yml` to set default settings for the Rmd file.



Two-Column Slide Layout
-----------------------

Define macros for two-column layout in the preamble:

```
% Multicolumn Macros
\def\begincols{\begin{columns}}
\def\begincol{\begin{column}}
\def\endcol{\end{column}}
\def\endcols{\end{columns}}
```

and then in the body, we can use:

```
\begincols
    \begincol{.48\textwidth}

(Column 1)

    \endcol
    \begincol{.48\textwidth}

(Column 2)

    \endcol
\endcols
```

Further Improvements
====================

- Can we get an output-agnostic format?
    - output to HTML (for storing online)
    - output to PDF (for presenting in person/sending in emails?)
- Add equation labelling, cross-references and other improvements from Bookdown ([link](https://bookdown.org/yihui/bookdown/a-single-document.html))
    - Using `pdf_book2()` and the Beamer template?
- Can we improve `\begin{columns}` macros? (condense them?)
- Make the setup more tolerant via [TinyTex](https://yihui.name/tinytex/)
- Figure out a better Table format?
    - [Pander](https://github.com/Rapporter/pander)
- Can we make academic-y presentations in PureHTML?
    - is it as portable (or convertible) to PDF
    - what are the issues with this approach?
        - Generic table generation (booktabs style)
        - Regression table generation
        - Graphics

References
==========

- rticles
- Steven V Miller
- [Andrew Goldstone](https://andrewgoldstone.com/blog/2015/05/27/rmd-slides/)
- [Getting similar behavior in two output formats](https://stackoverflow.com/questions/33226675/how-to-get-bm-to-work-in-an-r-markdown-to-html-file)
- [Pandoc Manual](https://pandoc.org/MANUAL.html)
- [Beamer Presentation Function](https://github.com/rstudio/rmarkdown/blob/master/R/beamer_presentation.R)
- [Someone who did something similar](https://itsalocke.com/blog/custom-latex-beamer-style-templates-for-rmarkdown/) 
- [Maybe useful](http://rmarkdown.rstudio.com/articles_beamer.html)
- [Default Pandoc Beamer Template ](https://github.com/jgm/pandoc-templates/blob/ee2890c9dc20c5b0c33e1a5f3ea2d7705b4e591d/default.latex)
- 
