(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: ZH (Chinese, 訝?뻼 (Zh흲ngw챕n), 黎됭?, 轢?첑)
 */
$.extend($.validator.messages, {
	required: "恙낂』櫻ュ넍",
	remote: "瑥룝엶閭ｆ??뤶퐤",
	email: "瑥룩풏?ζ쐣?덄쉪?드춴??뻑",
	url: "瑥룩풏?ζ쐣?덄쉪營묈?",
	date: "瑥룩풏?ζ쐣?덄쉪?ζ쐿",
	dateISO: "瑥룩풏?ζ쐣?덄쉪?ζ쐿 (YYYY-MM-DD)",
	number: "瑥룩풏?ζ?簾?쉪?겼춻",
	digits: "?ゅ룾渦볟뀯?겼춻",
	creditcard: "瑥룩풏?ζ쐣?덄쉪岳←뵪?▼뤇??,
	equalTo: "鵝좂쉪渦볟뀯訝띸쎑??,
	extension: "瑥룩풏?ζ쐣?덄쉪?롧?",
	maxlength: $.validator.format("?鸚?{0} 訝ゅ춻"),
	minlength: $.validator.format("?弱?{0} 訝ゅ춻"),
	rangelength: $.validator.format("瑥룩풏?ι빣佯╊맏 {0} ??{1} 阿뗩뼋?꾢춻訝?),
	range: $.validator.format("瑥룩풏??{0} ??{1} 阿뗩뿴?꾣빊??),
	max: $.validator.format("瑥룩풏?δ툖鸚㏛틢 {0} ?꾣빊??),
	min: $.validator.format("瑥룩풏?δ툖弱뤶틢 {0} ?꾣빊??)
});

}));
