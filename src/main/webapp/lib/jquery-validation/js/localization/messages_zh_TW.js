(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: ZH (Chinese; 訝?뻼 (Zh흲ngw챕n), 黎됭?, 轢?첑)
 * Region: TW (Taiwan)
 */
$.extend($.validator.messages, {
	required: "恙낂젅櫻ュ?",
	remote: "獄뗤엶閭ｆ?轝꾡퐤",
	email: "獄뗨섯?ζ쐣?덄쉪?삣춴?듕뻑",
	url: "獄뗨섯?ζ쐣?덄쉪泳꿨?",
	date: "獄뗨섯?ζ쐣?덄쉪?ζ쐿",
	dateISO: "獄뗨섯?ζ쐣?덄쉪?ζ쐿 (YYYY-MM-DD)",
	number: "獄뗨섯?ζ?閻븀쉪?멨?,
	digits: "?ゅ룾雍멨뀯?멨춻",
	creditcard: "獄뗨섯?ζ쐣?덄쉪岳←뵪?↑솦閻?,
	equalTo: "獄뗩뇥筽뉓섯?δ?轝?,
	extension: "獄뗨섯?ζ쐣?덄쉪孃뚨떪",
	maxlength: $.validator.format("?鸚?{0} ?뗥춻"),
	minlength: $.validator.format("?弱?{0} ?뗥춻"),
	rangelength: $.validator.format("獄뗨섯?ι빓佯?궨 {0} ??{1} 阿뗩뼋?꾢춻訝?),
	range: $.validator.format("獄뗨섯??{0} ??{1} 阿뗩뼋?꾣빖??),
	max: $.validator.format("獄뗨섯?δ툖鸚㎪뼹 {0} ?꾣빖??),
	min: $.validator.format("獄뗨섯?δ툖弱뤸뼹 {0} ?꾣빖??)
});

}));
