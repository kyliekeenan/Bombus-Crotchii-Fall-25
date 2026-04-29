The downloaded binary packages are in
/var/folders/pn/d57bb9jj719fxgk9pqfgqtlw0000gn/T//RtmpJ5lLOB/downloaded_packages
> bee_data <- Crotchii_xerces_1_dec_2025_Sheet1
> 
  > bee_sf <- st_as_sf(
    +     bee_data,
    +     coords = c("decimalLongitude", "decimalLatitude"),
    +     crs = 4326
    + )
  Error in st_as_sf(bee_data, coords = c("decimalLongitude", "decimalLatitude"),  : 
                      could not find function "st_as_sf"
                    
                    > install.packages("sf")
                    trying URL 'https://cran.rstudio.com/bin/macosx/big-sur-arm64/contrib/4.5/sf_1.1-0.tgz'
                    Content type 'application/x-gzip' length 35945390 bytes (34.3 MB)
                    ==================================================
                      downloaded 34.3 MB
                    
                    
                    The downloaded binary packages are in
                    /var/folders/pn/d57bb9jj719fxgk9pqfgqtlw0000gn/T//RtmpJ5lLOB/downloaded_packages
                    > library(sf)
                    Warning: package ‘sf’ was built under R version 4.5.2
                    Linking to GEOS 3.13.0, GDAL 3.8.5, PROJ 9.5.1; sf_use_s2() is TRUE
                    > 
                      > bee_data <- Crotchii_xerces_1_dec_2025_Sheet1
                    > 
                      > bee_sf <- st_as_sf(
                        +     bee_data,
                        +     coords = c("decimalLongitude", "decimalLatitude"),
                        +     crs = 4326
                        + )
                    > 
                      > install.packages(c("dplyr", "ggplot2", "tigris"))
                    Error in install.packages : Updating loaded packages
                    > library(dplyr)
                    Warning: package ‘dplyr’ was built under R version 4.5.2
                    
                    Attaching package: ‘dplyr’
                    
                    The following objects are masked from ‘package:stats’:
                      
                      filter, lag
                    
                    The following objects are masked from ‘package:base’:
                      
                      intersect, setdiff, setequal, union
                    > library(ggplot2)
                    Warning: package ‘ggplot2’ was built under R version 4.5.2
                    > library(tigris)
                    To enable caching of data, set `options(tigris_use_cache = TRUE)`
                    in your R script or .Rprofile.
                    > 
                      > install.packages(c("dplyr", "ggplot2", "tigris"))
                    trying URL 'https://cran.rstudio.com/bin/macosx/big-sur-arm64/contrib/4.5/dplyr_1.2.1.tgz'
                    trying URL 'https://cran.rstudio.com/bin/macosx/big-sur-arm64/contrib/4.5/ggplot2_4.0.3.tgz'
                    trying URL 'https://cran.rstudio.com/bin/macosx/big-sur-arm64/contrib/4.5/tigris_2.2.1.tgz'
                    
                    The downloaded binary packages are in
                    /var/folders/pn/d57bb9jj719fxgk9pqfgqtlw0000gn/T//RtmpJ5lLOB/downloaded_packages
                    > ca_counties <- counties(state = "CA", cb = TRUE, class = "sf")
                    Retrieving data for the year 2024
                    |=================================================================================| 100%
                    Using FIPS code '06' for state 'CA'
                    > 
                      > santa_barbara <- ca_counties %>%
                      +     filter(NAME == "Santa Barbara")
                    > 
                      > sb_bees <- st_join(bee_sf, santa_barbara, join = st_within, left = FALSE)
                    Error in st_geos_binop("within", x, y, sparse = sparse, prepared = prepared,  : 
                                             st_crs(x) == st_crs(y) is not TRUE
                                           
                                           > library(sf)
                                           > library(dplyr)
                                           > library(ggplot2)
                                           > library(tigris)
                                           > 
                                             > bee_data <- Crotchii_xerces_1_dec_2025_Sheet1
                                           > 
                                             > bee_sf <- st_as_sf(
                                               +     bee_data,
                                               +     coords = c("decimalLongitude", "decimalLatitude"),
                                               +     crs = 4326
                                               + )
                                           > 
                                             > ca_counties <- counties(state = "CA", cb = TRUE, class = "sf")
                                           Retrieving data for the year 2024
                                           Using FIPS code '06' for state 'CA'
                                           > santa_barbara <- ca_counties %>%
                                             +     filter(NAME == "Santa Barbara")
                                           > 
                                             > santa_barbara <- st_transform(santa_barbara, st_crs(bee_sf))
                                           > 
                                             > sb_bees <- st_join(bee_sf, santa_barbara, join = st_within, left = FALSE)
                                           > 
                                             > sb_plant_counts <- sb_bees %>%
                                             +     st_drop_geometry() %>%
                                             +     filter(!is.na(Plant_species), Plant_species != "") %>%
                                             +     count(Plant_species, sort = TRUE)
                                           > 
                                             > top_sb_plants <- sb_plant_counts %>%
                                             +     slice_head(n = 10)
                                           > 
                                             > ggplot(top_sb_plants, aes(x = reorder(Plant_species, n), y = n)) +
                                             +     geom_col(fill = "darkolivegreen3") +
                                             +     coord_flip() +
                                             +     labs(
                                               +         title = "Host Plant Preferences in Santa Barbara County",
                                               +         x = "Plant Species",
                                               +         y = "Number of Observations"
                                               +     ) +
                                             +     theme_minimal()
                                           > 
                                             > library(sf)
                                           > library(dplyr)
                                           > library(ggplot2)
                                           > library(tigris)
                                           > 
                                             > bee_data <- Crotchii_xerces_1_dec_2025_Sheet1
                                           > 
                                             > bee_sf <- st_as_sf(
                                               +     bee_data,
                                               +     coords = c("decimalLongitude", "decimalLatitude"),
                                               +     crs = 4326
                                               + )
                                           > 
                                             > ca_counties <- counties(state = "CA", cb = TRUE, class = "sf") %>%
                                             +     st_transform(st_crs(bee_sf))
                                           Retrieving data for the year 2024
                                           Using FIPS code '06' for state 'CA'
                                           > 
                                             > bee_sf_clean <- bee_sf %>%
                                             +     filter(!is.na(Plant_species), Plant_species != "")
                                           > 
                                             > ggplot() +
                                             +     geom_sf(data = ca_counties, fill = "gray95", color = "white", linewidth = 0.2) +
                                             +     geom_sf(data = bee_sf_clean, aes(color = Plant_species), size = 2, alpha = 0.8) +
                                             +     labs(
                                               +         title = "Host Plant Observations in California",
                                               +         color = "Plant Species"
                                               +     ) +
                                             +     theme_minimal()
                                           > 
                                             > library(sf)
                                           > library(dplyr)
                                           > library(ggplot2)
                                           > library(tigris)
                                           > 
                                             > bee_data <- Crotchii_xerces_1_dec_2025_Sheet1
                                           > 
                                             > bee_sf <- st_as_sf(
                                               +     bee_data,
                                               +     coords = c("decimalLongitude", "decimalLatitude"),
                                               +     crs = 4326
                                               + )
                                           > 
                                             > bee_sf_clean <- bee_sf %>%
                                             +     filter(!is.na(Plant_species), Plant_species != "")
                                           > 
                                             > plot(st_geometry(bee_sf_clean), col = "red", pch = 16)
                                           > 
                                             > ggplot() +
                                             +     geom_sf(data = bee_sf_clean, aes(color = Plant_species), size = 2) +
                                             +     theme_minimal()
                                           > ca_counties <- counties(state = "CA", cb = TRUE, class = "sf")
                                           Retrieving data for the year 2024
                                           Using FIPS code '06' for state 'CA'
                                           > ca_counties <- st_transform(ca_counties, st_crs(bee_sf_clean))
                                           > 
                                             > ggplot() +
                                             +     geom_sf(data = ca_counties, fill = "gray95", color = "black", linewidth = 0.2) +
                                             +     geom_sf(data = bee_sf_clean, aes(color = Plant_species), size = 2, alpha = 0.8) +
                                             +     theme_minimal()
                                           > 
                                             > library(sf)
                                           > library(dplyr)
                                           > library(ggplot2)
                                           > library(tigris)
                                           > 
                                             > bee_data <- Crotchii_xerces_1_dec_2025_Sheet1
                                           > 
                                             > bee_sf <- st_as_sf(
                                               +     bee_data,
                                               +     coords = c("decimalLongitude", "decimalLatitude"),
                                               +     crs = 4326
                                               + )
                                           > 
                                             > bee_sf_clean <- bee_sf %>%
                                             +     filter(!is.na(Plant_species), Plant_species != "")
                                           > 
                                             > plot(st_geometry(bee_sf_clean), col = "red", pch = 16)
                                           > 
                                             > 
                                             > ggplot() +
                                             +     geom_sf(data = bee_sf_clean, aes(color = Plant_species), size = 2) +
                                             +     theme_minimal()
                                           > 
                                             > ca_counties <- counties(state = "CA", cb = TRUE, class = "sf")
                                           Retrieving data for the year 2024
                                           Using FIPS code '06' for state 'CA'
                                           > ca_counties <- st_transform(ca_counties, st_crs(bee_sf_clean))
                                           > 
                                             > ggplot() +
                                             +     geom_sf(data = ca_counties, fill = "gray95", color = "black", linewidth = 0.2) +
                                             +     geom_sf(data = bee_sf_clean, aes(color = Plant_species), size = 2, alpha = 0.8) +
                                             +     theme_minimal()
                                           > 
                                             > class(bee_sf_clean)
                                           [1] "sf"          "spec_tbl_df" "tbl_df"      "tbl"         "data.frame" 
                                           > st_geometry_type(bee_sf_clean)
                                           [1] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [15] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [29] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [43] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [57] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [71] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [85] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [99] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [113] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [127] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [141] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [155] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [169] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [183] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [197] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [211] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [225] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [239] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [253] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [267] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [281] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [295] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [309] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [323] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [337] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [351] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [365] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [379] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [393] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [407] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [421] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [435] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [449] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [463] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [477] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [491] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [505] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [519] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [533] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [547] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [561] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [575] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [589] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [603] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [617] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [631] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [645] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [659] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [673] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           [687] POINT POINT POINT POINT POINT POINT POINT POINT POINT POINT
                                           18 Levels: GEOMETRY POINT LINESTRING POLYGON MULTIPOINT MULTILINESTRING ... TRIANGLE
                                           > 
                                             > library(sf)
                                           > library(dplyr)
                                           > library(ggplot2)
                                           > library(tigris)
                                           > 
                                             > bee_data <- Crotchii_xerces_1_dec_2025_Sheet1
                                           > 
                                             > bee_sf <- st_as_sf(
                                               +     bee_data,
                                               +     coords = c("decimalLongitude", "decimalLatitude"),
                                               +     crs = 4326
                                               + )
                                           > 
                                             > bee_sf_clean <- bee_sf %>%
                                             +     filter(!is.na(Plant_species), Plant_species != "")
                                           > 
                                             > ca_counties <- counties(state = "CA", cb = TRUE, class = "sf") %>%
                                             +     st_transform(st_crs(bee_sf_clean))
                                           Retrieving data for the year 2024
                                           Using FIPS code '06' for state 'CA'
                                           > 
                                             > p <- ggplot() +
                                             +     geom_sf(data = ca_counties, fill = "gray95", color = "gray50", linewidth = 0.2) +
                                             +     geom_sf(data = bee_sf_clean, aes(color = Plant_species), size = 2, alpha = 0.8) +
                                             +     labs(
                                               +         title = "Host Plant Observations in California",
                                               +         color = "Plant Species"
                                               +     ) +
                                             +     theme_minimal()
                                           > 
                                             > print(p)
                                           > 
                                             > top_plants <- bee_sf_clean %>%
                                             +     st_drop_geometry() %>%
                                             +     count(Plant_species, sort = TRUE) %>%
                                             +     slice_head(n = 10) %>%
                                             +     pull(Plant_species)
                                           > 
                                             > bee_top <- bee_sf_clean %>%
                                             +     filter(Plant_species %in% top_plants)
                                           > 
                                             > ggplot() +
                                             +     geom_sf(data = ca_counties, fill = "gray95", color = "gray50", linewidth = 0.2) +
                                             +     geom_sf(data = bee_top, aes(color = Plant_species), size = 2, alpha = 0.8) +
                                             +     labs(
                                               +         title = "Top Host Plant Observations in California",
                                               +         color = "Plant Species"
                                               +     ) +
                                             +     theme_minimal()
                                           > 