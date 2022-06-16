# This package contains the skeleton structure to create automated reports of any kind.

# Steps

1.  Copy this repository: either fork or download

2.  Customize the report:
    -   Update `report.Rmd` to your liking, where code can be run during development.
    -   When satisfied, copy the entirety of `report.Rmd` into the quoted area of   `write_Rmd.R`. DO NOT INDENT THIS. The indent level should match `report.Rmd` exactly.
    -   Edit any variables in the YAML section using C-style formatting ([link](https://www.gastonsanchez.com/r4strings/c-style-formatting.html))

3.  Build the updated package:
    -   Command - Shift - B to build the package

4.  Install the updated package:
    -   If in a github repository, use `devtools::install_github(path)`
    -   If a local package, use `install.packages(path, repos = NULL, type = "source")`

5.  Using the package:
```
run_report(
  parameters = list(var1 = 'value1'),
  output_file = 'report',
  output_dir = '.',
  output_format = 'pdf_document'
)
```
