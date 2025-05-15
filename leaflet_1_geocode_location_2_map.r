## Noory Kim
## Date started: 2025-05-15

library(tidyverse)
library(leaflet)
library(tidygeocoder)
library(prettyunits)

## set parameters
location_name <- "University of Notre Dame"
location_name <- "White House"
location_name <- "Old Faithful"
location_name <- "New York"

zoom_level <- 12

## geocode location, then extract latitude and longitude
geo_lat <- geo(location_name) %>% pull(lat)
geo_long <- geo(location_name) %>% pull(long)

## define map with Leaflet default style
map01 <- leaflet() %>% 
  addTiles() %>% 
  setView(lat=geo_lat, lng=geo_long, zoom=zoom_level) %>% 
  addMarkers(lat=geo_lat, lng=geo_long, popup="Here")
## show map
map01

## define map with a different style/theme
map02 <- leaflet() %>% 
  addProviderTiles(providers$OpenStreetMap.France) %>% 
  setView(lat=geo_lat, lng=geo_long, zoom=zoom_level) %>% 
  addMarkers(lat=geo_lat, lng=geo_long, popup="Here")
## show map
map02


## References:
# https://www.geeksforgeeks.org/leaflet-package-in-r/#
# https://rstudioconnect.wlu.edu/bio185/_w_41e58484/c-13-leaflet.html
# Style/Theme gallery:  https://leaflet-extras.github.io/leaflet-providers/preview/
# Mike Chapple, Data Visualization in R with ggplot2 (2025) (LinkedIn Learning course), Section 4.3 and 4.4
  # This course uses Google Maps API and ggmaps package instead of Leaflet
# https://github.com/rstudio/leaflet/blob/main/vignettes/articles/leaflet.Rmd
