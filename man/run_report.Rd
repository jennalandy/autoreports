% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run_report.R
\name{run_report}
\alias{run_report}
\title{Run Report}
\usage{
run_report(
  parameters,
  output_file = "report",
  output_dir = ".",
  output_format = "pdf_document"
)
}
\arguments{
\item{parameters}{A list of named parameters that override custom params specified within the YAML front-matter.}

\item{output_file}{The name of the output file.}

\item{output_dir}{The output directory for the rendered `output_file`.}

\item{output_format}{The R Markdown output format to convert to}
}
\description{
Run Report
}
