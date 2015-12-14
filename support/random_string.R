# filename
# Support functions for generating random strings.
# Copyright (C) 2015 Defenders of Wildlife, jmalcom@defenders.org
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

rand_str <- function(len=12) {
    return(paste(sample(c(rep(0:9,each=5),
                          LETTERS,
                          letters),
                        len,
                        replace=TRUE),
           collapse='')
    )
}

