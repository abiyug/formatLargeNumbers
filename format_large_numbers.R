#' Format large numbers using custom SI-style suffixes
#'
#' This function formats numeric values with abbreviated suffixes
#' such as K, M, B, and T using the scales package. Supports values up to
#' trillions with configurable accuracy.
#'
#' @param x A numeric vector to format.
#' @param accuracy Number rounding precision (default = 0.001).
#' @param trim Logical: trim trailing zeroes? (default = TRUE).
#' @return A character vector with formatted labels.
#' @examples
#' format_large_numbers(c(1000, 1e6, 2.5e9, 1e12))
#' # Returns: "1K" "1M" "2.5B" "1T"
format_large_numbers <- function(x, accuracy = 0.001, trim = TRUE) {
  custom_scale_cut <- c(
    x = 1,        # avoids error due to unnamed "base" unit
    K = 1e3,
    M = 1e6,
    B = 1e9,
    T = 1e12
    # Extend to Q = 1e15 if needed
  )
  scales::label_number(
    scale_cut = custom_scale_cut,
    accuracy = accuracy,
    trim = trim
  )(x)
}
