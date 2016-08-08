
$( document ).ready(function() {
	console.log( "ready!" );

	search_greater_size();
	search_greater_inbox();
	search_user();
});

function search_greater_size() {
	$.getJSON( "/greater_size", function( data ) {
		console.log( data.user );
		$( "#greater-size-user" ).text( data.user );
		$( "#greater-size-inbox" ).text( data.inbox );
		$( "#greater-size-size" ).text( data.size );
	});
}

function search_greater_inbox() {
	$.getJSON( "/greater_inbox", function( data ) {
		console.log( data.user );
		$( "#greater-inbox-user" ).text( data.user );
		$( "#greater-inbox-inbox" ).text( data.inbox );
		$( "#greater-inbox-size" ).text( data.size );
	});
}

function search_user() {
	var options = {
		success: showResponse
	};

	$("#search-user").submit(function() {
		$(this).ajaxSubmit( options );
		return false;
	});
}

 
function showResponse(responseText, statusText, xhr, $form)  { 
	console.log( responseText ); 

	$( "#found-user" ).text( responseText.user );
	$( "#found-inbox" ).text( responseText.inbox );
	$( "#found-size" ).text( responseText.size );
} 