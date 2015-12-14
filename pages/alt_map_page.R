# Page for users to view the ES Office based map.
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
# Page for users to view the ES Office based map.
alt_map_page <- {
    tabPanel(title="alt_map",
        fluidRow(
            column(1,
                br(), br(), br(),
                bsButton("get_started_3",
                         label="Getting Started",
                         style="primary"
                ),
                br(), br()
            ),
            column(10,
                br(), br(),
                h2("Endangered Species Act consultation explorer: FWS Office Map",
                   style="text-align:center;font-weight:bold")
            ),
            column(1,
                br(), br(),
                a(href="http://www.defenders.org",
                    imageOutput("defenders_3", height=NULL))
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
                            inputId="state_3",
                            label="State",
                            choices=states,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        ),
                        selectInput(
                            inputId="species_3",
                            label="Species",
                            choices=species,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        )
                    ),
                    column(2,
                        selectInput(
                            inputId="action_category_3",
                            label="Work Category",
                            choices=work_cats,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        ),
                        selectInput(
                            inputId="lead_agency_3",
                            label="Lead Agency",
                            choices=agencies,
                            selected="All",
                            multiple=FALSE,
                            width="95%"
                        )
                    ),
                    column(2,
                        selectInput(
                            inputId="formal_consult_3",
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
                                        inputId="region_3",
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
                                        inputId="ESFO_3",
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
                                    inputId="cons_complex_3",
                                    label="Consult. Complexity",
                                    choices=cons_complx,
                                    selected="All",
                                    width="95%"
                                ),
                                selectInput(
                                    inputId="consult_type_3",
                                    label="Consult. Type",
                                    choices=cons_types,
                                    selected="All",
                                    width="95%"
                                )
                            ),
                            column(2,
                                popify(
                                    selectInput(
                                        inputId="jeopardy_3",
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
                                        inputId="admod_3",
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
                                        inputId="rpa_3",
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
                # ),
                # bsModal(id="open_select", 
                #         title="Getting started",
                #         trigger="get_started",
                #         width="75%",
                #         includeMarkdown("txt/getting_started.md")
                )
            )
        ),

        fluidRow(
            column(12,
                br(),
                box(title="Consultations by ES Office",
                    status="primary",
                    solidHeader=TRUE,
                    height=NULL,
                    width=NULL,
                    collapsible=FALSE,
                    collapsed=FALSE,
                    leafletOutput("basic_map", height=600),
                    helpText("Data shown is based on selection criteria. A
                             small number of ES Offices are not shown 
                             because of office name changes. Office boundaries
                             are close approximations of FWS coverage areas.\n
							 Hovering over the map for ~1 sec. or clicking the 
                             the map will enable zooming with mouse scroll. 
                             Moving the mouse outside of the map will disable 
                             zoom-by-scroll."
                    )
                )
            )
        )
    )

}
