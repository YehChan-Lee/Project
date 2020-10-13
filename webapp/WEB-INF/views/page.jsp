<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery.js"></script>
</head>
<body>

<ul id="pagination-demo" class="pagination-sm"></ul>

<script>
$('#pagination-demo').twbsPagination({
    totalPages: 35,
    visiblePages: 7,
    onPageClick: function (event, page) {
        $('#page-content').text('Page ' + page);
    }
});
</script>

</body>
</html>