# Server-side code for the section 7 app basic single-view page
# Copyright (C) 2015 Defenders of Wildlife, jmalcom@defenders.org

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, see <http://www.gnu.org/licenses/>.

library(leaflet)

###########################################################################
# Server-side code for the section 7 app basic single-view page
###########################################################################
server_alt_map_page <- function(input, output, selected_3, session) {
    output$basic_map <- renderLeaflet({
        to_plot <- make_alt_map_df(selected_3(), eso_geo_dat@data[[1]])

        # Set most manually because Alaska wraps 180 degrees and the Marianas
        # drop the southern limit way low...
        extent <- as.vector(bbox(eso_geo_dat))
        xmin <- -65
        ymin <- 10
        xmax <- -179
        ymax <- extent[4]

        popupFormat <- paste0("<strong>", 
                              names(to_plot), 
                              "</strong>", 
                              "<br>", 
                              to_plot)

        pal <- colorNumeric(palette="Blues", domain=as.vector(to_plot))

        val_range <- range(as.vector(to_plot))
        n_bins <- ifelse((val_range[2] - val_range[1] < 5) | 
                            (length(unique(as.vector(to_plot))) == 2),
                         2,
                         5)

        map <- leaflet(data = eso_geo_dat) %>%
                   addPolygons(fillColor = ~pal(to_plot),
                               fillOpacity = 0.65, 
                               stroke = TRUE, 
                               weight = 1.5, 
                               color = "#000000", # settings for borders
                               smoothFactor = 1.1,
                               popup = popupFormat) %>% 
                   addTiles() %>%
                   # addProviderTiles("Stamen.Toner") %>%
                   # addTiles(urlTemplate = map_templ_url(),
                   #          attribution = map_attrib()) %>%
                   addLegend("bottomright",
                             pal = pal,
                             values = to_plot,
                             bins = n_bins,
                             title = HTML("<p>No. Consultations</p>"),
                             na.label = "NA",
                             labFormat = labelFormat(digits=0),
                             opacity = 0.5) %>%
                   fitBounds(lng1 = xmax, 
                             lat1 = ymax, 
                             lng2 = xmin, 
                             lat2 = ymin)
        return(map)
    })

}

