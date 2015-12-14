# Functions to subset an input dataset, x.
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

##############################################################################
# Return a subset of the Sec7 db (x) based on a suite of variables.
##############################################################################
sub_df <- function(x, state, agency, sp, act_cat, formal_cons, 
                   region, ESFO, cons_complex, cons_type, jeop, admo, rpa) {
    if (agency != "All") {
        x <- x[x$lead_agency %in% agency, ]
    }
    if (act_cat != "All") {
        x <- x[x$work_category %in% tolower(act_cat), ]
    }
    if (formal_cons != "All") {
        x <- x[x$formal_consult %in% formal_cons, ]
    }
    if (sp != "All") {
        sp_pattern <- paste(sp, collapse="|")
        sp_pattern <- gsub("(", "\\(", sp_pattern, fixed=T)
        sp_pattern <- gsub(")", "\\)", sp_pattern, fixed=T)
        indices <- grep(sp_pattern, x$spp_ev_ls, value=FALSE, fixed=FALSE)
        x <- x[indices, ]
    }
    if (state != "All") {
        x <- x[x$state %in% state, ]
    }
    if (region != "All") {
        x <- x[x$region %in% region, ]
    }
    if (ESFO != "All") {
        x <- x[x$ESOffice %in% ESFO, ]
    }
    if (cons_complex != "All") {
        x <- x[x$consult_complex %in% cons_complex, ]
    }
    if (cons_type != "All") {
        x <- x[x$consult_type %in% cons_type, ]
    }
    if (jeop != "All") {
        if (jeop == "Yes") {
            x <- x[x$n_jeop > 0 & !is.na(x$n_jeop), ]
        } else {
            x <- x[x$n_jeop == 0 & !is.na(x$n_jeop), ]
        }
    }
    if (admo != "All") {
        if (admo == "Yes") {
            x <- x[x$n_admo > 0 & !is.na(x$n_admo), ]
        } else {
            x <- x[x$n_admo == 0 & !is.na(x$n_admo), ]
        }
    }
    if (rpa != "All") {
        if (rpa == "Yes") {
            x <- x[x$n_rpa > 0 & !is.na(x$n_rpa), ]
        } else {
            x <- x[x$n_rpa == 0 & !is.na(x$n_rpa), ]
        }
    }
    return(x)

}

