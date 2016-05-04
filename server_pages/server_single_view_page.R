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


###########################################################################
# Server-side code for the section 7 app basic single-view page
###########################################################################
server_single_view_page <- function(input, output, selected, session) {

    shinyURL.server(session)

    output$total_n_consult <- renderText({
        get_number_consults(selected())
    })

    output$n_formal_consult <- renderText({
        get_number_formal(selected())
    })

    output$median_time_all <- renderText({
        calculate_median_time(selected())
    })

    output$median_time_formal <- renderText({
        calculate_median_formal_time(selected())
    })

    output$consults_time <- renderGvis({
        make_consult_time_figure(selected, "290px")
    })

    output$date_range <- renderText({
        paste0("Data from 2008-01-01 through ", 
               max(selected()$FWS_concl_date, na.rm=TRUE), ".")
    })

    output$date_range_2 <- renderText({
        paste0("Data from 2008-01-01 through ", 
               max(selected()$FWS_concl_date, na.rm=TRUE), ".")
    })

    output$consults_time_large <- renderGvis({
        make_consult_time_figure(selected, height="575px")
    })

    output$consults_species <- renderGvis({
        make_species_plot(selected)
    })

    output$consults_species_large <- renderGvis({
        make_species_plot(selected, height="575px", chartHeight="70%")
    })

    output$consults_map <- renderGvis({
        data <- make_map_df(selected)
        map <- gvisGeoChart(data, 
            locationvar = "state", 
            colorvar = "consults",
            options = list(height="250",
                           width="350",
                           region = "US",
                           legend = "none",
                           displayMode = "regions",
                           resolution = "provinces",
                           colorAxis = "{colors:['#CEDAE6', '#0A4783']}", 
                           datalessRegionColor = "#FFFFFF", 
                           projection = "lambert")
        ) 
        map
    })

    output$consults_map_large <- renderGvis({
        data <- make_map_df(selected)
        base <- session$clientData$output_a_line_width
        if(base > 1000) {
            width <- 1000
            height <- 642
        } else {
            width <- 0.9 * base
            height <- 0.642 * width
        }
        map <- gvisGeoChart(data, 
            locationvar = "state", 
            colorvar = "consults",
            options = list(width=width,
                           height=642,
                           region="US",
                           legend="none",
                           displayMode = "regions",
                           resolution = "provinces",
                           colorAxis = "{colors:['#CEDAE6', '#0A4783']}", 
                           datalessRegionColor = "#FFFFFF", 
                           projection = "lambert")
        ) 
        cat(map$html$jsData)
        map
    })

    output$other_states <- renderTable({
        tmp <- selected()
        RIFO <- tmp[tmp$ESOffice == "ROCK ISLAND ECOLOGICAL SERVICES FIELD OFFICE",]
        n_RIFO <- length(RIFO$activity_code)
        NEFO <- tmp[tmp$ESOffice == "NEW ENGLAND ECOLOGICAL SERVICES FIELD OFFICE",]
        n_NEFO <- length(NEFO$activity_code)
        some_data <- data.frame(State=c("IA & IL", "NH, VT, CT, MA, & RI"), 
                                N=c(n_RIFO, n_NEFO))
        some_data
    }, include.rownames=FALSE)

    output$other_states_lg <- renderTable({
        tmp <- selected()
        RIFO <- tmp[tmp$ESOffice == "ROCK ISLAND ECOLOGICAL SERVICES FIELD OFFICE",]
        n_RIFO <- length(RIFO$activity_code)
        NEFO <- tmp[tmp$ESOffice == "NEW ENGLAND ECOLOGICAL SERVICES FIELD OFFICE",]
        n_NEFO <- length(NEFO$activity_code)
        some_data <- data.frame(State=c("IA & IL", "NH, VT, CT, MA, & RI"), 
                                N=c(n_RIFO, n_NEFO))
        some_data
    }, include.rownames=FALSE)

    output$consults_duration <- renderGvis({
        make_consult_duration_hist(selected)
    })

    output$consults_duration_large <- renderGvis({
        make_consult_duration_hist(selected, height="550px")
    })

    output$consults_work_cat <- renderGvis({
        make_work_cat_plot(selected, "325px")
    })

    output$consults_work_cat_large <- renderGvis({
        make_work_cat_plot(selected, height="575px", chartHeight="75%")
    })

    output$consults_agencies <- renderGvis({
        make_agency_plot(selected, "385px")
    })

    output$consults_agencies_large <- renderGvis({
        make_agency_plot(selected, height="575px", chartHeight="70%")
    })

    output$a_line <- renderImage({
        width <- session$clientData$output_a_line_width
        list(src = "www/line-01.png",
             contentType = "image/png",
             alt = "",
             # a(href = ""),
             width=width)
    }, deleteFile=FALSE)

}

