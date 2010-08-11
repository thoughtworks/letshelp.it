function verify_search() {

	var search_form = document.getElementById('search_form');
	var search_query = document.getElementById('search_query');

	if (search_query.value.length > 0) {
		search_form.action = '/organizations/search/' + search_query.value;
		return true;
	}
	return false;
}
