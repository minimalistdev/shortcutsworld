$(document).on('change', '.btn-file :file', function() {
    var input = $(this),
        numFiles = input.get(0).files ? input.get(0).files.length : 1,
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [numFiles, label]);
});

$(document).ready( function() {
    $('.btn-file :file').on('fileselect', function(event, numFiles, label) {

        var input = $(this).parents('.input-group').find(':text'),
            log = numFiles > 1 ? numFiles + ' files selected' : label;

        if( input.length ) {
            input.val(log);
        } else {
            if( log ) alert(log);
        }

    });
});

$(document).ready(function(){
   if($("#notice").length){
       $.bootstrapGrowl($("#notice").show(), { type: 'info',  width: 350, align: 'right', delay: 4000});
    }
    if($("#alert").length){
        $.bootstrapGrowl($("#alert").show(), { type: 'danger',  width: 350, align: 'right', delay: 4000});
    }
});
//
//$(document).ready(function(){
//    $('#new_so').validator().on("submit", function(event){
//        if (event.isDefaultPrevented()) {
//           alert("Error");
//        } else {
//            // everything looks good!
//            event.preventDefault();
//        }
//    });
//});