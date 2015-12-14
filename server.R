# A Shiny Dashboard version of the End. Sp. expenditures app.
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

source("server_pages/server_single_view_page.R")
source("server_pages/server_compare_view_page.R")
source("server_pages/server_alt_map_page.R")

#############################################################################
# Define the server with calls for data subsetting and making figures
#############################################################################
shinyServer(function(input, output, session) {

    # js alerts for initialization
    createAlert(session=session, 
                anchorId="waiting",
                content="<p style='font-weight:bold; font-size:large'>Please wait while the data and plots are loaded.</p><br><ul><li>You may close this box with the 'x' to the upper-right.</li><li>Open the 'Selection criteria' box with the <span style='font-size:large; font-weight:bold'>+</span> in that box.</li></ul>",
                style="danger")

    createAlert(session=session, 
                anchorId="waiting_comp",
                content="<p style='font-weight:bold; font-size:large'>Please wait while the data and plots are loaded.</p><br><ul><li>You may close this box with the 'x' to the upper-right.</li><li>Open the 'Compare two selections' box with the <span style='font-size:large; font-weight:bold'>+</span> in that box.</li></ul>",
                style="danger")

    # The basic reactive subsetting functions...separate functions for each
    # of the pages.
    selected <- reactive({
        sub_df(full,
               input$state,
               input$lead_agency,
               input$species,
               input$action_category,
               input$formal_consult,
               input$region,
               input$ESFO,
               input$cons_complex,
               input$consult_type,
               input$jeopardy,
               input$admod,
               input$rpa
        )
    })

    selected_1 <- reactive({
        sub_df(full,
               input$state_1,
               input$lead_agency_1,
               input$species_1,
               input$action_category_1,
               input$formal_consult_1,
               input$region_1,
               input$ESFO_1,
               input$cons_complex_1,
               input$consult_type_1,
               input$jeopardy_1,
               input$admod_1,
               input$rpa_1
        )
    })

    selected_2 <- reactive({
        sub_df(full,
               input$state_2,
               input$lead_agency_2,
               input$species_2,
               input$action_category_2,
               input$formal_consult_2,
               input$region_2,
               input$ESFO_2,
               input$cons_complex_2,
               input$consult_type_2,
               input$jeopardy_2,
               input$admod_2,
               input$rpa_2
        )
    })

    selected_3 <- reactive({
        sub_df(full,
               input$state_3,
               input$lead_agency_3,
               input$species_3,
               input$action_category_3,
               input$formal_consult_3,
               input$region_3,
               input$ESFO_3,
               input$cons_complex_3,
               input$consult_type_3,
               input$jeopardy_3,
               input$admod_3,
               input$rpa_3
        )
    })

    output$defenders <- renderImage({
        width <- session$clientData$output_defenders_width
        if (width > 100) {
            width <- 100
        }
        list(src = "www/01_DOW_LOGO_COLOR_300-01.png",
             contentType = "image/png",
             alt = "Overview of section 7 consultation",
             a(href = "http://www.defenders.org"),
             width=width)
    }, deleteFile=FALSE)

    output$defenders2 <- renderImage({
        width <- session$clientData$output_defenders2_width
        if (width > 100) {
            width <- 100
        }
        list(src = "www/01_DOW_LOGO_COLOR_300-01.png",
             contentType = "image/png",
             alt = "Overview of section 7 consultation",
             a(href = "http://www.defenders.org"),
             width=width)
    }, deleteFile=FALSE)

    output$defenders_3 <- renderImage({
        width <- session$clientData$output_defenders_3_width
        if (width > 100) {
            width <- 100
        }
        list(src = "www/01_DOW_LOGO_COLOR_300-01.png",
             contentType = "image/png",
             alt = "Overview of section 7 consultation",
             a(href = "http://www.defenders.org"),
             width=width)
    }, deleteFile=FALSE)

    # Call the files with server functions broken out by page
    server_single_view_page(input, output, selected, session)
    server_compare_view_page(input, output, selected_1, selected_2, session)
    server_alt_map_page(input, output, selected_3, session)

    ###########################################################################
    # The following function calls are used for getting the data selections
    # for download.
    get_selected_data <- function(x) {
        if (x == "single") {
            return(selected())
        } else if (x == "no_1") {
            return(selected_1())
        } else if (x == "no_2") {
            return(selected_2())
        } else {
            return(selected_3())
        }
    }

    output$selected_data <- DT::renderDataTable(
        get_selected_data(input$which_data),
        rownames=FALSE,
        filter="top", 
        extensions="ColVis", 
        options = list(dom = 'C<"clear">lfrtip')
    )

    output$download_data <- downloadHandler(
        filename=function() {
            "selected_data.tab"
        },
        content=function(file) {
            if (input$which_data == "single") {
                data_to_get <- selected()
            } else if (input$which_data == "no_1") {
                data_to_get <- selected_1()
            } else if (input$which_data == "no_2") {
                data_to_get <- selected_2()
            } else {
                data_to_get <- selected_3()
            }
            for_write <- make_writeable(data_to_get)
            write.table(for_write, 
                        file=file, 
                        sep="\t",
                        row.names=FALSE,
                        quote=FALSE)
        }
    )

    output$download_metadata <- downloadHandler(
        filename=function() {
            "section_7_metadata.json"
        },
        content=function(file) {
            sink(file)
            cat(the_metadata)
            sink()
        }
    )

})
