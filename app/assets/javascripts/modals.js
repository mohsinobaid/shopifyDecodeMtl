window.alertModal = function(){
  ShopifyApp.Modal.alert('Message for an alert window.');
}

window.confirmModal = function () {
  ShopifyApp.Modal.confirm({
    title: "Are you sure you want to delete this?",
    message: "Do you want to delete your account? This can't be undone.",
    okButton: "Yes, delete it",
    cancelButton: "No, keep it",
    style: 'danger'
  }, function(result){
    if (result)
      ShopifyApp.flashNotice("Delete has been confirmed.");
    else
      ShopifyApp.flashNotice("Delete has been cancelled.");
  });
}

window.inputModal = function (prompt) {
	var selected = selectedCustomers();
	if (selected.length > 0) {
		ShopifyApp.Modal.input(prompt, function(result, data) {
			if (result) {

				var currentCredit;
				let map = {};
				$.ajax({
					url: "https://7d6515f1.ngrok.io/jsonp/customers.json",
					jsonp: "callback",
					dataType: "jsonp",
					success: function(res) {
						res.forEach(i => map[i.id] = i.credit);

						let n = selected.length;
						
						for (let i = 0; i < selected.length; i++) {
							$.ajax({
							  url: "https://7d6515f1.ngrok.io/jsonp/customers/" + selected[i] + "/" + (parseInt(map[selected[i]]) + parseInt(data)),
							  jsonp: "callback",
							  dataType: "jsonp",
							  success: function() {
								  n--;
								  if (n == 0) {
									  updateCredit();
								  }
							  }
							});
						}
					}
				});

				if (selected.length == 1) {
					ShopifyApp.flashNotice("Added $" + data + " credit to " + selected.length + " account.");
				}
				else {
					ShopifyApp.flashNotice("Added $" + data + " credit to " + selected.length + " accounts.");
				}
			}
		});
	}
	else {
		ShopifyApp.flashError("No customers selected.");
	}
}

window.newModal = function(path, title){
  ShopifyApp.Modal.open({
    src: path,
    title: title,
    height: 400,
    width: 'large',
    buttons: {
      primary: {
        label: "OK",
        message: 'modal_ok',
        callback: function(message){
          ShopifyApp.Modal.close("ok");
        }
      },
      secondary: {
        label: "Cancel",
        callback: function(message){
          ShopifyApp.Modal.close("cancel");
        }
      }
    },
  }, function(result){
    if (result == "ok")
      ShopifyApp.flashNotice("'Ok' button pressed");
    else if (result == "cancel")
      ShopifyApp.flashNotice("'Cancel' button pressed");
  });
}

window.newButtonModal = function(path, title){
  ShopifyApp.Modal.open({
    src: path,
    title: title,
    height: 400,
    width: 'large',
    buttons: {
      primary: {
        label: "Yes",
        callback: function(){ alert("'Yes' button clicked"); }
      },
      secondary: [
        {
          label: "Close",
          callback: function(message){ ShopifyApp.Modal.close("close"); }
        },
        {
          label: "Normal",
          callback: function(){ alert("'Normal' button clicked"); }
        }
      ],
      tertiary: [
        {
          label: "Danger",
          style: "danger",
          callback: function(){ alert("'Danger' button clicked"); }
        },
        {
          label: "Disabled",
          style: "disabled"
        }
      ]
    },
  }, function(result){
    if (result)
      ShopifyApp.flashNotice("'" + result + "' button pressed");
    else
      ShopifyApp.flashNotice("No result returned");
  });
}
