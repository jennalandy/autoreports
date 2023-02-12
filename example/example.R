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

rmarkdown::render(
  'example/example_report.Rmd',
  params = list(
    iris_file_path = './iris.csv',
    subset_logical = FALSE,
    n_subset = 10,
    titlecase_logical = FALSE,
    plot_theme = 'ggplot2::theme_bw()'
  ),
  output_file = 'example_report_themebw_nosubset_lowercase',
  output_dir = 'example',
  output_format = 'pdf_document'
)

# should error because iris_file_path isn't a character
rmarkdown::render(
  'example/example_report.Rmd',
  params = list(
    iris_file_path = 0,
    subset_logical = TRUE,
    n_subset = 50,
    titlecase_logical = TRUE,
    plot_theme = 'ggplot2::theme_classic()'
  ),
  output_file = 'example_report',
  output_dir = 'example',
  output_format = 'pdf_document'
)

# should error because iris_file_path doesn't lead to a real file
rmarkdown::render(
  'example/example_report.Rmd',
  params = list(
    iris_file_path = 'example/fake_file.csv',
    subset_logical = TRUE,
    n_subset = 50,
    titlecase_logical = TRUE,
    plot_theme = 'ggplot2::theme_classic()'
  ),
  output_file = 'example_report',
  output_dir = 'example',
  output_format = 'pdf_document'
)
