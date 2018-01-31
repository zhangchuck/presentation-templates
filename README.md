# Presentation Templates

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

- use `\\input{"./tables/[table].tex}`

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

- Can we get a output-agnostic format?
    - output to HTML (for storing online)
    - output to PDF (for presenting in person/sending in emails?)
- Add equation labelling and cross-references from Bookdown ([link](https://bookdown.org/yihui/bookdown/a-single-document.html))
