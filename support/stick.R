# Support making a sticky div.
# Copyright © 2015 Defenders of Wildlife, jmalcom@defenders.org

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


myStickyDiv <- function(inputId, label, value = "") {
  tagList(tags$label(label, `for` = inputId), 
          tags$input(id = inputId, 
                     # type = "text", 
                     value = value,
                     class="myStickyDiv"))
}

stickCode = HTML("<script>
    function moveScroller() {
        var move = function() {
            var st = $(window).scrollTop();
            var ot = $('#scroller-anchor').offset().top;
            var s = $('#scroller');
            if(st > ot) {
                s.css({
                    position: 'fixed',
                    top: '0px'
                });
            } else {
                if(st <= ot) {
                    s.css({
                        position: 'relative',
                        top: ''
                    });
                }
            }
        };
        $(window).scroll(move);
        move();
    }</script>"
)

