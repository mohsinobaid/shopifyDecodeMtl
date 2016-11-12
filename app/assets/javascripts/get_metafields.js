//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// var testID = "5012951878";
// $(".credit-" + testID).html("$10.00");

// $.getJSON("/metafields/", function(data) {
// 	var ids = [];
// 	ids.push(data.metafields[0].id);
//
// 	for (var i = 0; i < ids.length; i++) {
// 		var metafieldId = ids[i];
// 		$.getJSON("/metafields/" + metafieldId + "/parse/", function(value) {
// 			$(".credit-" + metafieldId).html(value.val);
// 		});
// 	}
// });

function updateCredit() {
	$.ajax({
		url: "https://7d6515f1.ngrok.io/jsonp/customers.json",
		jsonp: "callback",
		dataType: "jsonp",
		success: function(data) {
			for (var i = 0; i < data.length; i++) {
				$(".credit-" + data[i].id).html("$" + data[i].credit);
			}
		}
	})
}

updateCredit();
