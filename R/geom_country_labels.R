

################# Step 1. Compute panel function ###########

#' Title
#'
#' @param data
#' @param scales
#' @param keep_country
#'
#' @return
#' @export
#'
#' @examples
compute_panel_country_centers <- function(data,
                                         scales,
                                         keep_country = NULL){

  ne_country_centers_filtered <- ne_country_centers

  if(!is.null(keep_country)){
    keep_country %>% tolower() -> keep_country

    ne_country_centers_filtered %>%
      dplyr::filter(.data$country_name %>%
                      tolower() %in%
                      keep_country) ->
      ne_country_centers_filtered}

  data %>%
    dplyr::inner_join(ne_country_centers_filtered) %>%
    dplyr::select(x, y, label)

}

###### Step 2. Specify ggproto ###############
StatCountrycenters <- ggplot2::ggproto(
  `_class` = "StatCountrycenters",
  `_inherit` = ggplot2::Stat,
  # required_aes = c("label"), # for some reason this breaks things... why?
  compute_panel = compute_panel_country_centers
)


########### Step 3. 'stamp' function, inherits from sf ##################

#' Title
#'
#' @param mapping
#' @param data
#' @param position
#' @param na.rm
#' @param show.legend
#' @param inherit.aes
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
geom_country_label <- function(
  mapping = NULL,
  data = NULL,
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatCountrycenters,  # proto object from Step 2
    geom = ggplot2::GeomText,  # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}
