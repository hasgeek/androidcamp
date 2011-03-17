// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
    // talks#show
    $("#comment_msg").hide();
    $(".comment_form").bind('ajax:success', function(e, data, status, xhr){
        var res = jQuery.parseJSON(data);
        console.log(res);
        var htmlDump = '<div class="comment">' +
            '<div class="author_meta">' + res['comment']['user']['name'] +'</div>' +
            '<div class="comment_text">' + res['comment']['description'] + '</div>' +
            '</div>';
        console.log(htmlDump);
        $(".comments").append(htmlDump);
    });
    $(".comment_form").bind('ajax:error', function(e, xhr, status, error){
        var errorMsg;
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

    // voting
    $(".voting_form").bind('ajax:success', function(e, data, status, xhr){
        // TODO hide the button

    });
    $(".voting_form").bind('ajax:error', function(e, xhr, status, error){
        // just leave the button alone
    });
});