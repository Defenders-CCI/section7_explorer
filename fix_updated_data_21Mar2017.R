# BSD_2_clause

library(anytime)
library(dplyr)
library(stringr)

load("data/FWS_S7_clean_03Feb2017.RData")
names(full)

# Fix the New England ESFO -> NH problem
tab1 <- as_data_frame(table(full$state, full$ESOffice)) %>%
  filter(n > 0)
full$state <- ifelse(
  full$ESOffice == "NEW ENGLAND ECOLOGICAL SERVICES FIELD OFFICE" |
    full$ESOffice == "ROCK ISLAND ECOLOGICAL SERVICES FIELD OFFICE",
  "XX",
  full$state
)
tab2 <- as_data_frame(table(full$state, full$ESOffice)) %>%
  filter(n > 0)

# Fix the dates problems with the updated data
date_fix <- function(x) {
  fix_date <- ifelse(
    grepl(x, pattern = "/", fixed = TRUE),
    as.Date(x, format = "%m/%d/%Y"),
    as.Date(x, format = "%Y-%m-%d")
  )
  fix_date <- as.Date(fix_date, origin = "1970-01-01")
  return(fix_date)
}
start_date <- date_fix(full$start_date)
date_formal_consult <- date_fix(full$date_formal_consult)
due_date <- date_fix(full$due_date)
FWS_concl_date <- date_fix(full$FWS_concl_date)
date_active_concl <- date_fix(full$date_active_concl)

full$start_date <- start_date
full$date_formal_consult <- date_formal_consult
full$due_date <- due_date
full$FWS_concl_date <- FWS_concl_date
full$date_active_concl <- date_active_concl

