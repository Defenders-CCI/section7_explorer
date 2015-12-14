# Base file for styling Shiny app plots.
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
# Base file for styling Shiny app plots
#
# All plot styling definitions should be recorded here to ensure consistency of 
# colors and styles across plots, which may come from different plotting 
# packages.
#############################################################################

colorblind <- function() {
    return(c("#000000", 
             "#E69F00",
             "#56B4E9",
             "#009E73",
             "#F0E442",
             "#0072B2",
             "#D55E00",
             "#CC79A7",
             "#FFFFFF"))
}

color_blue <- "steelblue3"

color_orange <- function() {
    return("#E6B104")
}

color_choc <- function() {
    return("chocolate2")
}
