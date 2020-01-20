//loadJavaScriptFile("Scripts/jquery-1.4.1.min.js");
loadJavaScriptFile("Scripts/jquery.validate.min.js");
loadJavaScriptFile("Scripts/jquery.metadata.min.js");

function loadJavaScriptFile(jspath) {
    document.write('<script type="text/javascript" src="' + jspath + '"><\/script>');
}

function InitializeValidation(obj) {
    
    var validator = $("#aspnetForm").bind("invalid-form.validate", function () { }).validate({
        debug: true,
        errorElement: "em",
        errorPlacement: function (errorr, element) {
            errorr.appendTo(element.parent());
            offset = element.offset();
            errorr.addClass('message');  // add a class to the wrapper
            //errorr.css('position', 'absolute');
            errorr.css('left', offset.left); //element.outerWidth()
            errorr.css('color', 'red');
        },
        success: function (label) {
            label.text("").addClass("success");
        },
        submitHandler: function () {
            obj();
        }
    });
}



