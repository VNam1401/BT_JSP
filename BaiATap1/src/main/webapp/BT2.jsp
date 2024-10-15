<%-- 
    Document   : BT2
    Created on : Oct 15, 2024, 3:10:49 PM
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
        <h1>Diện tích - Chu vi Hình Chữ Nhật</h1>
        <form action="BT2.jsp" method="post">
            <h2>Hãy Nhập chiều dài: 
            <input type="text" name="dai" value="" />
            </h2>
            <h2>Hãy Nhập chiều rộng: 
            <input type="text" name="rong" value="" />
            </h2>
            <input type="submit" value="Tính Toán" />
            <input type="submit" value="Tiếp tục" />
        </form>
         <%
            request.setCharacterEncoding("UTF-8");
            String dai = request.getParameter("dai");
            String rong = request.getParameter("rong");
            double cv,dt;
            if (dai != null && rong!=null ) {
            double d = Double.parseDouble(dai);
             double r = Double.parseDouble(rong);
             cv=(d+r)*2;
             dt=d*r;
        %>
        <hr>
        Chu Vi:<%=cv %>
        <br>
        Diện tích:<%=dt %>
        <% }%>
    </body>
</html>
