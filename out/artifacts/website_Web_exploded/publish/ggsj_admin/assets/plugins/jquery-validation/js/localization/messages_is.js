(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: IS (Icelandic; 챠slenska)
 */
$.extend($.validator.messages, {
	required: "횧essi reitur er nau챨synlegur.",
	remote: "Laga챨u 첸ennan reit.",
	maxlength: $.validator.format("Sl찼챨u inn mest {0} stafi."),
	minlength: $.validator.format("Sl찼챨u inn minnst {0} stafi."),
	rangelength: $.validator.format("Sl찼챨u inn minnst {0} og mest {1} stafi."),
	email: "Sl찼챨u inn gilt netfang.",
	url: "Sl찼챨u inn gilda vefsl처챨.",
	date: "Sl찼챨u inn gilda dagsetningu.",
	number: "Sl찼챨u inn t철lu.",
	digits: "Sl찼챨u inn t철lustafi eing철ngu.",
	equalTo: "Sl찼챨u sama gildi inn aftur.",
	range: $.validator.format("Sl찼챨u inn gildi milli {0} og {1}."),
	max: $.validator.format("Sl찼챨u inn gildi sem er minna en e챨a jafnt og {0}."),
	min: $.validator.format("Sl찼챨u inn gildi sem er st챈rra en e챨a jafnt og {0}."),
	creditcard: "Sl찼챨u inn gilt grei챨slukortan첬mer."
});

}));
