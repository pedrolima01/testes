## code to prepare `base` dataset goes here

base <- readr::write_rds(x = mtcars, file = here::here("data-raw/mtcars.rds"))

usethis::use_data(base, overwrite = TRUE)
