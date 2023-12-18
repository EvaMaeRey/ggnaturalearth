# overthinking it below.
stamp_country <- function(data = ne_countries_reference, fill = NULL, fips = NULL){
  
  geom_sf(data = data,
          aes(geometry = geometry, fill = fill, fips = fips))
  
}

# ################# Step 1. Compute panel function ###########
# 
# #' Title
# #'
# #' @param data
# #' @param scales
# #' @param country
# #'
# #' @return
# #' @export
# #'
# #' @examples
# #' library(dplyr)
# #' #northcarolina_flat |> rename(fips = FIPS) |> compute_country_northcarolina() |> head() |> str()
# #' #northcarolina_flat |> rename(fips = FIPS) |> compute_country_northcarolina(keep_country = "Ashe")
# compute_country_northcarolina_stamp <- function(data, scales, keep_country = NULL){
# 
#   reference_filtered <- northcarolina_country_reference
#   #
#   if(!is.null(keep_country)){
# 
#     keep_country %>% tolower() -> keep_country
# 
#     reference_filtered %>%
#       dplyr::filter(.data$country_name %>%
#                       tolower() %in%
#                       keep_country) ->
#       reference_filtered
# 
#   }
# 
#   reference_filtered %>%
#     dplyr::select("fips", "geometry", "xmin",
#                   "xmax", "ymin", "ymax") ->
#     reference_filtered
# 
# 
#   reference_filtered %>%
#     dplyr::mutate(group = -1) %>%
#     dplyr::select(-fips)
# 
# }
# 
# ###### Step 2. Specify ggproto ###############
# 
# 
# Statcountrynorthcarolinastamp <- ggplot2::ggproto(`_class` = "Statcountrynorthcarolinastamp",
#                                `_inherit` = ggplot2::Stat,
#                                compute_panel = compute_country_northcarolina_stamp,
#                                default_aes = ggplot2::aes(geometry =
#                                                             ggplot2::after_stat(geometry)))
# 
# 
# 
# ########### Step 3. 'stamp' function, inherits from sf ##################
# 
# #' Title
# #'
# #' @param mapping
# #' @param data
# #' @param position
# #' @param na.rm
# #' @param show.legend
# #' @param inherit.aes
# #' @param ...
# #'
# #' @return
# #' @export
# #'
# #' @examples
# stamp_country <- function(
#                                  mapping = NULL,
#                                  data = reference_full,
#                                  position = "identity",
#                                  na.rm = FALSE,
#                                  show.legend = NA,
#                                  inherit.aes = TRUE,
#                                  crs = "NAD27", #WGS84, NAD83
#                                  ...
#                                  ) {
# 
#                                  c(ggplot2::layer_sf(
#                                    stat = Statcountrynorthcarolinastamp,  # proto object from step 2
#                                    geom = ggplot2::GeomSf,  # inherit other behavior
#                                    data = data,
#                                    mapping = mapping,
#                                    position = position,
#                                    show.legend = show.legend,
#                                    inherit.aes = inherit.aes,
#                                    params = rlang::list2(na.rm = na.rm, ...)),
#                                    coord_sf(crs = crs,
#                                             # default_crs = sf::st_crs(crs),
#                                             # datum = sf::st_crs(crs),
#                                             default = TRUE)
#                                  )
# 
# }




