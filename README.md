# Rails 3.2 Integration for switch_access

The `switch_access-rails` gem integrates the [Switch Access](http://leifcr.github.com/switch_access) library with the Rails 3.2 asset pipeline.


## Usage

### Installation

**1. Add `switch_access-rails` to your Gemfile**

    gem 'switch_access-rails'

**2. Run `bundle install`.**

**3. Using**

Add to your application.js:
_jQuery_ is only needed if you haven't included them already

```js
//= require jquery 
//= require switch_access
```
### Helper methods
Four helper methods that should be used when creating switch-elements, and initializing the library

```ruby
# Reset counters to 0, this is done before rendering
sw_element_reset_counters()

# get the next "group" classname with an id appended (increments automatically)
sw_element_begin_group()

# get the next "element" classname with an id appended (increments automatically)
sw_element_next_class()

# ends the group that was started.
sw_element_end_group()

# Get javascript initializer with given options. 
# (Recommended to have as late as possible on the page)
sw_element_js_initializer(options = {})

# finalizes the switch access. Note: Must be done on the end of each page for now...
sw_element_fini()

```

## Example

Example in a ERB view

```erb
<%= 
content_tag :div, :class => sw_element_begin_group() do
  content_tag(:div, "Switch element 1 in group 1", :class => sw_element_next_class()) +
  content_tag(:div, "Switch element 2 in group 1", :class => sw_element_next_class()) +
  content_tag(:div, "Switch element 3 in group 1", :class => sw_element_next_class())
end

%>
<% sw_element_end_group() %>

<%=
content_tag :div, :class => sw_element_begin_group() do
  content_tag(:div, "Switch element 1 in group 2", :class => sw_element_next_class()) +
  content_tag(:div, "Switch element 2 in group 2", :class => sw_element_next_class())
end
%>
<% sw_element_end_group() %>

<%= content_tag :div, "Switch element 3 outside groups", :class => sw_element_next_class() %>
<%= sw_element_js_initializer({
  :debug => false, # can be removed if value is false
  :switches => {
    :number_of_switches => 2, 
    :groups => true,
    :delay_for_allowed_keypress => 0
    }
  }) %>
<%= sw_element_fini() %>
```

See [leifcr.github.com/switch_access](http://leifcr.github.com/switch_access) for examples, unit tests of the library and documentation.

### Example CSS

You can include sample CSS stylesheets to see how highlighters/classes work
```css
/* Complete example
 *= require switch_access/example
 *
 * Only highlighters
 *= require switch_access/example_highlighter
 *
 * Only switch element
 *= require switch_access/example_switch_element
 */
```

### Debugging

If you need to debug, log4javascript is included in the gem To avoid issues with log4javascript in other gems, it's namespaced under switch_access

First, add log4javascript to your application.js or other .js
```js
//= require switch_access/log4javascript
```

Second, set debug to true, and a log4javascript Appender/console should show up.

If you have a div with id set to "logger" the appender/console will be created inside that div.

## License
This GEM is dual licensed under the GPL license and a commercial license. See LICENSE and LICENSE.GPL for details. For commercial usage, please contact leifcr@gmail.com

## Contact
Feel free to contact me at @leifcr (twitter).

Copyright (c) 2012 Leif Ringstad
