## code to prepare `DATASET` dataset goes here


###### 00. Read in boundaries shape file data  ########### 

library(sf)
northcarolina_county_sf <- st_read(system.file("shape/nc.shp", package="sf")) |>
  dplyr::rename(county_name = NAME,
                fips = FIPS)


####### 0. create and save flat file for examples, if desired ####

northcarolina_county_sf %>%
  sf::st_drop_geometry() ->
northcarolina_county_flat

usethis::use_data(northcarolina_county_flat, overwrite = TRUE)


#### 1, create boundaries reference dataframe w xmin, ymin, xmax and ymax and save
northcarolina_county_reference <- northcarolina_county_sf |>
  ggnc::create_geometries_reference(
                            id_cols = c(county_name, fips))

usethis::use_data(northcarolina_county_reference, overwrite = TRUE)


############### 2. create polygon centers and labels reference data frame

# county centers for labeling polygons

northcarolina_county_centers <- northcarolina_county_sf |>
  ggnc::prepare_polygon_labeling_data(id_cols = c(county_name, fips))


usethis::use_data(northcarolina_county_centers, overwrite = TRUE)


####### 3.  create line data


tigris::primary_secondary_roads("NC") -> nc_roads

usethis::use_data(nc_roads, overwrite = TRUE)



