## code to prepare `DATASET` dataset goes here


###### 00. Read in boundaries shape file data  ########### 

library(sf)
ne_countries_sf <- rnaturalearth::ne_countries(  
  scale = "medium", returnclass = "sf") %>%  
  select(name, continent, geometry) %>% 
  rename(country_name = name)


####### 0. create and save flat file for examples, if desired ####

# ne_countries_sf %>%
#   sf::st_drop_geometry() ->
# ne_countries_flat

# usethis::use_data(northcarolina_county_flat, overwrite = TRUE)


#### 1, create boundaries reference dataframe w xmin, ymin, xmax and ymax and save
ne_countries_reference <- ne_countries_sf |>
  ggnc::create_geometries_reference(
                            id_cols = c(country_name))

usethis::use_data(ne_countries_reference, overwrite = TRUE)


############### 2. create polygon centers and labels reference data frame

# county centers for labeling polygons

ne_country_centers <- ne_countries_reference |>
  ggnc::prepare_polygon_labeling_data(id_cols = c(country_name))


usethis::use_data(ne_country_centers, overwrite = TRUE)


####### 3.  create line data


# tigris::primary_secondary_roads("NC") -> nc_roads

# usethis::use_data(nc_roads, overwrite = TRUE)



