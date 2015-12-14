# Base file for note text for Shiny apps.
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
# Base file for note text for Shiny apps.
#
# Similar or identical notes are often used in several places within an app,
# and may be appropriate between apps. Collecting all notes in one place should
# facilitate reuse, consistency, and maintenance of apps. In addition, because
# all notes are set as far left on the page as possible, most of the standard
# 80-character width is available for composition (which rarely happens down
# in a nested set of functions in the server/ui code) and thereby improve
# readability.
#############################################################################

no_data <- function() {
    return("No data meets selection criteria...")
}

defenders_cc <- function() {
    x <- '<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">
    <img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>
    <br />
    This <span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/InteractiveResource" rel="dct:type">work</span> 
    by <a xmlns:cc="http://creativecommons.org/ns" href="http://defenders.org" property="cc:attributionName" rel="cc:attributionURL">Defenders of Wildlife</a> 
    is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.'
    return(x)
}

map_attrib <- function() {
    x <- "&copy;2012 Esri & Stamen, Data from OSM and Natural Earth"
    return(x)
}

map_templ_url <- function() {
    x <- 'http://a{s}.acetate.geoiq.com/tiles/acetate-base/{z}/{x}/{y}.png'
    return(x)
}
