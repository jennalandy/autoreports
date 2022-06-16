#' Run Report
#'
#' @param parameters A list of named parameters that override custom params specified within the YAML front-matter.
#' @param output_file The name of the output file.
#' @param output_dir The output directory for the rendered `output_file`.
#' @param output_format The R Markdown output format to convert to
#'
#' @importFrom rmarkdown render
#'
#' @export
run_report <- function(
    parameters,
    output_file = 'report',
    output_dir = '.',
    output_format = 'pdf_document'
  ) {
  Rmd_path <- write_Rmd(parameters, output_file, output_dir)
  rmarkdown::render(
    Rmd_path,
    output_file = output_file,
    output_dir = output_dir,
    output_format = output_format
  )
}
