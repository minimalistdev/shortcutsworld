$(document).on('change', '.btn-file :file', function () {
    var input = $(this),
        numFiles = input.get(0).files ? input.get(0).files.length : 1,
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [numFiles, label]);
});

$(document).ready(function () {
    $('.btn-file :file').on('fileselect', function (event, numFiles, label) {

        var input = $(this).parents('.input-group').find(':text'),
            log = numFiles > 1 ? numFiles + ' files selected' : label;

        if (input.length) {
            input.val(log);
        } else {
            if (log) alert(log);
        }
    });
});

$(document).ready(function () {
    if ($("#notice").length) {
        $.bootstrapGrowl($("#notice").show(), {type: 'info', width: 350, align: 'right', delay: 4000});
    }
    if ($("#alert").length) {
        $.bootstrapGrowl($("#alert").show(), {type: 'danger', width: 350, align: 'right', delay: 4000});
    }
});

$(document).ready(function () {
    $(".selectable").selectable(function (target) {
        console.log(target);
    });
});

$(document).ready(function () {
    if (typeof gon!== 'undefined' && typeof gon.soSelectedId !== 'undefined') {
        var so_id = gon.soSelectedId;
    }
    if (typeof gon!== 'undefined' && typeof gon.appSelectedId !== 'undefined') {
        var app_id = gon.appSelectedId;
    }

    $(".so_id_" + so_id).addClass('ui-selected');

    fillAppTable(so_id, app_id);
    fillShortcutTable(app_id);
});

$("#new-app-btn").click(function () {

    var id = $("#so-selectable > .ui-selected").attr('id');

    if (id === undefined || id === null) {
        $.bootstrapGrowl("Please select the So", {type: 'info', width: 350, align: 'right', delay: 14000});
    } else {
        console.log("called: /sos/" + id + "/apps/new")
        window.location.href = "/sos/" + id + "/apps/new";
    }
});


$("#new-shortcut-btn").click(function () {

    var id = $("#app-selectable > .ui-selected").attr('id');

    if (id === undefined || id === null) {
        $.bootstrapGrowl("Please select the App", {type: 'info', width: 350, align: 'right', delay: 14000});
        console.log(id);
    } else {
        window.location.href = "/sos/0/apps/"+id+"/shortcuts/new"
    }

});

var fillAppTable = function (so_id, app_id) {
        $("#app-selectable").html('');
        var html = '';

        $.get("/sos/"+ so_id +"/apps", function( data ){
            $.each(data, function(i, item){
                html += '<div class="clickable col-md-3 col-md-offset-1 text-center app_id_'+ item.id +'" id="'+item.id+'">'+
                            '<div class="panel panel-primary">'+
                                '<div class="panel-heading">'+
                                    '<h3 class="panel-title app-name">'+ item.name +'</h3>'+
                                '</div>'+
                                '<div class="panel-body">'+
                                    '<img class="img-responsive center-block" src="'+ item.img.url +'">'+
                                '</div>'+
                            '</div>'+
                        '</div>';
            });
            $("#app-selectable").append(html);

            if(typeof app_id !== 'undefined'){
                $(".app_id_" + app_id).addClass('ui-selected');
            }
        });
};

var fillShortcutTable = function (app_id) {
    $("#shortcut-selectable").html('');
    var html = '';

    $.get("/sos/apps/"+ app_id +"/shortcuts", function( data ){
        $.each(data, function(i, item){
            var keys = item.shortcut.split(" + ");

            var keysHtml = [];
            keys.forEach(function (item) {
                keysHtml.push('<span class="kbd">' + item + '</span>');
            });

            html +=
            '<div class="bottom-buffer col-md-3 col-md-offset-1">' +
                '<span class="shortcutTitle"> '+ item.name +'</span></br>' +
                 keysHtml.join(' + ') +
            '</div>';

        });
        $("#shortcut-selectable").append(html);
    });
};

$(document).ready(function () {
    $("#so-selectable").selectable({
        selected: function(event, ui) {
            fillAppTable(ui.selected.id);
            window.history.pushState("SO", "Current SO", "/sos/"+ui.selected.id);
            scrollTo("#app");
        }
    });
});


$(document).ready(function () {
    $("#app-selectable").selectable({
        selected: function(event, ui) {
            var soId = (window.location.href).slice(-1);
            fillShortcutTable(ui.selected.id);
            window.history.pushState("SO", "Current SO", "/sos/apps/"+ui.selected.id);
            scrollTo("#shortcut");
        }
    });
});


$('.key').click(function () {

    var key = this.text;
    if(key.length > 2 || key == 'fn' || key.indexOf("F") === 0) {
    }else {
        key = this.text.slice(-1).toUpperCase();
    }

    if(!$.trim($('#path-way-input input').val())){
        $('#path-way-input input').val(key);
    } else {
        $('#path-way-input input').val($('#path-way-input input').val() +'  +  '+ key.trim());
    }
});


$('.key-pc').click(function () {
    var text = $(this).text();
    var key;
    if(text.length > 2 || text == 'fn' || text.indexOf("F") === 0) {
        key = text;
    }else {
        key = text.slice(-1).toUpperCase();
    }

    if(!$.trim($('#path-way-input input').val())){
        $('#path-way-input input').val(key.trim());
    } else {
        $('#path-way-input input').val($('#path-way-input input').val() +'  +  '+ key.trim());
    }
});

function scrollTo(here){
    $('html, body').stop().animate({
        scrollTop: $(here).offset().top
    }, 1500, 'easeInOutExpo');
}
