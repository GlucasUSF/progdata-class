family |> 
  DT::datatable(rownames = FALSE)

"family_long" <- family |> 
  pivot_longer(cols = -family_id,
               names_to = c("wave", ".value", "family_member"), 
               names_sep = "_",
    )

print(family_long)
