(function($) {

    var methods = {
        init: function(callback) {
            var last = { x:-1, y:-1 };

            data = {
                check: function(x, y) {
                    ret = ( last.x == x && last.y == y );
                    last.x = x;
                    last.y = y;
                    return ret;
                },
                elements: this,
                callback: callback,
            };

            for (i=0; i<this.length; i++) {
                e = this[i];
                if (e.localName) {
                    $(e).bind('mouseup.selectable', data, methods.onmouseup).bind('mousedown.selectable', data, methods.onmousedown);
                }
            }
        },

        destory: function() {
            for (i=0; i<this.length; i++) {
                $(this[i]).unbind('.selectable');
            }
        },

        onmousedown: function(event) {
            event.data.check(event.clientX, event.clientY);
        },

        onmouseup: function(event) {
            if (event.data.check(event.clientX, event.clientY)) {
                for (i=0; i<event.data.elements.length; i++) {
                    $(event.data.elements[i]).removeClass('ui-selected');
                }
                $(this).addClass('ui-selected');

                var so_id = $(".ui-selected").attr('id');

                $("#div_apps").html('');
                var html = '';

                $.get("/sos/"+ so_id +"/apps", function( data ){
                    $.each(data, function(i, item){
                        html += '<div class="col-md-3 col-md-offset-1 text-center app_id_'+ item.id +'">'+
                                    '<div class="panel panel-primary clickable">'+
                                        '<div class="panel-heading">'+
                                            '<h3 class="panel-title app-name">'+ item.name +'</h3>'+
                                        '</div>'+
                                        '<div class="panel-body">'+
                                            '<img class="img-responsive center-block" src="'+ item.img.url +'" '+
                                        '</div>'+
                                    '</div>'+
                                '</div>';
                    });
                    $("#div_apps").append(html);

                });
                history.pushState(null, "/", "/sos/"+ so_id);

                if (event.data.callback) { event.data.callback(this); }
            }
        },
    };

    $.fn.selectable = function(method, args) {
        if ( typeof method !== 'string' || !method ) {
            args = method;
            method = 'init';
        }

        if (methods[method]) {
            return this.each(function() {
                methods[method].apply(this.childNodes, [args]);
            });
        } else {
            $.error('Method ' + method + ' does not exist on jQuery.selectable');
        }
    };

})(jQuery);