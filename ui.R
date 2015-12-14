# A Shiny Dashboard version of the section 7 app.
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

source("pages/results_page.R")
source("pages/help_page.R")

#############################################################################
# Define the header and sidebar (disabled)
header <- dashboardHeader(disable=TRUE)
sidebar <- dashboardSidebar(disable=TRUE)

#############################################################################
# Define the page(s) with dashboardBody
body <- dashboardBody(
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "custom_styles.css"),
        tags$head(tags$script(src="Leaflet.sleep.js"))
    ),
    bsModal(id="instructions",
            title="How do I use this app?",
            trigger="get_started",
            includeMarkdown("txt/getting_started.md"),
            size="large"
    ),
    bsModal(id="datatable_help",
            title="Using the data table",
            trigger="table_help",
            HTML("<ul><li>Hover over the table and scroll right to see additional columns.</li>
                      <li>Search each column using the boxes at the top of the columns.</li>
                      <li>Sort the table by column using the arrows above each column.</li>
                      <li>Show/hide additional columns using the button at right.</li>
                 </ul>"),
            size="small"
    ),
    results_page
)

dashboardPage(header, sidebar, body, skin="blue")
