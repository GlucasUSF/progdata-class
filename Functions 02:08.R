new_gap <- gapminder |>
  arrange(year) |>
  group_by(country) |>
  mutate(lifeExp_change = lifeExp - lag(lifeExp)) |>
  filter(lifeExp_change < 0)

dat_bfi <- psychTools::bfi |>
  rownames_to_column(var = ".id") |>
  as_tibble()

glimpse(dat_bfi)

dat_bfi |>
  mutate(
    gender = recode(gender, "1" = "man", "2" = "woman")) |>
      glimpse()
  
dat_bfi |>
  group_by(gender) |>
  summarize(
    across(
      A1:A5,
      mean,
      na.rm = TRUE
    )
  )

dat_bfi |>
  group_by(gender) |>
  summarize(
    across(
      A1:A5,
      list(
        mean = \(x) mean(x, na.rm = TRUE),
        sd = \(x) sd(x, na.rm =TRUE)
      )
    )
  )
    
