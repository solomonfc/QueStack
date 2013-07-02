<%--
  Created by IntelliJ IDEA.
  User: Bruce
  Date: 7/3/13
  Time: 2:10 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>


<a href="" onclick="ajaxGetJSON()">

GetJSON

</a>


<script type="text/javascript">
	function ajaxGetJSON(){
		$.ajax({
			type: "POST",
			url: 'question',
			data: {"bad":"bad body"}, // serializes the form's elements.
			error: function(jqXHR, textStatus, errorMessage) {
									console.log(errorMessage); // Optional
									},
			success: function(data) {
									alert(data.text); // show response from the php script.
									}
		});
	}
	// $.getJSON('ajax/test.json', function(data) {

        // alert(1);


//		var items = [];

//		$.each(data, function(key, val) {
//		 items.push('<li id="' + key + '">' + val + '</li>');
//		});
//
//		$('<ul/>', {
//		 'class': 'my-new-list',
//		 html: items.join('')
//		}).appendTo('body');
	// });



</script>
</body>
</html>