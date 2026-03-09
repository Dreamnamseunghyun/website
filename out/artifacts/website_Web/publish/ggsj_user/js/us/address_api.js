//二쇱냼API ?ㅽ겕由쏀듃?쒖옉
// ?고렪踰덊샇 李얘린 ?붾㈃???ｌ쓣 element
var element_layer = document.getElementById('search_address');
    function closeDaumPostcode() {
        // iframe???ｌ? element瑜??덈낫?닿쾶 ?쒕떎.
        element_layer.style.display = 'none';
    }
      
function address_API() { 
        new daum.Postcode({ 
            oncomplete: function(data) {  
                 
                // 寃?됯껐怨???ぉ???대┃?덉쓣???ㅽ뻾??肄붾뱶瑜??묒꽦?섎뒗 遺遺?

                // 媛?二쇱냼???몄텧 洹쒖튃???곕씪 二쇱냼瑜?議고빀?쒕떎.
                // ?대젮?ㅻ뒗 蹂?섍? 媛믪씠 ?녿뒗 寃쎌슦??怨듬갚('')媛믪쓣 媛吏誘濡? ?대? 李멸퀬?섏뿬 遺꾧린 ?쒕떎.
                var addr = ''; // 二쇱냼 蹂??                var extraAddr = ''; // 李멸퀬??ぉ 蹂?? 
                //?ъ슜?먭? ?좏깮??二쇱냼 ??낆뿉 ?곕씪 ?대떦 二쇱냼 媛믪쓣 媛?몄삩??
                if (data.userSelectedType === 'R') { // ?ъ슜?먭? ?꾨줈紐?二쇱냼瑜??좏깮?덉쓣 寃쎌슦
                    addr = data.roadAddress;
                } else { // ?ъ슜?먭? 吏踰?二쇱냼瑜??좏깮?덉쓣 寃쎌슦(J)
                    addr = data.jibunAddress;
                }

                // ?ъ슜?먭? ?좏깮??二쇱냼媛 ?꾨줈紐???낆씪??李멸퀬??ぉ??議고빀?쒕떎.
                if(data.userSelectedType === 'R'){
                    // 踰뺤젙?숇챸???덉쓣 寃쎌슦 異붽??쒕떎. (踰뺤젙由щ뒗 ?쒖쇅)
                    // 踰뺤젙?숈쓽 寃쎌슦 留덉?留?臾몄옄媛 "??濡?媛"濡??앸궃??
                    if(data.bname !== '' && /[??濡?媛]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 嫄대Ъ紐낆씠 ?덇퀬, 怨듬룞二쇳깮??寃쎌슦 異붽??쒕떎.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); 
                    }
                    // ?쒖떆??李멸퀬??ぉ???덉쓣 寃쎌슦, 愿꾪샇源뚯? 異붽???理쒖쥌 臾몄옄?댁쓣 留뚮뱺??
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 議고빀??李멸퀬??ぉ???대떦 ?꾨뱶???ｋ뒗??
                     document.getElementsByClassName("address_code_2")[0].value = addr + extraAddr;
                     
                   
                } else {  
                  document.getElementsByClassName("address_code_2")[0].value = addr;
                }
 
                // ?고렪踰덊샇? 二쇱냼 ?뺣낫瑜??대떦 ?꾨뱶???ｋ뒗??
                 document.getElementsByClassName('address_code_1')[0].value = data.zonecode;
             
                 
                // 而ㅼ꽌瑜??곸꽭二쇱냼 ?꾨뱶濡??대룞?쒕떎.
                document.getElementsByClassName("address_code_2")[0].focus(); 
                document.getElementsByClassName("address_code_3")[0].focus();

                // iframe???ｌ? element瑜??덈낫?닿쾶 ?쒕떎.
                // (autoClose:false 湲곕뒫???댁슜?쒕떎硫? ?꾨옒 肄붾뱶瑜??쒓굅?댁빞 ?붾㈃?먯꽌 ?щ씪吏吏 ?딅뒗??)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);
     
        // iframe???ｌ? element瑜?蹂댁씠寃??쒕떎.
        element_layer.style.display = 'block';

        // iframe???ｌ? element???꾩튂瑜??붾㈃??媛?대뜲濡??대룞?쒗궓??
        initLayerPosition();
         
}
        
function initLayerPosition(){  
     
         var width = 500; //?고렪踰덊샇?쒕퉬?ㅺ? ?ㅼ뼱媛?element??width
        var height = 400; //?고렪踰덊샇?쒕퉬?ㅺ? ?ㅼ뼱媛?element??height
        var borderWidth = 1; //?섑뵆?먯꽌 ?ъ슜?섎뒗 border???먭퍡

        // ?꾩뿉???좎뼵??媛믩뱾???ㅼ젣 element???ｋ뒗??
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // ?ㅽ뻾?섎뒗 ?쒓컙???붾㈃ ?덈퉬? ?믪씠 媛믪쓣 媛?몄???以묒븰???????덈룄濡??꾩튂瑜?怨꾩궛?쒕떎.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
   $(window).resize(function() {
        var width = 500; //?고렪踰덊샇?쒕퉬?ㅺ? ?ㅼ뼱媛?element??width
        var height = 400; //?고렪踰덊샇?쒕퉬?ㅺ? ?ㅼ뼱媛?element??height
        var borderWidth = 1; //?섑뵆?먯꽌 ?ъ슜?섎뒗 border???먭퍡

        // ?꾩뿉???좎뼵??媛믩뱾???ㅼ젣 element???ｋ뒗??
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // ?ㅽ뻾?섎뒗 ?쒓컙???붾㈃ ?덈퉬? ?믪씠 媛믪쓣 媛?몄???以묒븰???????덈룄濡??꾩튂瑜?怨꾩궛?쒕떎.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';   
});     
}


  

$(document).mouseup(function (e) {
    var address_api = $("#search_address"); // ?먯떊
    if (!address_api.is(e.target) && address_api.has(e.target).length === 0){ //?ㅻⅨ怨녹쓣 ?대┃?덉쓣???먯떊???놁쑝硫? 
    element_layer.style.display = 'none';
    }	        
});   
