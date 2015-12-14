# Base file for styling text for Shiny apps.
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
# Base file for text styling for Shiny apps.
#
# Similar or identical styles are often used in several places within an app,
# and may be appropriate between apps. Collecting all styles in one place should
# facilitate reuse, consistency, and maintenance of apps. In addition, because
# all styles are set as far left on the page as possible, most of the standard
# 80-character width is available for composition (which rarely happens down
# in a nested set of functions in the server/ui code) and thereby improve
# readability.
#############################################################################

make_ital <- function() {
    return("font-style:italic")
}

make_bold <- function() {
    return("font-weight:bold")
}

make_bold_ital <- function() {
    return("font-style:italic; font-weight:bold")
}

make_18_bold <- function() {
    return("font-size:18pt; font-weight:bold")
}

make_24_bold <- function() {
    return("font-size:24pt; font-weight:bold")
}

make_14_bold_gold <- function() {
    return("font-size:14pt; font-weight:bold; color:#CC7A00")
}

make_dollars <- function(x) {
    y <- paste("$", format(x, big.mark=",", scientific=FALSE), sep="")
    return(y)
}

make_text_orange <- function() {
    return("color: #E6B104")
}

center_text <- "text-align: center"

# Makes a "better" legend for leaflet map 
my_legend <- function (prefix = "", suffix = "", between = " &ndash; ", digits = 3,
    big.mark = ",", transform = identity) {
    formatNum = function(x) {
        format(round(transform(x), digits), trim = TRUE, scientific = FALSE,
            big.mark = big.mark)
    }
    function(type, ...) {
        switch(type, numeric = (function(cuts) {
            paste0(prefix, formatNum(cuts), suffix)
        })(...), bin = (function(cuts) {
            n = length(cuts)
            paste0(prefix, formatNum(cuts[-n]), between, formatNum(cuts[-1]),
                suffix)
        })(...), quantile = (function(cuts, p) {
            n = length(cuts)
            p = paste0(round(p * 100), "%")
            cuts = paste0(formatNum(cuts[-n]), between, formatNum(cuts[-1]))
            paste0("<span title=\"", cuts, "\">", prefix, 
                    between, suffix, "</span>")
        })(...), factor = (function(cuts) {
            paste0(prefix, as.character(transform(cuts)), suffix)
        })(...))
    }
}
