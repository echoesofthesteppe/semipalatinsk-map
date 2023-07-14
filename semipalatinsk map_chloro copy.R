library(sf)
library(ggplot2)
library(ggspatial)
library(tidyverse)
library(dplyr)
library(RColorBrewer)
library(cowplot)
library(plotly)
library(ggmap)

# Read the region geojson file
region <- st_read("/Users/sgorelik/Library/CloudStorage/OneDrive-BowdoinCollege/Desktop/Map/myfile.geojson")

# Read the radiation data
murzhik_datas <- read.csv("/Users/sgorelik/Library/CloudStorage/OneDrive-BowdoinCollege/Desktop/Map/Murzhik Subarea of STS.csv")
degelen_datas <- read.csv("/Users/sgorelik/Desktop/Map/Degelen Subarea of STS.csv")
balapan_datas <- read.csv("/Users/sgorelik/Desktop/Map/Balapan Data.csv")

# Create an sf object from the radiation data
murzhik_points <- st_as_sf(murzhik_datas, coords = c("Longitude...E.", "Latitude...N."), crs = st_crs(region))
balapan_points <- st_as_sf(balapan_datas, coords = c("Longitude...E.", "Latitude...N."), crs = st_crs(region))
degelen_points <- st_as_sf(degelen_datas, coords = c("Longitude...E.", "Latitude...N."), crs = st_crs(region))

# Create a map with a custom color scheme
ggplot() +
  geom_sf(data = region, fill = "lightgray", color = "black") +
  geom_sf(data = murzhik_points, aes(color = "Murzhik"), size = .9, alpha = 0.5) +
  geom_sf(data = balapan_points, aes(color = "Balapan"), size = .9, alpha = 0.5) + 
  geom_sf(data = degelen_points, aes(color = "Degelen"), size = .9, alpha = 0.5) +
  guides(color = guide_legend(title = "Region",
                              labels = c("Murzhik", "Balapan", "Degelen"))) +
  labs(title = "Semipalatinsk Test Site") +
  theme_bw()

