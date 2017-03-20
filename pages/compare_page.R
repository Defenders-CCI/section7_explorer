# Tab for comparing two selections in sec7 basic app
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

###############################################################################
# Tab for comparing two selections in sec7 basic app
compare_page <- {
    tabPanel(
        title="Comparison View",
        fluidRow(
            column(1,
                br(), br(), br(),
                bsButton("get_started_2",
                         label="Getting Started",
                         style="primary"
                ),
                br(), br()
            ),
            column(1,
                br(), br(), br(),
                h5(span(class = "label label-success", "App updated Dec, 2016")),
                br(), br()
            ),
            column(8,
                br(), br(),
                h2(style="text-align:center;font-weight:bold",
                   "Endangered Species Act consultation explorer")
            ),
            column(1),
            column(1,
                br(), br(),
                a(href="http://www.defenders.org",
                    imageOutput("defenders2", height=NULL))
            )
        ),
        fluidRow(
            column(12,
                box(title="Compare two selections",
                    status="primary",
                    solidHeader=FALSE,
                    height=NULL,
                    width=NULL,
                    collapsible=TRUE,
                    collapsed=TRUE,
                    column(5, h4("Selection #1", style="font-weight:bold; text-align:center; border-bottom:solid; border-width:2px")),
                    column(2),
                    column(5, h4("Selection #2", style="font-weight:bold; text-align:center; border-bottom:solid; border-width:2px")),
                    column(2,
                        br(),
                        selectInput(
                            inputId="state_1",
                            label="State",
                            choices=states,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        ),
                        selectInput(
                            inputId="species_1",
                            label="Species",
                            choices=species,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        )
                    ),
                    column(2,
                        br(),
                        selectInput(
                            inputId="action_category_1",
                            label="Work Category",
                            choices=work_cats,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        ),
                        selectInput(
                            inputId="lead_agency_1",
                            label="Lead Agency",
                            choices=agencies,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        )
                    ),
                    column(1,
                        selectInput(
                            inputId="formal_consult_1",
                            label="Formal consult?",
                            choices=formal_cons_choice,
                            selected="All",
                            width="95%"
                        )
                    ),
                    column(2,
                        br(),
                        br(),
                        h1("vs.", style="font-weight:bold;text-align:center")
                    ),
                    column(2,
                        br(),
                        selectInput(
                            inputId="state_2",
                            label="State #2",
                            choices=states,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        ),
                        selectInput(
                            inputId="species_2",
                            label="Species #2",
                            choices=species,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        )
                    ),
                    column(2,
                        br(),
                        selectInput(
                            inputId="action_category_2",
                            label="Work Category #2",
                            choices=work_cats,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        ),
                        selectInput(
                            inputId="lead_agency_2",
                            label="Lead Agency #2",
                            choices=agencies,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        )
                    ),
                    column(1,
                        selectInput(
                            inputId="formal_consult_2",
                            label="Formal consult? #2",
                            choices=formal_cons_choice,
                            selected="All",
                            width="95%"
                        )
                    ),

                    # Create the extra selectors box...
                    column(12,
                        box(title="Additional selectors",
                            status="warning",
                            solidHeader=FALSE,
                            height=NULL,
                            width=NULL,
                            collapsible=TRUE,
                            collapsed=TRUE,
                            column(6, h4("Selection #1", style="font-weight:bold;text-align:center; border-bottom:solid; border-width:2px")),
                            column(6, h4("Selection #2", style="font-weight:bold;text-align:center; border-bottom:solid; border-width:2px")),
                            column(2,
                                popify(
                                    selectInput(
                                        inputId="region_1",
                                        label="FWS Region",
                                        choices=regions,
                                        selected="All",
                                        width="95%"
                                    ),
                                    title="Fish and Wildlife Service Regions",
                                    content="A map of FWS regions can be found at <br>http://www.fws.gov/Endangered/regions/index.html",
                                    placement="top",
                                    options=list(container="body", html="true")
                                ),
                                popify(
                                    selectInput(
                                        inputId="ESFO_1",
                                        label="ES Office",
                                        choices=ESOs,
                                        selected="All",
                                        width="95%"
                                    ),
                                    title="ES Office",
                                    content="ES = Ecological Services. Approximate ES Office boundaries are available on the Map View page.",
                                    placement="top",
                                    options=list(container="body", html="true")
                                )
                            ),
                            column(2,
                                selectInput(
                                    inputId="cons_complex_1",
                                    label="Consult. Complexity",
                                    choices=cons_complx,
                                    selected="All",
                                    width="95%"
                                ),
                                selectInput(
                                    inputId="consult_type_1",
                                    label="Consult. Type",
                                    choices=cons_types,
                                    selected="All",
                                    width="95%"
                                )
                            ),
                            column(2,
                                popify(
                                    selectInput(
                                        inputId="jeopardy_1",
                                        label="Jeopardy?",
                                        choices=c("All", "Yes", "No"),
                                        selected="All",
                                        width="95%"
                                    ),
                                    title="Jeopardy",
                                    content="Select 'Yes' to view consultations that FWS determined were likely to jeopardize the existence of one or more listed species. See the Glossary on the 'Section 7 background' page for more information.",
                                    placement="right",
                                    options=list(container="body", html="true")
                                ),
                                popify(
                                    selectInput(
                                        inputId="admod_1",
                                        label="Adverse Mod.?",
                                        choices=c("All", "Yes", "No"),
                                        selected="All",
                                        width="95%"
                                    ),
                                    title="Adverse Modification",
                                    content="Select 'Yes' to view consultations that FWS determined were likely to negatively alter designated critical habitat of one or more listed species. See the Glossary on the 'Section 7 background' page for more information.",
                                    placement="right",
                                    options=list(container="body", html="true")
                                ),
                                popify(
                                    selectInput(
                                        inputId="rpa_1",
                                        label="RPAs?",
                                        choices=c("All", "Yes", "No"),
                                        selected="All",
                                        width="95%"
                                    ),
                                    title="Reasonable and Prudent Alternatives",
                                    content="RPAs are alternatives to the proposed project that FWS and the action agency determined would reduce the likelihood of jeopardy or adverse modification. See the Glossary on the 'Section 7 background' page for more information.",
                                    placement="right",
                                    options=list(container="body", html="true")
                                )
                            ),

                            # And this is the area for selection #2...
                            column(2,
                                popify(
                                    selectInput(
                                        inputId="region_2",
                                        label="FWS Region",
                                        choices=regions,
                                        selected="All",
                                        width="95%"
                                    ),
                                    title="Fish and Wildlife Service Regions",
                                    content="A map of FWS regions can be found at <br>http://www.fws.gov/Endangered/regions/index.html",
                                    placement="top",
                                    options=list(container="body", html="true")
                                ),
                                popify(
                                    selectInput(
                                        inputId="ESFO_2",
                                        label="ES Office",
                                        choices=ESOs,
                                        selected="All",
                                        width="95%"
                                    ),
                                    title="ES Office",
                                    content="ES = Ecological Services. Approximate ES Office boundaries are available on the Map View page.",
                                    placement="top",
                                    options=list(container="body", html="true")
                                )
                            ),
                            column(2,
                                selectInput(
                                    inputId="cons_complex_2",
                                    label="Consult. Complexity",
                                    choices=cons_complx,
                                    selected="All",
                                    width="95%"
                                ),
                                selectInput(
                                    inputId="consult_type_2",
                                    label="Consult. Type",
                                    choices=cons_types,
                                    selected="All",
                                    width="95%"
                                )
                            ),
                            column(2,
                                popify(
                                    selectInput(
                                        inputId="jeopardy_2",
                                        label="Jeopardy?",
                                        choices=c("All", "Yes", "No"),
                                        selected="All",
                                        width="95%"
                                    ),
                                    title="Jeopardy",
                                    content="Select 'Yes' to view consultations that FWS determined were likely to jeopardize the existence of one or more listed species. See the Glossary on the 'Section 7 background' page for more information.",
                                    placement="right",
                                    options=list(container="body", html="true")
                                ),
                                popify(
                                    selectInput(
                                        inputId="admod_2",
                                        label="Adverse Mod.?",
                                        choices=c("All", "Yes", "No"),
                                        selected="All",
                                        width="95%"
                                    ),
                                    title="Adverse Modification",
                                    content="Select 'Yes' to view consultations that FWS determined were likely to negatively alter designated critical habitat of one or more listed species. See the Glossary on the 'Section 7 background' page for more information.",
                                    placement="right",
                                    options=list(container="body", html="true")
                                ),
                                popify(
                                    selectInput(
                                        inputId="rpa_2",
                                        label="RPAs?",
                                        choices=c("All", "Yes", "No"),
                                        selected="All",
                                        width="95%"
                                    ),
                                    title="Reasonable and Prudent Alternatives",
                                    content="RPAs are alternatives to the proposed project that FWS and the action agency determined would reduce the likelihood of jeopardy or adverse modification. See the Glossary on the 'Section 7 background' page for more information.",
                                    placement="right",
                                    options=list(container="body", html="true")
                                )
                            )
                        )
                    )
                ),
                bsModal(id="open_select_2", 
                        title="Getting started",
                        trigger="get_started_2",
                        width="75%",
                        includeMarkdown("txt/getting_started.md")
                )
            )
        ),
        fluidRow(
            column(6,
                h3("Selection #1", style="font-weight:bold; text-align:center; border-bottom:solid; border-width:2px")
            ),
            column(6,
                h3("Selection #2", style="font-weight:bold; text-align:center; border-bottom:solid; border-width:2px")
            )
        ),
        fluidRow(
            column(3,
                tipify(
                    el=valueBox(
                        subtitle="Total no. consultations",
                        value=textOutput("total_n_consult_1"),
                        color="blue",
                        icon=NULL,
                        width=NULL
                    ),
                    title="Includes both informal and formal consultations."
                )
            ),
            column(3,
                tipify(
                    valueBox(
                        subtitle="Number formal consultations",
                        value=textOutput("n_formal_consult_1"),
                        color="orange",
                        icon=NULL,
                        width=NULL
                    ),
                    title="Likely to adversely affect one or more species."
                )
            ),
            column(3,
                tipify(
                    el=valueBox(
                        subtitle="Total no. consultations",
                        value=textOutput("total_n_consult_2"),
                        color="blue",
                        icon=NULL,
                        width=NULL
                    ),
                    title="Includes both informal and formal consultations."
                )
            ),
            column(3,
                tipify(
                    valueBox(
                        subtitle="Number formal consultations",
                        value=textOutput("n_formal_consult_2"),
                        color="orange",
                        icon=NULL,
                        width=NULL
                    ),
                    title="Likely to adversely affect one or more species."
                )
            )
        ),
        fluidRow(
            column(3,
                tipify(
                    valueBox(
                        subtitle="Median days to approval (all)",
                        value=textOutput("median_time_all_1"),
                        color="blue",
                        icon=NULL,
                        width=NULL
                    ),
                    title="Includes both informal and formal consultations."
                )
            ),
            column(3,
                tipify(
                    valueBox(
                        subtitle="Median days to approval (formal)",
                        value=textOutput("median_time_formal_1"),
                        color="orange",
                        icon=NULL,
                        width=NULL
                    ),
                    title="Half of formal consultations shorter than this time."
                )
            ),
            column(3,
                tipify(
                    valueBox(
                        subtitle="Median days to approval (all)",
                        value=textOutput("median_time_all_2"),
                        color="blue",
                        icon=NULL,
                        width=NULL
                    ),
                    title="Includes both informal and formal consultations."
                )
            ),
            column(3,
                tipify(
                    valueBox(
                        subtitle="Median days to approval (formal)",
                        value=textOutput("median_time_formal_2"),
                        color="orange",
                        icon=NULL,
                        width=NULL
                    ),
                    title="Half of formal consultations shorter than this time."
                )
            )
        ),
        fluidRow(
            column(6,
                box(title="Consultations through time: Selection 1",
                    status="primary",
                    solidHeader=TRUE,
                    height=NULL,
                    width=NULL,
                    collapsible=TRUE,
                    collapsed=FALSE,
                    htmlOutput("consults_time_1")
                )
            ),
            column(6,
                box(title="Consultations through time: Selection 2",
                    status="primary",
                    solidHeader=TRUE,
                    height=NULL,
                    width=NULL,
                    collapsible=TRUE,
                    collapsed=FALSE,
                    htmlOutput("consults_time_2")
                )
            )
        ),
        fluidRow(
            column(6,
                box(title="Consultations by state: Selection 1",
                    status="primary",
                    solidHeader=TRUE,
                    height=NULL,
                    width=NULL,
                    collapsible=TRUE,
                    collapsed=FALSE,
                    column(9,
                        htmlOutput("consults_map_1")
                    ),
                    column(3, 
                        br(),
                        br(),
                        tags$small(tableOutput("other_states_1"))
                    ),
                    column(12,
                        helpText("Five New England states and parts of Iowa and Illinois are each covered by a single FWS office. See table for consultation counts of these groups of states.")
                    )
                )
            ),
            column(6,
                box(title="Consultations by state: Selection 2",
                    status="primary",
                    solidHeader=TRUE,
                    height=NULL,
                    width=NULL,
                    collapsible=TRUE,
                    collapsed=FALSE,
                    column(9,
                        htmlOutput("consults_map_2")
                    ),
                    column(3, 
                        br(),
                        br(),
                        tags$small(tableOutput("other_states_2"))
                    ),
                    column(12,
                        helpText("Five New England states and parts of Iowa and Illinois are each covered by a single FWS office. See table for consultation counts of these groups of states.")
                    )
                )
            )
        ),
        fluidRow(
            column(6,
                popify(
                    box(title="Consultations by species (top 25): Selection 1",
                        status="primary",
                        solidHeader=TRUE,
                        height=NULL,
                        width=NULL,
                        collapsible=TRUE,
                        collapsed=FALSE,
                        htmlOutput("consults_species_1")
                    ),
                    title="Species",
                    content="If your favorite species isn't in the top 25, then select from the 'Selection criteria' box."
                )
            ),
            column(6,
                popify(
                    box(title="Consultations by species (top 25): Selection 2",
                        status="primary",
                        solidHeader=TRUE,
                        height=NULL,
                        width=NULL,
                        collapsible=TRUE,
                        collapsed=FALSE,
                        htmlOutput("consults_species_2")
                    ),
                    title="Species",
                    content="If your favorite species isn't in the top 25, then select from the 'Selection criteria' box."
                )
            )
        ),
        fluidRow(
            column(6,
                box(title="Consultation duration: Selection 1",
                    status="primary",
                    solidHeader=TRUE,
                    height=NULL,
                    width=NULL,
                    collapsible=TRUE,
                    collapsed=FALSE,
                    htmlOutput("consults_duration_1"),
                    helpText("The full range of duration values is trimmed to make the graph more readable. Note that long duration (>135 days) may be caused by consultation reinitiation (see Sec. 7 background page) rather than a single, long-running consultation.")
                )
            ),
            column(6,
                box(title="Consultation duration: Selection 2",
                    status="primary",
                    solidHeader=TRUE,
                    height=NULL,
                    width=NULL,
                    collapsible=TRUE,
                    collapsed=FALSE,
                    htmlOutput("consults_duration_2"),
                    helpText("The full range of duration values is trimmed to make the graph more readable. Note that long duration (>135 days) may be caused by consultation reinitiation (see Sec. 7 background page) rather than a single, long-running consultation.")
                )
            )
        ),
        fluidRow(
            column(6,
                popify(
                    box(title="Consultations by work category: Selection 1",
                        status="primary",
                        solidHeader=TRUE,
                        height=NULL,
                        width=NULL,
                        collapsible=TRUE,
                        collapsed=FALSE,
                        htmlOutput("consults_work_cat_1")
                    ),
                    title="Work categories",
                    content="Work categories are generally broad; see the 'Data' page to get more detailed information about your selected data."
                )
            ),
            column(6,
                popify(
                    box(title="Consultations by work category: Selection 2",
                        status="primary",
                        solidHeader=TRUE,
                        height=NULL,
                        width=NULL,
                        collapsible=TRUE,
                        collapsed=FALSE,
                        htmlOutput("consults_work_cat_2")
                    ),
                    title="Work categories",
                    content="Work categories are generally broad; see the 'Data' page to get more detailed information about your selected data."
                )
            )
        ),

        fluidRow(
            column(6,
                box(title="Consultations by agency: Selection 1",
                    status="primary",
                    solidHeader=TRUE,
                    height=NULL,
                    width=NULL,
                    collapsible=TRUE,
                    collapsed=FALSE,
                    htmlOutput("consults_agency_1")
                )
            ),
            column(6,
                box(title="Consultations by agency: Selection 2",
                    status="primary",
                    solidHeader=TRUE,
                    height=NULL,
                    width=NULL,
                    collapsible=TRUE,
                    collapsed=FALSE,
                    htmlOutput("consults_agency_2")
                )
            )
        ),
        hr(),
        fluidRow(
            column(2),
            column(3,
                HTML("<h4 style='font-weight:bold'>Alternate views</h4> <p style='font-size:larger'>Check out the <span style='font-weight:bold'>Alternate Map</span> page for a different geographic view, the <span style='font-weight:bold'>Single View</span> page for detailed views of a single selection, and the <span style='font-weight:bold'>Data</span> page to get the raw data.</p>")
            ),
            column(2),
            column(3,
                shinyURL.ui(label=HTML("<h4 style='font-weight:bold'>Share your selection!</h4>"))
            ),
            column(2)
        ),
        hr(),
        fluidRow(
            column(3),
            column(6,
                div(HTML(defenders_cc()), style=center_text)
            ),
            column(3)
        )
    )
}
