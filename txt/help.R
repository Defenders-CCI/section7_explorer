# Base file for help text for Shiny apps.
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

#############################################################################
# Base file for help text for Shiny apps.
#
# Similar or identical text is often used in several places within an app,
# and may be appropriate between apps. Collecting all help in one place should
# facilitate reuse, consistency, and maintenance of apps. In addition, because
# all text is set as far left on the page as possible, most of the standard
# 80-character width is available for composition (which rarely happens down
# in a nested set of functions in the server/ui code) and thereby improve
# readability.
#############################################################################

overview_statement <- function() {
    x <- "Section 7 of the U.S. Endangered Species Act (ESA) requires that 
         federal agencies further the conservation of threatened and endangered 
         species. To do so, they consult with the U.S. Fish and Wildlife Service 
         (FWS) or National Marine Fisheries Service if an action may impact one 
         or more listed species. This database allows the user to query all 
         FWS consultations since 2008."
    return(x)
}

usage_statement <- function() {
    x <- "To examine section 7 consultations from FWS since 2008,
         select filter criteria from the Data Selection menu to the left. All 
         graphs and tables will update after clicking the 'Apply selection' 
         button in the sidebar. Most graphs are zoomable and show values on 
         hover; see www.plot.ly for more information."
    return(x)
}

caution_statement <- function() {
    x <- "'State' selections will return approximate counts of consultations and 
         the characteristics of those consultations: FWS does not record the 
         state in which an action will take place, and Ecological Services (ES) 
         offices may span state boundaries, e.g., Rock Island ESFO. If a state has 
         no ES office or one ES office is known to span many states, then the selected 
         data will default to zero records; please make a selection by ES office 
         and review the records under the Selected Data tab. "
    return(x)
}

limits_statement <- function() {
    x <- "The TAILS database is not without limitations. While the records were 
         systematically quality filtered, there may be a few minor errors remaining. 
         In addition, the database is not absolutely complete: records that contained 
         obvious errors where the correct values could not be inferred were removed, 
         but these comprise << 1% of the raw records. These missing consultations 
         will be added as resources allow manual curation."
    return(x)
}

note_statement <- function() {
    x <- "Most labels are self-explanatory, but bear in mind the following hints:

         'All' or 'All data' indicates the background of all, unfiltered data.

         'Select' or 'Selected' indicates the results are based on just the data
         meeting your selection criteria.

         Need more explanation? Check out the Help menu (left)!"
    return(x)
}

hints <- function() {
    x <- "This is the place to write any hints for the user. I should probably
         turn this into a type that can be written in Markdown."
    return(x)
}

