<%-- 
    Document   : BT4
    Created on : Oct 15, 2024, 3:33:46 PM
    Author     : ADMIN
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Đổi ngoại tệ</h1>
        <form action="BT4.jsp" method="post">
            <h2>Cho biết số tiền: 
                <input type="text" name="sotien" value="" />
            </h2>
            <h2>Cho biết loại ngoại tệ:
                <select name="ngoaite">
                    <option>USD</option>
                    <option>GBP</option>
                    <option>EUR</option>
                    <option>JPY</option>
                    <option>AUD</option>
                </select>
            </h2>
            <input type="submit" value="Đổi tiền" />
            <input type="submit" value="Tiếp tục" />
        </form>
        <%
            DecimalFormat df = new DecimalFormat("#,##0.##");
            request.setCharacterEncoding("UTF-8");
            String sotien = request.getParameter("sotien");
            String ngoaite = request.getParameter("ngoaite");
            if (sotien != null) {
                double stien = Double.parseDouble(sotien);
                double tygia = 0;
                switch (ngoaite) {
                    case "USD":
                        tygia = 21380.00;
                        break;
                    case "GBP":
                        tygia = 32622.80;
                        break;
                    case "EUR":
                        tygia = 23555.67;
                        break;
                    case "JPY":
                        tygia = 178.61;
                        break;
                        case "AUD":
                        tygia = 16727.44;
                        break;
                }
                double kq = tygia*stien;
        %>
        <hr>
        Số tiền đổi được:<%=df.format(kq)%>
        <% }%>
    </body>
</html>
