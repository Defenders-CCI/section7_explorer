# Code for the help "page" (tabItem) of basic sec7 app
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

help_page <- {
    tabItem(tabName="help",
            br(), br(), br(),
            fluidRow(
                column(6,
                    box(title="Section 7 Overview",
                        status="primary",
                        solidHeader=TRUE,
                        collapsible=FALSE,
                        height=NULL,
                        width=NULL,
                        includeMarkdown("txt/sec7_summary.md")
                    ),
                    box(title="Consultation Process (simplified)",
                        status="primary",
                        solidHeader=TRUE,
                        collapsible=FALSE,
                        height=475,
                        width=NULL,
                        tags$div(img(src="simple_section7_diagram_v2.png",
                                     class="img-responsive")
                        )
                    )
                ),
                column(6,
                    box(title="Section 7 Glossary",
                        status="primary",
                        solidHeader=TRUE,
                        collapsible=FALSE,
                        height=NULL,
                        width=NULL,
                        includeMarkdown("txt/glossary.md")
                    )
                )
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
