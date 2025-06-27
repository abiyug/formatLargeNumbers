df_test <- tibble::tibble(
  value = c(500, 1500, 1e4, 1e6, 1e9, 1e12)
)

df_test %>% mutate(label = format_large_numbers(value))

