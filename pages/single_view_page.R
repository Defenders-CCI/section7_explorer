# UI page for the main app landing page (single selection).
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

single_view_page <- {
    tabPanel(
        title="Single View",
        fluidRow(
          br(), br(), br(),
          column(12,
            bsAlert("changing_places")
          )
        ),
        fluidRow(
            column(1,
                bsButton("get_started",
                         label="Getting Started",
                         style="primary"
                ),
                br(), br()
            ),
            column(1,
                h5(span(class = "label label-success", "App updated Dec, 2016")),
                br(), br()
            ),
            column(8,
                h2(style="text-align:center;font-weight:bold",
                   "Endangered Species Act consultation explorer")
            ),
            column(1),
            column(1,
                a(href="http://www.defenders.org",
                    imageOutput("defenders", height=NULL))
            )
        ),

        fluidRow(
            column(12,
                box(title="Selection criteria",
                    status="primary",
                    solidHeader=FALSE,
                    height=NULL,
                    width=NULL,
                    collapsible=TRUE,
                    collapsed=TRUE,
                    column(2,
                        selectInput(
                            inputId="state",
                            label="State",
                            choices=states,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        ),
                        selectInput(
                            inputId="species",
                            label="Species",
                            choices=species,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        )
                    ),
                    column(2,
                        selectInput(
                            inputId="action_category",
                            label="Work Category",
                            choices=work_cats,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        ),
                        selectInput(
                            inputId="lead_agency",
                            label="Lead Agency",
                            choices=agencies,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        )
                    ),
                    column(2,
                        selectInput(
                            inputId="formal_consult",
                            label="Formal consult?",
                            choices=formal_cons_choice,
                            selected="All",
                            width="95%"
                        )
                    ),
                    column(6,
                        HTML("<p class='help-block'>Select your favorite state, species, work type, lead agency, and formal vs. informal consultations from drop-downs at left; graphs and maps will update automatically. You may select more than one category to filter on.  For example, if you're just interested in bull trout in Idaho and for projects involving the Forest Service, then you may select each of those criteria (or any others as you see fit).</p><br><br><code>Click the <span style='font-size:larger;font-weight:bold'>+</span> on the right in the box below to reveal additional selectors.</code>")
                    ),
                    column(12,
                        box(title="Additional selectors",
                            status="warning",
                            solidHeader=FALSE,
                            height=NULL,
                            width=NULL,
                            collapsible=TRUE,
                            collapsed=TRUE,
                            helpText("These additional selectors may be useful for digging deeper into the section 7 data."),
                            column(2,
                                popify(
                                    selectInput(
                                        inputId="region",
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
                                        inputId="ESFO",
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
                                    inputId="cons_complex",
                                    label="Consult. Complexity",
                                    choices=cons_complx,
                                    selected="All",
                                    width="95%"
                                ),
                                selectInput(
                                    inputId="consult_type",
                                    label="Consult. Type",
                                    choices=cons_types,
                                    selected="All",
                                    width="95%"
                                )
                            ),
                            column(2,
                                popify(
                                    selectInput(
                                        inputId="jeopardy",
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
                                        inputId="admod",
                                        label="Adverse Mod.?",
                                        choices=c("All", "Yes", "No"),
                                        selected="All",
                                        width="95%"
                                    ),
                                    title="Adverse Modification",
                                    content="Select 'Yes' to view consultations that FWS determined were likely to negatively alter designated critical habitat of one or more listed species. See the Glossary on the 'Section 7 background' page for more information.",
                                    placement="right",
                                    options=list(container="body", html="true")
                                )
                            ),
                            column(2,
                                popify(
                                    selectInput(
                                        inputId="rpa",
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
                bsModal(id="open_select",
                        title="Getting started",
                        trigger="get_started",
                        includeMarkdown("txt/getting_started.md")
                )
            )
        ),

        br(),
        fluidRow(
            column(3,
                tipify(
                    el=valueBox(
                        subtitle="Total # consultations",
                        value=textOutput("total_n_consult"),
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
                        value=textOutput("n_formal_consult"),
                        color="orange",
                        icon=NULL,
                        width=NULL
                    ),
                    title="Likely to adversely affect one or more species."
                )
            ),
            column(3,
                tipify(
                    valueBox(
                        subtitle="Median days to approval (all)",
                        value=textOutput("median_time_all"),
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
                        value=textOutput("median_time_formal"),
                        color="orange",
                        icon=NULL,
                        width=NULL
                    ),
                    title="Half of formal consultations shorter than this time."
                )
            )
        ),

        fluidRow(
            column(4,
                box(title="Consultations by fiscal year",
                    status="primary",
                    solidHeader=TRUE,
                    height=NULL,
                    width=NULL,
                    collapsible=TRUE,
                    collapsed=FALSE,
                    htmlOutput("consults_time"),
                    helpText(textOutput("date_range")),
                    bsButton("modConsultsTime",
                             label="Larger",
                             style="primary",
                             size="small"
                    )
                )
            ),
            column(4,
                box(title="Consultations by state",
                    status="primary",
                    solidHeader=TRUE,
                    height=NULL,
                    width=NULL,
                    collapsible=TRUE,
                    collapsed=FALSE,
                    fluidRow(
                        column(9,
                            htmlOutput("consults_map")
                        ),
                        column(3,
                            br(),
                            br(),
                            tags$small(tableOutput("other_states"))
                        )
                    ),
                    fluidRow(
                        column(12,
                            helpText("Five New England states and parts of Iowa and Illinois are each covered by a single FWS office. See table for consultation counts of these groups of states.")
                        )
                    ),
                    bsButton("modConsultsMap",
                             label="Larger",
                             style="primary",
                             size="small"
                    )
                )
            ),
            column(4,
                popify(
                    box(title="Consultations by work category (top 20)",
                        status="primary",
                        solidHeader=TRUE,
                        height=NULL,
                        width=NULL,
                        collapsible=TRUE,
                        collapsed=FALSE,
                        htmlOutput("consults_work_cat"),
                        bsButton("modConsultsCategory",
                                 label="Larger",
                                 style="primary",
                                 size="small"
                        )
                    ),
                    title="Work categories",
                    content="Work categories are generally broad; see the 'Data' page to get more detailed information about your selected data."
                )
            ),
            bsModal("largeConsultsTime",
                    title="Consultations by Fiscal Year",
                    trigger="modConsultsTime",
                    size="large",
                    helpText(textOutput("date_range_2")),
                    htmlOutput("consults_time_large")
            ),
            bsModal("largeConsultsMap",
                    title="Consultations by State",
                    trigger="modConsultsMap",
                    size="large",
                    fluidRow(
                        column(9,
                            htmlOutput("consults_map_large")
                        ),
                        column(3,
                            tableOutput("other_states_lg")
                        )
                    ),
                    fluidRow(
                        column(12,
                            helpText(style="font-size:large", "Five New England states and parts of Iowa and Illinois are each covered by a single FWS office. See table for consultation counts of these groups of states.")
                        )
                    )
            ),
            bsModal("largeConsultsCategory",
                    title="Consultations by work category (top 20)",
                    trigger="modConsultsCategory",
                    size="large",
                    htmlOutput("consults_work_cat_large")
            )
        ),

        fluidRow(
            column(6,
                box(title="Consultation duration",
                    status="primary",
                    solidHeader=TRUE,
                    height=NULL,
                    width=NULL,
                    collapsible=TRUE,
                    collapsed=FALSE,
                    htmlOutput("consults_duration"),
                    helpText("The full range of duration values is trimmed to make the graph more readable. Note that long duration (>135 days) may be caused by consultation reinitiation (see Sec. 7 background page) rather than a single, long-running consultation."),
                    bsButton("modConsultsDuration",
                             label="Larger",
                             style="primary",
                             size="small"
                    )
                )
            ),
            bsModal("largeConsultsDuration",
                    title="Distributions of consultation durations",
                    trigger="modConsultsDuration",
                    size="large",
                    htmlOutput("consults_duration_large")
            ),
            column(6,
                box(title="Consultations by agency (top 25)",
                    status="primary",
                    solidHeader=TRUE,
                    height=NULL,
                    width=NULL,
                    collapsible=TRUE,
                    collapsed=FALSE,
                    htmlOutput("consults_agencies"),
                    helpText("Agencies in the database may include either the federal action agency or the applicant. The plotted values are therefore lower limits to the number of consultations by federal agencies."),
                    bsButton("modConsultsAgency",
                             label="Larger",
                             style="primary",
                             size="small")
                )
            ),
            bsModal("largeConsultsAgency",
                    title="Consultations by agency (top 25)",
                    trigger="modConsultsAgency",
                    size="large",
                    htmlOutput("consults_agencies_large")
            )
        ),

        fluidRow(
            column(12,
                popify(
                    box(title="Consultations by species (top 50)",
                        status="primary",
                        solidHeader=TRUE,
                        height=NULL,
                        width=NULL,
                        collapsible=TRUE,
                        collapsed=FALSE,
                        htmlOutput("consults_species"),
                        bsButton("modConsultsSpecies",
                                 label="Larger",
                                 style="primary",
                                 size="small")
                    ),
                    title="Species",
                    content="If your favorite species isn't here, try searching in the 'Selection criteria' box."
                )
            ),
            bsModal("largeConsultsSpecies",
                    title="Consultations by species (top 50)",
                    trigger="modConsultsSpecies",
                    size="large",
                    htmlOutput("consults_species_large")
            )
        ),

        # a placeholder
        fluidRow(
            column(12,
                imageOutput("a_line", height="5px", width="100%")
            )
        ),

        hr(),
        fluidRow(
            column(2),
            column(3,
                HTML("<h4 style='font-weight:bold'>Alternate views</h4> <p style='font-size:larger'>Check out the <span style='font-weight:bold'>Alternate Map</span> page for a different geographic view, the <span style='font-weight:bold'>Comparison View</span> page for side-by-side comparisons, and the <span style='font-weight:bold'>Data</span> page to get the raw data.</p>")
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
                br(),
                br()
            ),
            column(3)
        ),

        fluidRow(
            column(3),
            column(6,
                div(HTML(defenders_cc()), style=center_text)
            ),
            column(3)
        )
    )
}
