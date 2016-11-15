Selectize.define('remove_button', function(options) {
  options = $.extend({
      label     : '&times;',
      title     : 'Remove',
      className : 'remove',
      append    : true
    }, options);

    var singleClose = function(thisRef, options) {

      options.className = 'remove-single';

      var self = thisRef;
      var html = '<a href="javascript:void(0)" class="' + options.className + '" tabindex="-1" title="' + escape_html(options.title) + '">' + options.label + '</a>';

      /**
       * Appends an element as a child (with raw HTML).
       *
       * @param {string} html_container
       * @param {string} html_element
       * @return {string}
       */
      var append = function(html_container, html_element) {
        return html_container + html_element;
      };

      thisRef.setup = (function() {
        var original = self.setup;
        return function() {
          // override the item rendering method to add the button to each
          if (options.append) {
            var id = $(self.$input.context).attr('id');
            var selectizer = $('#'+id);

            var render_item = self.settings.render.item;
            self.settings.render.item = function(data) {
              return append(render_item.apply(thisRef, arguments), html);
            };
          }

          original.apply(thisRef, arguments);

          // add event listener
          thisRef.$control.on('click', '.' + options.className, function(e) {
            e.preventDefault();
            if (self.isLocked) return;

            self.clear();
          });

        };
      })();
    };

    var multiClose = function(thisRef, options) {

      var self = thisRef;
      var html = '<a href="javascript:void(0)" class="' + options.className + '" tabindex="-1" title="' + escape_html(options.title) + '">' + options.label + '</a>';

      /**
       * Appends an element as a child (with raw HTML).
       *
       * @param {string} html_container
       * @param {string} html_element
       * @return {string}
       */
      var append = function(html_container, html_element) {
        var pos = html_container.search(/(<\/[^>]+>\s*)$/);
        return html_container.substring(0, pos) + html_element + html_container.substring(pos);
      };

      thisRef.setup = (function() {
        var original = self.setup;
        return function() {
          // override the item rendering method to add the button to each
          if (options.append) {
            var render_item = self.settings.render.item;
            self.settings.render.item = function(data) {
              return append(render_item.apply(thisRef, arguments), html);
            };
          }

          original.apply(thisRef, arguments);

          // add event listener
          thisRef.$control.on('click', '.' + options.className, function(e) {
            e.preventDefault();
            if (self.isLocked) return;

            var $item = $(e.currentTarget).parent();
            self.setActiveItem($item);
            if (self.deleteSelection()) {
              self.setCaret(self.items.length);
            }
          });

        };
      })();
    };

    if (this.settings.mode === 'single') {
      singleClose(this, options);
      return;
    } else {
      multiClose(this, options);
    }
});