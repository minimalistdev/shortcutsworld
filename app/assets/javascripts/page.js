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
    var so_id = gon.soSelectedId;
    $(".so_id_" + so_id).addClass('ui-selected');

    fillAppTable(so_id);
});

$("#new-app-btn").click(function () {

    var id = $(".ui-selected").attr('id');

    if (id === undefined || id === null) {
        $.bootstrapGrowl("Please select the So", {type: 'info', width: 350, align: 'right', delay: 4000});
        // alert("selecione o SO");
    } else {
        console.log("called: /sos/" + id + "/apps/new")
        window.location.href = "/sos/" + id + "/apps/new";
    }
});

