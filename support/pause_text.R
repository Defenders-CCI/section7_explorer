# Functions to have Shiny text input wait to update
# Copyright (C) 2015 Defenders of Wildlife

##################################################################
# The base of this code was originally posted as a Gist at:
#   https://gist.github.com/xiaodaigh/7150112
# with no license information
##################################################################

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


myTextInput <- function(inputId, label, value = "") {
  tagList(tags$label(label, `for` = inputId), 
          tags$input(id = inputId, 
                     type = "text", 
                     value = value,
                     class="myTextInput"))
}

code = HTML("<script>
            var myTextInputBinding = new Shiny.InputBinding();
            $.extend(myTextInputBinding, {
                find: function(scope) {
                    return $(scope).find('.myTextInput');
                },
                getId: function(el) {
                    //return InputBinding.prototype.getId.call(this, el) || el.name;
                    return $(el).attr('id')
                },
                getValue: function(el) {
                    return el.value;
                },
                setValue: function(el, value) {
                    el.value = value;
                },
                subscribe: function(el, callback) {
                    $(el).on('keyup.textInputBinding input.textInputBinding', 
                             function(event) {
                                if(event.keyCode == 13) { 
                                //if enter
                                callback()
                               }
                         });
                $(el).on('focusout.myTextInputBinding', 
                        function(event) { 
                             // on losing focus
                             callback();
                        });
                },
                unsubscribe: function(el) {
                    $(el).off('.myTextInputBinding');
                },
                receiveMessage: function(el, data) {
                    if (data.hasOwnProperty('value'))
                        this.setValue(el, data.value);
                    if (data.hasOwnProperty('label'))
                        $(el).parent().find('label[for=' + el.id + ']').text(data.label);
                    $(el).trigger('change');
                },
                getState: function(el) {
                    return {
                        label: $(el).parent().find('label[for=' + el.id + ']').text(),
                        value: el.value
                    };
                },
                getRatePolicy: function() {
                    return {
                        policy: 'debounce',
                        delay: 250
                    };
                }
            });
            Shiny.inputBindings.register(myTextInputBinding, 
                                         'shiny.myTextInput');
            </script>"
)

