#' Validate Parameters
#'
#' @param parameters list of parameters to knit Rmd with.
#' @param types named list, with the same names as `parameters`, noting what
#' each parameters type should be: "string", "logical", or "double".
#' @param input_files list of parameter names that correspond to input files.
#' Will be checked for existence.
#' @param output_files list of parameter names that correspond to output files.
#' Unless on `overwrite` list, will stop user from overwriting these files.
#' @param overwrite list of parameter names that correspond to output files
#' that can be overwriten.
#'
#' @export
validate_params <- function(
  parameters,
  types,
  input_files = c(),
  output_files = c(),
  overwrite = c()
) {
  param_names = names(parameters)
  n_parameters = length(parameters)

  # check parameters are the correct types
  for (i in 1:n_parameters) {
    p = param_names[i]

    if (typeof(parameters[[p]]) != types[[p]]) {
      stop(paste0(
        "Parameter (", i, "): ", p,
        " must be of type ", types[[p]]
      ))
    }

    # if this should be an input file path, check it exists
    if (param_names[i] %in% input_files) {
      if (!file.exists(parameters[[i]])) {
        stop(paste0(
          'File: ', parameters[[i]], ' does not exist.',
          ' Note that current working directory is ',
          getwd(), ' if using relative path.'
        ))
      }
    }

    # if this should be an output file path and
    # should not overwritten, stop!
    if (
      (param_names[i] %in% output_files) &
      !(param_names[i] %in% overwrite)
    ) {
      if (file.exists(parameters[[i]])) {
        stop(paste0(
          'File: ', parameters[[i]], 'already exists.',
          ' Choose a different name or add to overwrite.'
        ))
      }
    }
  }

  print('Parameters Validated')
}
