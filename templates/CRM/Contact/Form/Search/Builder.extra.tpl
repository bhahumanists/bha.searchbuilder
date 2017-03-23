{literal}
<script>

//get querystring
var IsMainSearch = window.location.search;

//only want to do this if it's the main Search Builder page, which has no 'qfkey' in it
if (IsMainSearch.indexOf("qfKey") == -1) {

	//set up HTML
	var ContactIDTextarea = '<span id="ContactIDColsMessage">Click <a href="#" id="ContactIDColsShow">here</a> to enter a list of Contact IDs.</span><div id="ContactIDSearch">Paste your list of contact IDs below and click <a href="#" id="ContactIDColsSubmit">here to search</a>:<br /><textarea id="ContactIDColsTextArea" rows="10" /></div>';
	
	//insert the HTML
	jQuery('#access').before(ContactIDTextarea);

	//when someone clicks to search, after entering the data into the textarea
	jQuery('#ContactIDColsSubmit').click(function() {
		
		//get text from textarea
		var linebreakSep = jQuery('#ContactIDColsTextArea').val()
		
		//if it's empty, do nothing
		if (!linebreakSep) { return; };
		
		//replace line breaks with commas
		var commaSep = linebreakSep.replace(/(?:\r\n|\r|\n)/g, ',');
		
		//if there's a comma at the end, ditch it
		if(commaSep.substring(commaSep.length-1,commaSep.length) == ',') {
			commaSep = commaSep.substring(0,commaSep.length-1);
		}
		
		//add the brackets
		//commenting out as not needed in 4.6
		//commaSep = '(' + commaSep + ')';
		
		//set the dropdowns
		jQuery('#mapper_1_0_0').val('Contact');
		jQuery('#mapper_1_0_0').trigger('change');
		jQuery('#mapper_1_0_1').val('id');
		jQuery('#mapper_1_0_1').trigger('change');
		jQuery('#operator_1_0').val('IN');
		jQuery('#operator_1_0').trigger('change'); // this doesn't work - not sure why
		jQuery('#crm_search_value_1_0').css('display','inline'); // bit more manual than I'd like
		jQuery('#value_1_0').val(commaSep); // put the generated value into the search box
		jQuery('#Builder').submit() // submit the form

	});
	
	// when the 'show' button is clicked, show the textarea etc.
	jQuery('#ContactIDColsShow').click(function() {
		jQuery('#ContactIDSearch').show();
		jQuery('#ContactIDColsMessage').hide();

	});

}

jQuery(document).ready(function() {
	//hide it to start with
	jQuery('#ContactIDSearch').hide();
});

</script>
{/literal}