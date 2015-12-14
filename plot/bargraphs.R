# Bargraphs for the section 7 Shiny app.
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
# Species consultation summary barchart
make_consult_time_figure <- function(dat, height="415px") {
    cur_dat <- make_consult_year_summary_df(dat())
    chart <- gvisColumnChart(cur_dat, 
                 xvar="years", 
                 yvar=c("all", "formal"),
                 options = list(legend="{ position: 'top', maxLines: 2 }",
                                height=height,
                                colors="['#0A4783', '#f49831']",
                                bar="{groupWidth:'90%'}",
                                vAxis="{title: '# Consultations'}",
                                chartArea="{left: 80, top: 50, width:'90%', height:'75%'}")
    )
    chart
}

#############################################################################
# Species summary barchart
make_species_plot <- function(dat, height="475px", chartHeight="65%") {
    cur_dat <- make_top_25_species_df(dat())
    left <- nchar(as.character(cur_dat$species[1])) * 5
    if (left > 200) {
        left <- 200
    }
    chartArea <- paste("{left: ", left, ", top: 50, width: '90%', height: '",
                       chartHeight, "'}", sep="")
    chart2 <- gvisColumnChart(cur_dat,
                 xvar="species",
                 yvar="consultations",
                 options = list(height=height,
                                colors="['#0A4783']",
                                legend="{position: 'none'}",
                                vAxis="{title: '# Consultations'}",
                                chartArea=chartArea)
             )
    chart2
}

#############################################################################
# Work categories summary barchart
make_work_cat_plot <- function(dat, height="440px", chartHeight="65%") {
    cur_dat2 <- make_state_work_cat_df(dat())
    left <- nchar(as.character(cur_dat2$work_cat[1])) * 5
    if (left < 80) {
        left <- 80
    }
    chartArea <- paste("{left: ", left, ", top: 50, width: '85%', height: '",
                       chartHeight, "'}", sep="")
    chart3 <- gvisColumnChart(cur_dat2,
                 xvar="work_cat",
                 yvar="consultations",
                 chartid=rand_str(),
                 options = list(height=height,
                                colors="['#0A4783']",
                                legend="{position: 'none'}",
                                vAxis="{title: '# Consultations'}",
                                chartArea=chartArea)
             )
    chart3
}

#############################################################################
# Agency summary barchart
make_agency_plot <- function(dat, height="500px", chartHeight="65%", width="90%") {
    cur_dat <- make_top_25_agencies_df(dat())
    left <- nchar(as.character(cur_dat$agency[1])) * 6
    if (left < 80) {
        left <- 80
    }
    if (left > 200) {
        left <- 200
    }
    chartArea <- paste("{left: ", left, ", top: 50, width: '", width, "', height: '",
                       chartHeight, "'}", sep="")
    chart4 <- gvisColumnChart(cur_dat,
                 xvar="agency",
                 yvar="consultations",
                 options = list(height=height,
                                colors="['#0A4783']",
                                legend="{position: 'none'}",
                                vAxis="{title: '# Consultations'}",
                                chartArea=chartArea)
             )
    chart4
}

