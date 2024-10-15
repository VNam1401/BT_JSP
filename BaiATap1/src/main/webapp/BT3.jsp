<%-- 
    Document   : BT3
    Created on : Oct 15, 2024, 3:27:37 PM
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
        <h1>Diện tích - Chu vi Hình Tròn</h1>
        <form action="BT3.jsp" method="post">
            <h2>Hãy Nhập Bán Kính: 
                <input type="text" name="bk" value="" />
            </h2>
            <input type="submit" value="Tính Toán" />
            <input type="submit" value="Tiếp tục" />
        </form>
        <%
            request.setCharacterEncoding("UTF-8");
            String bankinh = request.getParameter("bk");
            double cv, dt;
            if (bankinh != null) {
                double bk = Double.parseDouble(bankinh);
                cv = Math.PI*2*bk;
                dt = Math.PI*bk*bk;
        %>
        <hr>
        Chu Vi:<%=cv%><br>
        Diện tích:<%=dt%>
        <% }%>
    </body>
</html>
