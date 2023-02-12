# How to create parameterized reports with Rmd.

## Use Cases

- Recreate the same report with different data files: have the path to a data file as a parameter
- Recreate the same report for different queries of data: have the string SQL query as a parameter
- Update reports as new data comes in: have the data location and date ranges considered as a parameter
- Recreate the same report for different outcomes of interest: have the response variable as a parameter
- Consider the same report with and without preprocessing steps: have a logical parameter for whether to preprocess

## How To

1.  Copy this repository: either fork or download

2.  Customize the report:
    - Create a new Rmd or update `example/example_report.Rmd` to your liking, accessing parameters with `params$name` as demonstrated in the example report.
    - Consider utilizing the `validate_params` function provided in this package to check that parameter types are correct, that input files exist, and that output files won't be overwritten unless explicitly stated.
    - I would strongly recommend including `print(params)` somewhere in your notebook so you always know what version of the report you are looking at.
    - To pass functions or expressions as parameters, include them as character parameters, and evaluate in the Rmd with `eval(parse(text = params$expression))`. See the last line of `example.example.Rmd` for an example using this method when the ggplot theme is passed as a parameter.

3.  Knitting reports: Use the `rmarkdown::render` function as demonstrated in `example/example.R` (single example below):
```
rmarkdown::render(
  'example/example_report.Rmd',
  params = list(
    iris_file_path = './iris.csv',
    subset_logical = TRUE,
    n_subset = 50,
    titlecase_logical = TRUE,
    plot_theme = 'ggplot2::theme_classic()'
  ),
  output_file = 'example_report',
  output_dir = 'example',
  output_format = 'pdf_document'
)
```

## Result

For each set of parameters, specify a different output file, and a new knitted pdf of Rmarkdown will be created.
