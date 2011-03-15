// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
    // talks#show
    $("#comment_msg").hide();
    $("#comment_form").bind('ajax:success', function(e, data, status, xhr){
        var res = jQuery.parseJSON(data);
        console.log(res);
        $(".comments").append('<div class="comment">' +
                              '<div class="author_meta">' +
                              res['comment']['user_name'] +
                              '</div>' +
                              '<div class="description">' +
                              res['comment']['description'] +
                              '</div>' +
                              '</div>');
    });
    $("#comment_form").bind('ajax:error', function(e, xhr, status, error){
        var errorMsg = "akash";
        console.log("unproc entitry");
        if(xhr.responseText == "not authorized") {
            errorMsg = "Please login to comment"
        }
        else if(xhr.responseText != undefined) {
            var res = jQuery.parseJSON(xhr.responseText);
            errorMsg = res['description'][0];
        }
        else {
            errorMsg = "Oops! something went wrong";
        }
        $("#comment_msg").html(errorMsg);
        $("#comment_msg").show();
    });
});