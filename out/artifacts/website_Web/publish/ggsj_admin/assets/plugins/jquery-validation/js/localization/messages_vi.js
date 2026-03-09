(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: VI (Vietnamese; Ti梳퓆g Vi沼뇍)
 */
$.extend($.validator.messages, {
	required: "H찾y nh梳춑.",
	remote: "H찾y s沼춁 cho 휃첬ng.",
	email: "H찾y nh梳춑 email.",
	url: "H찾y nh梳춑 URL.",
	date: "H찾y nh梳춑 ng횪y.",
	dateISO: "H찾y nh梳춑 ng횪y (ISO).",
	number: "H찾y nh梳춑 s沼?",
	digits: "H찾y nh梳춑 ch沼?s沼?",
	creditcard: "H찾y nh梳춑 s沼?th梳?t챠n d沼쩸g.",
	equalTo: "H찾y nh梳춑 th챗m l梳쬷 n沼칊.",
	extension: "Ph梳쬷 m沼?r沼셬g kh척ng 휃첬ng.",
	maxlength: $.validator.format("H찾y nh梳춑 t沼?{0} k챠 t沼?tr沼?xu沼몁g."),
	minlength: $.validator.format("H찾y nh梳춑 t沼?{0} k챠 t沼?tr沼?l챗n."),
	rangelength: $.validator.format("H찾y nh梳춑 t沼?{0} 휃梳퓆 {1} k챠 t沼?"),
	range: $.validator.format("H찾y nh梳춑 t沼?{0} 휃梳퓆 {1}."),
	max: $.validator.format("H찾y nh梳춑 t沼?{0} tr沼?xu沼몁g."),
	min: $.validator.format("H찾y nh梳춑 t沼?{1} tr沼?l챗n.")
});

}));
