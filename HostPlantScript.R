> getwd()
[1] "/Users/kylierastatter/Downloads/crotchii-fall-25/Bombus-Crotchii-Fall-25"
> 
  > install.packages("readxl")
trying URL 'https://cran.rstudio.com/bin/macosx/big-sur-arm64/contrib/4.5/readxl_1.4.5.tgz'
Content type 'application/x-gzip' length 1091570 bytes (1.0 MB)
==================================================
  downloaded 1.0 MB


The downloaded binary packages are in
/var/folders/pn/d57bb9jj719fxgk9pqfgqtlw0000gn/T//Rtmp4aGgNZ/downloaded_packages
> library(readxl)
> library(readr)
Warning: package ‘readr’ was built under R version 4.5.2
> Crotchii_xerces_1_dec_2025_Sheet1 <- read_csv("Crotchii_xerces_1_dec_2025 - Sheet1.csv")
Rows: 863 Columns: 133                                                                   
── Column specification ───────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (70): verbatimHostPlant, Plant_genus, Plant_species, Plant_gen_sp, floralHostNotes...
dbl  (49): occurrenceID, eventID, decimalLatitude, decimalLongitude, individualCount, c...
lgl   (9): LR_floral_notes, informationWithheld, sawZeroBees, Delete_row, managementGra...
dttm  (1): modified
time  (4): eventTime, eventEndTime, volunteer_end_time, volunteer_start_time

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(Crotchii_xerces_1_dec_2025_Sheet1)
Error in `vec_slice()` at vctrs/R/slice.R:376:3:
  ! Can't subset elements past the end.
ℹ Location 1 doesn't exist.
ℹ There are only 0 elements.
Run `rlang::last_trace()` to see where the error occurred.
Error in `vec_slice()` at vctrs/R/slice.R:376:3:
  ! Can't subset elements past the end.
ℹ Location 1 doesn't exist.
ℹ There are only 0 elements.
Run `rlang::last_trace()` to see where the error occurred.
> library(dplyr)
Warning: package ‘dplyr’ was built under R version 4.5.2

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:
  
  filter, lag

The following objects are masked from ‘package:base’:
  
  intersect, setdiff, setequal, union
> library(ggplot2)
> 
  > plant_counts <- data %>%
  +     filter(!is.na(Plant_species), Plant_species != "") %>%
  +     count(Plant_species, sort = TRUE)
Error in `filter()`:
  ℹ In argument: `!is.na(Plant_species)`.
Caused by error:
  ! object 'Plant_species' not found
Run `rlang::last_trace()` to see where the error occurred.

> View(Crotchii_xerces_1_dec_2025_Sheet1)
> library(dplyr)
> library(ggplot2)
> 
  > plant_counts <- data %>%
  +     filter(!is.na(Plant_species), Plant_species != "") %>%
  +     count(Plant_species, sort = TRUE)
Error in `filter()`:
  ℹ In argument: `!is.na(Plant_species)`.
Caused by error:
  ! object 'Plant_species' not found
Run `rlang::last_trace()` to see where the error occurred.

> rlang::last_trace()
<error/rlang_error>
  Error in `filter()`:
  ℹ In argument: `!is.na(Plant_species)`.
Caused by error:
  ! object 'Plant_species' not found
---
  Backtrace:
  ▆
1. ├─... %>% count(Plant_species, sort = TRUE)
2. ├─dplyr::count(., Plant_species, sort = TRUE)
3. ├─dplyr::filter(., !is.na(Plant_species), Plant_species != "")
4. └─dplyr:::filter.data.frame(., !is.na(Plant_species), Plant_species != "")
5.   └─dplyr:::filter_impl(...)
6.     └─dplyr:::filter_rows(...)
7.       └─dplyr:::filter_eval(...)
8.         ├─base::withCallingHandlers(...)
9.         └─mask$eval_all_filter(dots_expanded, invert, env_filter)
10.           └─dplyr (local) eval()
Run rlang::last_trace(drop = FALSE) to see 3 hidden frames.
> library(dplyr)
> library(ggplot2)
> 
  > plant_counts <- Crotchii_xerces_1_dec_2025_Sheet1 %>%
  +     filter(!is.na(Plant_species), Plant_species != "") %>%
  +     count(Plant_species, sort = TRUE)
> 
  > top_plants <- plant_counts %>%
  +     slice_head(n = 10)
> 
  > ggplot(top_plants, aes(x = reorder(Plant_species, n), y = n)) +
  +     geom_col(fill = "darkolivegreen3") +
  +     coord_flip() +
  +     labs(
    +         title = "Most Favored Host Plants",
    +         x = "Plant Species",
    +         y = "Number of Observations"
    +     ) +
  +     theme_minimal()
> 
  > ggplot(top_plants, aes(x = reorder(Plant_species, n), y = n)) +
  +     geom_col(fill = "darkolivegreen3") +
  +     coord_flip() +
  +     labs(
    +         title = "Host Plant Preferences California",
    +         x = "Plant Species",
    +         y = "Number of Observations"
    +     ) +
  +     theme_minimal()