window.onload=function () {
    var UserId=document.getElementById("UserId");
    var nullUserId=document.getElementById("nullUserId");
    var Upsw=document.getElementById("Upsw");
    var nullUpsw=document.getElementById("nullUpsw");
    var cpass=document.getElementById("cpass");
    var nullCpass=document.getElementById("nullCpass");
    var username=document.getElementById("username");
    var nullUsername=document.getElementById("nullUsername");
    var idcard=document.getElementById("idcard");
    var nullIdcard=document.getElementById("nullIdcard");
    var age=document.getElementById("age");
    var nullAge=document.getElementById("nullAge");
    var phone=document.getElementById("phone");
    var nullPhone=document.getElementById("nullPhone");

    UserId.onblur=function () {
        if (UserId.value===""){
            nullUserId.style.display="block";
        }else {
            removeFun();
        }
    }
    Upsw.onfocus=function () {
        nullUserId.style.display="none";
    }

    Upsw.onblur=function () {
        if (Upsw.value===""){
            nullUpsw.style.display="block";
        }else {
            removeFun();
        }
    }
    Upsw.onfocus=function () {
        nullUpsw.style.display="none";
    }

    cpass.onblur=function () {
        if (cpass.value===""){
            nullCpass.style.display="block";
        }else {
            removeFun();
        }
    }
    cpass.onfocus=function () {
        nullCpass.style.display="none";
    }

    username.onblur=function () {
        if (username.value===""){
            nullUsername.style.display="block";
        }else {
            removeFun();
        }
    }
    username.onfocus=function () {
        nullUsername.style.display="none";
    }

    idcard.onblur=function () {
        if (idcard.value===""){
            nullIdcard.style.display="block";
        }else {
            removeFun();
        }
    }
    idcard.onfocus=function () {
        nullIdcard.style.display="none";
    }

    age.onblur=function () {
        if (age.value===""){
            nullAge.style.display="block";
        }else {
            removeFun();
        }
    }
    age.onfocus=function () {
        nullAge.style.display="none";
    }

    UserId.onblur=function () {
        if (UserId.value===""){
            nullUserId.style.display="block";
        }else {
            removeFun();
        }
    }
    UserId.onfocus=function () {
        nullUserId.style.display="none";
    }

    phone.onblur=function () {
        if (phone.value===""){
            nullPhone.style.display="block";
        }else {
            removeFun();
        }
    }
    phone.onfocus=function () {
        nullPhone.style.display="none";
    }

    var rg_submit=document.getElementById("rg_submit");
    var removeFun=function () {
        if (UserId.value!==""&&Upsw.value!==""&&cpass.value!==""&&username.value!==""
            &&idcard.value!==""&&age.value!==""&&UserId.value!==""&&phone.value!==""){
            rg_submit.removeAttribute("disabled");
        }else{
            rg_submit.setAttribute("disabled","disabled");
        }
    }
}



