$(function () {
    var span1=$("#span1");
    var span2=$("#span2");
    var inputUser=$("#userid");
    var inputPass=$("#password");
    inputUser.blur(function () {
        if (inputUser.val()===""){
            span1.css("background","url('images/errorIcon.png') no-repeat");
        }else {
            span1.css("background","");
        }
    });
    inputUser.focus(function () {
        span1.css("background","");
    });

    inputPass.blur(function () {
        if (inputPass.val()===""){
            span2.css("background","url('images/errorIcon.png') no-repeat");
        }else {
            span2.css("background","");
        }
    });
    inputPass.focus(function () {
        span2.css("background","");
    });

    $("#loginForm").submit(function () {
        if (inputUser.val()===""||inputPass.val()===""){
            if (inputUser.val()===""){
                span1.css("background","url('images/errorIcon.png') no-repeat");
            }
            if (inputPass.val()===""){
                span2.css("background","url('images/errorIcon.png') no-repeat");
            }
            return false;
        }else{
            return true;
        }
    });
});