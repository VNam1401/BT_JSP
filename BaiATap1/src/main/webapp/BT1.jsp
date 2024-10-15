<%-- 
    Document   : BT1
    Created on : Oct 15, 2024, 3:10:02 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Chương trình đầu tiên</h1>
        <hr>
        <form action="BT1.jsp" method="post">Cho biết họ tên <input type="text" name="hoten" value="" />
            <input type="submit" value="Thi hành" />  
        </form>
        <%
            request.setCharacterEncoding("UTF-8");
            String hoten = request.getParameter("hoten");
            if (hoten != null) {
        %>
        Chào bạn:<<b> <%=hoten%> </b>
        <% }%>
    </body>
</html>
