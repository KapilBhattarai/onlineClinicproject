<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>

<link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">


<meta charset="ISO-8859-1">
<title>Gallery</title>
</head>
<body>

<nav class="navbar navbar-default navbar-static-top">
<button type="button" class="btn btn-primary btn-block"><h1>Welcome To Photo Gallery Zone</h1></button>  <hr>

</nav>


      <c:forEach var="imgname" items="${imglist}">
      
      <a href="${pageContext.request.contextPath}/resources/imgs/${imgname}" target="_blank">
      <img alt="${imgname}" src="${pageContext.request.contextPath}/resources/imgs/${imgname}" width="375px;" height="310px;" >
      </a>
      
      </c:forEach>





</body>
</html>