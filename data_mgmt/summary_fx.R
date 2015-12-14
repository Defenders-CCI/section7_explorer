# Functions to summarize data for a Shiny App.
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
# Helper functions for factors
fac2num <- function(x) {
    return(as.numeric(as.character(x)))
}

fac2char <- function(x) {
    return(as.character(x))
}

############################################################################
# General helper functions
round_ratio <- function(x, y, places=3) {
    round(x / y, places) * 100
}

count_per_level <- function(x, y) {
    z <- tapply(x,
                INDEX=y,
                FUN=function(g) {length(levels(droplevels(as.factor(g))))}
                )
    return(z)
}

############################################################################
# Helper functions for years
get_number_years <- function(x) {
    return(length(levels(droplevels(x$FY))))
}

get_min_year <- function(x) {
    return(min(fac2num(x$FY), na.rm=T))
}

get_max_year <- function(x) {
    return(max(fac2num(x$FY), na.rm=T))
}

get_year_range <- function(x) {
    min_yr <- get_min_year(x)
    max_yr <- get_max_year(x)
    if (min_yr != max_yr) {
        return(paste(min_yr, "-", max_yr))
    } else {
        return(min_yr)
    }
}

############################################################################
# Helper functions for consultations
get_number_consults <- function(x) {
    return(length(x$activity_code))
}

get_number_formal <- function(x) {
    return(sum(x$formal_consult=="Yes", na.rm=T))
}

calculate_consults_per_year <- function(x) {
    return(table(x$FY))
}

calculate_formal_per_year <- function(x) {
    return(table(x[x$formal_consult=="Yes",]$FY))
}

calculate_n_jeop_cons <- function(x) {
    return(sum(x$n_jeop > 0, na.rm=T))
}

calculate_n_admod_cons <- function(x) {
    return(sum(x$n_admo > 0, na.rm=T))
}

############################################################################
# Helper functions for species
get_number_species <- function() {
    return(length(species)-1)
}

get_number_groups <- function(x) {
    return(length(levels(droplevels(x$Group))))
}

calculate_state_n_spp <- function(x) {
    cur_sp_ls <- levels(as.factor(unlist(x$spp_ev_ls)))
    return(length(cur_sp_ls))
}

############################################################################
# Helper functions for agencies
get_number_agencies <- function(x) {
    return(length(levels(droplevels(x$lead_agency))))
}

############################################################################
# Helper functions for personnel
get_number_personnel <- function(x) {
    return(length(levels(droplevels(x$staff_lead_hash))))
}

############################################################################
# Helper functions for ESFOs
get_number_ESFO <- function(x) {
    return(length(levels(droplevels(x$ESOffice))))
}

############################################################################
# Helper functions for consultation time
calculate_median_time <- function(x) {
    return(median(x$elapsed, na.rm=TRUE))
}

calculate_median_formal_time <- function(x) {
    return(median(x[x$formal_consult=="Yes",]$elapsed, na.rm=TRUE))
}

############################################################################
# Helper functions for states data/summaries
get_number_states <- function(x) {
    return(length(levels(droplevels(x$State))))
}

##############################################################################
# Make the data writeable.
##############################################################################
make_writeable <- function(x) {
    a_copy <- x
    a_copy$spp_ev_ls <- unlist(lapply(a_copy$spp_ev_ls, FUN=paste, collapse="; "))
    a_copy$spp_BO_ls <- unlist(lapply(a_copy$spp_BO_ls, FUN=paste, collapse="| "))
    spp_ev_ls <- gsub(pattern="\n", replace="", a_copy$spp_ev_ls)
    spp_BO_ls <- gsub(pattern="\n", replace="", a_copy$spp_BO_ls)
    a_copy$spp_ev_ls <- spp_ev_ls
    a_copy$spp_BO_ls <- spp_BO_ls
    return(a_copy)
}


