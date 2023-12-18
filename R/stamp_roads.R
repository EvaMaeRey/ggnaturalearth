#' Title
#'
#' @param data
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
stamp_roads <- function(data = nc_roads, fill = NULL, fips = NULL, ...){
  
  geom_sf(data = data, aes(fill = fill, fips = fips), ...)
  
}



# # have to combine... ugh...
# tigris::area_water("NC", county = 'Alleghany')
#   nc_water
