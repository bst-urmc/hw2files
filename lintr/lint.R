if (requireNamespace("lintr", quietly = TRUE)) {
  ## Require = for assignment
  lint_assignment = function(shell = FALSE) {
    arrow_lintr = function(source_file) {
      lapply(lintr::ids_with_token(source_file, "LEFT_ASSIGN"), function(id) {
        parsed = lintr::with_id(source_file, id)
        lintr::Lint(
          filename = source_file$filename,
          line_number = parsed$line1,
          column_number = parsed$col1,
          type = "style",
          message = "Use =, not <-, for assignment.",
          line = source_file$lines[as.character(parsed$line1)],
          linter = "arrow_assignment_linter"
        )
      })
    }
    # modify defaults to match course style guide
    linters = lintr::with_defaults(
      assignment_linter = NULL,
      arrow_assign = arrow_lintr,
      single_quotes_linter = NULL,
      trailing_whitespace_linter = NULL,
      line_length_linter =  NULL,
      lintr::line_length_linter(90),
      commented_code_linter = NULL,
      lintr::T_and_F_symbol_linter,
      lintr::undesirable_operator_linter,
      lintr::semicolon_terminator_linter
    )
    # check .Rmd, .R, .r
    val = lintr::lint_dir(pattern = "\\.[Rr](md)?$", linters = linters)
    return(val)
  }
} else{
  message("Please install lintr.")
}
