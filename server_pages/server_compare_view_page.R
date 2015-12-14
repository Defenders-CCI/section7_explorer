# Server-side code for the section 7 app basic comparative-view page
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
server_compare_view_page <- function(input, output, selected_1, selected_2, 
                                     session) {
    output$total_n_consult_1 <- renderText({
        get_number_consults(selected_1())
    })

    output$total_n_consult_2 <- renderText({
        get_number_consults(selected_2())
    })

    output$n_formal_consult_1 <- renderText({
        get_number_formal(selected_1())
    })

    output$n_formal_consult_2 <- renderText({
        get_number_formal(selected_2())
    })

    output$median_time_all_1 <- renderText({
        calculate_median_time(selected_1())
    })

    output$median_time_all_2 <- renderText({
        calculate_median_time(selected_2())
    })

    output$median_time_formal_1 <- renderText({
        calculate_median_formal_time(selected_1())
    })

    output$median_time_formal_2 <- renderText({
        calculate_median_formal_time(selected_2())
    })

    output$consults_time_1 <- renderGvis({
        make_consult_time_figure(selected_1)
    })

    output$consults_time_2 <- renderGvis({
        make_consult_time_figure(selected_2)
    })

    output$consults_species_1 <- renderGvis({
        make_species_plot(selected_1)
    })

    output$consults_species_2 <- renderGvis({
        make_species_plot(selected_2)
    })

    output$consults_agency_1 <- renderGvis({
        make_agency_plot(selected_1)
    })

    output$consults_agency_2 <- renderGvis({
        make_agency_plot(selected_2)
    })

    output$consults_map_1 <- renderGvis({
        data <- make_map_df(selected_1)
        map <- gvisGeoChart(data, 
            locationvar = "state", 
            colorvar = "consults",
            options = list(region = "US",
                           displayMode = "regions",
                           resolution = "provinces",
                           colorAxis = "{colors:['#CCD6EB', '#003399']}", 
                           datalessRegionColor = "#FFFFFF", 
                           projection = "lambert")
        ) 
        map
    })

    output$consults_map_2 <- renderGvis({
        data <- make_map_df(selected_2)
        map <- gvisGeoChart(data, 
            locationvar = "state", 
            colorvar = "consults",
            options = list(region = "US",
                           displayMode = "regions",
                           resolution = "provinces",
                           colorAxis = "{colors:['#CCD6EB', '#003399']}", 
                           datalessRegionColor = "#FFFFFF", 
                           projection = "lambert")
        ) 
        map
    })

    output$other_states_1 <- renderTable({
        RIFO <- selected_1()[selected_1()$ESOffice == "ROCK ISLAND ECOLOGICAL SERVICES FIELD OFFICE",]
        n_RIFO <- length(RIFO$activity_code)
        NEFO <- selected_1()[selected_1()$ESOffice == "NEW ENGLAND ECOLOGICAL SERVICES FIELD OFFICE",]
        n_NEFO <- length(NEFO$activity_code)
        some_data <- data.frame(State=c("IA & IL", "NH, VT, CT, MA, & RI"), 
                                N=c(n_RIFO, n_NEFO))
        some_data
    }, include.rownames=FALSE)

    output$other_states_2 <- renderTable({
        RIFO <- selected_2()[selected_2()$ESOffice == "ROCK ISLAND ECOLOGICAL SERVICES FIELD OFFICE",]
        n_RIFO <- length(RIFO$activity_code)
        NEFO <- selected_2()[selected_2()$ESOffice == "NEW ENGLAND ECOLOGICAL SERVICES FIELD OFFICE",]
        n_NEFO <- length(NEFO$activity_code)
        some_data <- data.frame(State=c("IA & IL", "NH, VT, CT, MA, & RI"), 
                                N=c(n_RIFO, n_NEFO))
        some_data
    }, include.rownames=FALSE)

    output$consults_duration_1 <- renderGvis({
        make_consult_duration_hist(selected_1)
    })

    output$consults_duration_2 <- renderGvis({
        make_consult_duration_hist(selected_2)
    })

    output$consults_work_cat_1 <- renderGvis({
        make_work_cat_plot(selected_1)
    })

    output$consults_work_cat_2 <- renderGvis({
        make_work_cat_plot(selected_2)
    })

}

