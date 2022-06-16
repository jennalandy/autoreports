#' Writes the Rmd file in the specified directory
#'
#' @param params A list of named parameters that override custom params specified within the YAML front-matter.
#' @param output_file The name of the output file.
#' @param output_dir The output directory for the rendered `output_file`.
#'
#' @returns path of Rmd file
#'
#' @export
write_Rmd <- function(params, output_file = 'report', output_dir = '.') {
  path <- paste(output_dir, '/', output_file, '.Rmd', sep = '')
  fileConn <- file(path)
  writeLines(gettextf(
'
---
title: "Report"
output: pdf_document
date: "`r Sys.Date()`"
params:
  string_variable: %s
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Testing the building of a report from within an R package

```{r}
print(paste("this is a string_variable:", params$string_variable))
```
',
    params$string_variable
  ), fileConn)
  close(fileConn)

  return(path)
}
