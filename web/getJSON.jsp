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
    <script src="js/jquery-1.10.1.js"></script>
</head>
<body>

<input type="text" name="lname" id="lname"/>
<a href="javascript:void(0);" onclick="keyword_search()">Search</a>

<script type="text/javascript">
    var resultJson;

    function keyword_search() {

        var inputData = {keyword:$("#lname").val()}

        $.ajax({
            type: "POST",
            url: 'question',
            data: inputData,
            dataType : 'json',
            error: function(jqXHR, textStatus, errorMessage) {
                console.log(errorMessage);
            },
            success: function(data) {
                resultJson = data;
                alert(data.OI_TOTALNUM);
            }
        });
    }


</script>
</body>
</html>