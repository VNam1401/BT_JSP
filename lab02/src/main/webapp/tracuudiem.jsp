<%-- 
    Document   : tracuudiem
    Created on : 16 thg 10, 2024, 19:45:19
    Author     : nguyenvannam
--%>

<%@page import="common.database"%>
<%@page import="java.sql.DatabaseMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.tools.javac.main.Main.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <title>Tra Cứu Điểm</title>
      <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            /*Canh giữa*/
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            flex-direction: column;
        }
/*
        form {
            margin-bottom: 20px;
        }


        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        input[type="text"] {
            padding: 8px;
            width: 200px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }*/
    </style>
    </head>
    <body>
<!--        Tạo FORM-->
        <form action="tracuudiem.jsp" method="POST">
            Số Báo Danh <input type="text" name="sobd" value="" />
            Họ Tên <input type="text" name="hoten" value="" />
            <input type="submit" value="Tra Cứu" />
        </form>
<!--Sử Lý Tìm Kiếm-->
        <%
            String hoten = request.getParameter("hoten");
            String sobd = request.getParameter("sobd");

            if (hoten != null || sobd != null) {
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    conn = database.GetConnection();
                    String kq = "SELECT * FROM ThiSinh WHERE hoten LIKE ? OR sobd = ?";
                    ps = conn.prepareStatement(kq);
                    ps.setString(1, "%" + hoten + "%");
                    ps.setString(2, sobd);

                    rs = ps.executeQuery();
        %>
        <!--Hiển thị kết quả tìm kiếm-->
        <h3>Kết Quả Tìm Kiếm</h3>
        <!--Tạo bảng tìm kiếm-->
        <table border="1">
            <tr>
                <th>Số Báo Danh</th>
                <th>Họ Tên</th>
                <th>Địa Chỉ</th>
                <th>Điểm Toán</th>
                <th>Điểm Lý</th>
                <th>Điểm Hóa</th>
                <th>Tổng Điểm</th>
            </tr>
            <!--Tính tổng điểm-->
            <%
                while (rs.next()) {
                    double tongDiem = rs.getDouble("toan")
                            + rs.getDouble("ly")
                            + rs.getDouble("hoa");
            %>
            <tr>
                <td><%= rs.getString("sobd")%></td>
                <td><%= rs.getString("hoten")%></td>
                <td><%= rs.getString("diachi")%></td>
                <td><%= rs.getDouble("toan")%></td>
                <td><%= rs.getDouble("ly")%></td>
                <td><%= rs.getDouble("hoa")%></td>
                <td><%= tongDiem%></td>
            </tr>
            <%
                        }
                    } catch (Exception e) {
                        out.println("Lỗi: " + e.getMessage());
                    } finally {
                        if (rs != null) {
                            rs.close();
                        }
                        if (ps != null) {
                            ps.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    }
                }
            %>
        </table>
    </body>
</html>
