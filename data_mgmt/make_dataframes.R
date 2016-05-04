# Functions to create dataframes, typically for plot generation.
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

############################################################################
# Create a small dataframe for front-page summary figure
make_consult_year_summary_df <- function(x) {
    cons_yr <- calculate_consults_per_year(x)
    form_yr <- calculate_formal_per_year(x)
    years <- names(cons_yr)
    dat <- data.frame(years, as.vector(cons_yr), as.vector(form_yr))
    names(dat) <- c("years", "all", "formal")
    return(dat)
}

############################################################################
# Create a small dataframe for top 50 species bar plot
make_top_50_species_df <- function(sub) {
    sub_species <- table(unlist(sub$spp_ev_ls))
    sorted <- -sort(-sub_species)
    if (length(sorted) <= 50) {
        dat <- data.frame(species=names(sorted), 
                          consultations=as.vector(sorted))
    } else {
        dat <- data.frame(species=names(sorted)[1:50], 
                          consultations=as.vector(sorted[1:50]))
    }
    return(dat)
}

############################################################################
# Create a small dataframe for top 25 species bar plot
make_top_25_species_df <- function(sub) {
    sub_species <- table(unlist(sub$spp_ev_ls))
    sorted <- -sort(-sub_species)
    if (length(sorted) <= 25) {
        dat <- data.frame(species=names(sorted), 
                          consultations=as.vector(sorted))
    } else {
        dat <- data.frame(species=names(sorted)[1:25], 
                          consultations=as.vector(sorted[1:25]))
    }
    return(dat)
}

############################################################################
# Create a small dataframe for state work categories summary figure
make_state_work_cat_df <- function(x) {
    categories <- table(droplevels(x$work_category))
    sorted <- -sort(-categories)
    if (length(sorted) <= 20) {
        dat <- data.frame(work_cat=names(sorted), 
                          consultations=as.vector(sorted))
    } else {
        dat <- data.frame(work_cat=names(sorted)[1:20], 
                          consultations=as.vector(sorted[1:20]))
    }
    return(dat)
}

############################################################################
# Create a small dataframe for top 25 agencies bar plot
make_top_25_agencies_df <- function(sub) {
    sub_agency <- table(sub$lead_agency)
    sorted <- -sort(-sub_agency)
    sorted <- sorted[sorted > 0]
    if (length(sorted) <= 25) {
        dat <- data.frame(agency=names(sorted), 
                          consultations=as.vector(sorted))
    } else {
        dat <- data.frame(agency=names(sorted)[1:25], 
                          consultations=as.vector(sorted[1:25]))
    }
    return(dat)
}

############################################################################
# Create a small dataframe for the state-resolution map
make_map_df <- function(sub) {
    sub_state <- table(sub()$state)
    res <- data.frame(state=names(sub_state), consults=as.vector(sub_state))
    return(res)
}

############################################################################
# Create a small dataframe for the ESFO-resolution map
make_alt_map_df <- function(sub, esls) {
    cur_tab <- table(sub$ESOffice)
    to_remove <- setdiff(names(cur_tab), esls)
    tab_upd <- cur_tab[!(names(cur_tab) %in% to_remove)]
    # print(head(tab_upd))
    return(tab_upd)
}
