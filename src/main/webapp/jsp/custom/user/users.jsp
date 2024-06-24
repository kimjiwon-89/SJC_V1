<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<h1>USERㅇㅇㅇ</h1> 
   <div class="userList">
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td> 
                <td>${user.username}</td>
                <td>${user.email}</td>
             </tr>
         </c:forEach>
     </tbody>
 </table>
 
</div>

<div class="userAdd disNone">
 <h1>Add User</h1>
<form action="/users/add" method="post">
    <label for="username">Name:</label><br>
    <input type="text" id="username" name="username"><br>
    <label for="email">Email:</label><br>
    <input type="text" id="email" name="email"><br><br>
    <input type="submit" value="Submit">
</form>

</div>

<button onclick="userAdd()">유저 추가</button>
    
    
<script type="text/javascript">
	function userAdd() {
		console.log("ADF");
		
		$(".userList").addClass("disNone");
		$(".userAdd").removeClass("disNone");
	}
</script>    