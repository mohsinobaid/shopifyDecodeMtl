function checkAll(ele) {
	var checkboxes = document.getElementsByTagName('input');
	if (ele.checked) {
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].type == 'checkbox') {
				checkboxes[i].checked = true;
			}
		}
	}
	else {
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].type == 'checkbox') {
				checkboxes[i].checked = false;
			}
		}
	}
}

function selectedCustomers() {
	var checkboxes = document.getElementsByTagName('input');
	var selected = [];
	for (var i = 1; i < checkboxes.length; i++) {
		if (checkboxes[i].type == 'checkbox') {
			if (checkboxes[i].checked) {
				selected.push(checkboxes[i].id.split("-")[1]);
			}
		}
	}

	return selected;
}
