<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Lista de Alunos</title>
</head>
<body>
    <link rel="stylesheet" type="text/css" href="/vacina/src/style/style01.css">
    <h2>Lista de Alunos</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Idade</th>
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/escola", "root", "");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM aluno");
                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("ID") %></td>
            <td><%= rs.getString("nome") %></td>
            <td><%= rs.getInt("idade") %></td>
        </tr>
        <%
                }
            } catch(Exception e) {
                out.println("Erro: " + e.getMessage());
            } finally {
                if(rs != null) try { rs.close(); } catch(Exception e) {}
                if(stmt != null) try { stmt.close(); } catch(Exception e) {}
                if(conn != null) try { conn.close(); } catch(Exception e) {}
            }
        %>
    </table>
</body>
</html>