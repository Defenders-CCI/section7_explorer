# Histogram templates for Shiny apps.
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
# Histogram of consultation times
make_consult_duration_hist <- function(all, height="365px") {
    q98 <- quantile(all()$elapsed, 0.98, na.rm=TRUE)
    min <- min(all()[all()$elapsed < q98,]$elapsed, na.rm=TRUE)
    max <- max(all()[all()$elapsed < q98,]$elapsed, na.rm=TRUE)
    by <- round((max - min) / 20, 0)
    brks <- c(seq(min, max, by), max)
    formal <- all()[all()$formal_consult == "Yes", ]
    all_hist <- hist(all()[all()$elapsed < q98,]$elapsed, 
                     breaks=brks, 
                     plot=FALSE)
    formal_hist <- hist(formal[formal$elapsed < q98,]$elapsed, 
                        breaks=brks,
                        plot=FALSE)
    data <- data.frame(breaks=paste("<=", as.character(brks[2:length(brks)])), 
                       all=all_hist$counts, 
                       formal=formal_hist$counts)
    chart <- gvisSteppedAreaChart(data,
                 xvar="breaks", 
                 yvar=c("all", "formal"),
                 options = list(legend="{ position: 'top', maxLines: 2 }",
                                height=height,
                                colors="['#0A4783', '#f49831']",
                                hAxis="{title: 'Consultation duration (days)', showTextEvery: 4}",
                                isStacked=FALSE,
                                chartArea="{left: 80, top: 50, width:'85%', height:'75%'}")
    )
    chart
}
