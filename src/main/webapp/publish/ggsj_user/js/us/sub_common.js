//팝업
function popup_open(){
        $(".click_popup_bg").css({visibility:"visible",opacity:"1","transition":"all 1s cubic-bezier(.19,1,.22,1) 0s"});
        $(".click_popup").css({visibility:"visible",opacity:"1","transition":"all 2s cubic-bezier(.19,1,.22,1) 0.3s"});
    }
function popup_close(){
        $(".click_popup_bg").css({visibility:"hidden",opacity:"0","transition":"all 1s cubic-bezier(.19,1,.22,1) 0.3s"});
        $(".click_popup").css({visibility:"hidden",opacity:"0","transition":"all 1s cubic-bezier(.19,1,.22,1)"});
}

/*팝업종료*/

$(".click_popup .click_popup_close").click(function(){
    popup_close()

})

$(".click_popup_bg").click(function(){
     popup_close()
})



//input 한글만
 $(".ko").keyup(function(event){
  rename = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
  kv = $(this).val();
  if( rename.test(kv) ) {
   $(this).val(kv.replace(rename,''));
  }
 });

//input 숫자만
var num = /^[0-9]*$/;
$(".only_num").on("keyup" , function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );})




//한글 입력불가 (아이디 비밀번호 이메일)
 $(".id_input").keyup(function(event){
    $(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
 })

 $(".password_input").keyup(function(event){
    $(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
 })

$('.email_input').on("keyup", function() {
	$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
});




//휴대전화번호
    var autoHypenPhone = function(str){
      str = str.replace(/[^0-9]/g, '');
      var tmp = '';
      if( str.length < 4){
          return str;
      }else if(str.length < 7){
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3);
          return tmp;
      }else if(str.length < 11){
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3, 3);
          tmp += '-';
          tmp += str.substr(6);
          return tmp;
      }else{
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3, 4);
          tmp += '-';
          tmp += str.substr(7);
          return tmp;
      }

      return str;
}
$(".phone_num").keyup(function(event){
  this.value = autoHypenPhone( this.value ) ;
})





//체크박스
$(".chk_boxArea .item").click(function(){
var chk = $(this).find("input").is(":checked");
    if (chk){ //체크가 되었을시
      $(this).find("input").prop("checked",true).parents(".chk_area").addClass("active").parents("tr").siblings("tr").find("td:last-of-type").find(".chk_area").removeClass("active").find("input").prop("checked",false)

    }

});


//비밀번호 체크
function password_check(password) {
	var regExp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W).{8,16})/; //  8 ~ 16자 영문, 숫자 조합
	return regExp.test(password); // 형식에 맞는 경우 true 리턴
}

//패스워드 visible
$(".password_icon").click(function(){
    $(this).toggleClass('visible');

    if($(this).hasClass('visible')){
            $(this).find("i").attr('class',"fa fa-eye").parents(".input_type1").find(".password_input").attr('type','text');

        }
        else{
            $(this).find("i").attr('class',"fa fa-eye-slash").parents(".input_type1").find(".password_input").attr('type','password');
    }
})



//이메일 체크
function email_check(email) {
	var regExp = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
	return regExp.test(email);
}

//chk_type2(radio 체크)
$(".chk_type2 .chk_boxArea label").click(function(){
var chk = $(this).children("input").is(":checked");
var chk_active = $(this).children("input").addClass("active");
    if (chk){ //체크가 되었을시
        $(this).children("input").prop("checked",false).next().removeClass("chk_true1").next().removeClass("chk_true2");
    }
    else{ //체크가 안되었을시
     $(this).children("input").prop("checked",true).next().addClass("chk_true1").next().addClass("chk_true2");
        }
$(this).parent("div").siblings("div").children("label").children("input").prop("checked",false).next().removeClass("chk_true1").next().removeClass("chk_true2");
});


//chk_type2_2_user(user radio 체크)
$(".chk_type2_2_user .chk_boxArea label").click(function(){
var chk = $(this).children("input").is(":checked");
var chk_active = $(this).children("input").addClass("active");
    if (chk){ //체크가 되었을시
        $(this).children("input").prop("checked",false).next().removeClass("chk_true1").next().removeClass("chk_true2");
    }
    else{ //체크가 안되었을시
     $(this).children("input").prop("checked",true).next().addClass("chk_true1").next().addClass("chk_true2");
        }
$(this).parents(".chk_boxArea").siblings().find(".check_area input").prop("checked",false).next().removeClass("chk_true1").next().removeClass("chk_true2");
});





/*email*/
$(".email_type .custom-option").on("click", function() {
var email_value = $(this).attr("data-value");

    if(email_value == "direct"){
        $(this).parents(".select_box").find(".select_box_direct").css({"opacity":"1","pointer-events":"auto"});
        $(this).parents(".select_box").find(".select_box_direct").focus();
    }


    else{
        $(this).parents(".select_box").find(".select_box_direct").css({"opacity":"0","pointer-events":"none"});
    }

});



 //직접선택
 $(".select_box_direct").on('blur', function(){
    var reset_option_text = $(this).parents(".select_box").find(".custom-options .custom-option:nth-of-type(1)").text();
    var direct_text = $(this).val();

    if(this.value.length > 0){
     $(this).css({"opacity":"1", "pointer-events":"auto"});
      $(this).parents(".select_box").find("input[type=hidden]").val(direct_text)
      $(this).parents(".select_box").find(".custom-select option:eq(1)").prop("selected", true);

    }
    else{
       $(this).css({"opacity":"0", "pointer-events":"none"});

        $(this).parents(".select_box").find(".custom-options .custom-option:nth-of-type(1)").addClass("selection")
        .siblings().removeClass("selection").parents(".custom-select").find(".custom-select-trigger").text(reset_option_text);

        $(this).parents(".select_box").find("input[type=hidden]").val("")

        $(this).parents(".select_box").find(".custom-select option:eq(0)").prop("selected", true);

    }

 });



function popup_value_reset(){
$(".click_popup input").val('').prop("checked",false);

$(".click_popup .chk_true1").removeClass("chk_true1");
$(".click_popup .chk_true2").removeClass("chk_true2");

var reset_option_text = $(".click_popup .select_box_direct").parents(".select_box").find(".custom-options .custom-option:nth-of-type(1)").text();

$(".click_popup .select_box_direct").css({"opacity":"0", "pointer-events":"none"});

$(".click_popup .select_box_direct").parents(".select_box").find(".custom-options .custom-option:nth-of-type(1)").addClass("selection").siblings().removeClass("selection").parents(".custom-select").find(".custom-select-trigger").text(reset_option_text);

$(".click_popup .select_box_direct").parents(".select_box").find("input[type=hidden]").val("");

$(".click_popup .select_box_direct").parents(".select_box").find(".custom-select option:eq(0)").prop("selected", true);
}



