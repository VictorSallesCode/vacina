<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Manage Records</title>
    <link rel="stylesheet" type="text/css" href="/vacina/src/style/style01.css">
</head>
<body>
    <h2>Manage Records</h2>
    
    <h3>Insert New Record</h3>
    <form method="post" action="manage.jsp">
        <label for="nome">Nome:</label>
        <input type="text" name="nome" required>
        <label for="idade">Idade:</label>
        <input type="number" name="idade" required>
        <input type="submit" name="action" value="Insert">
    </form>

    <h3>Current Records</h3>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Idade</th>
            <th>Actions</th>
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/escola", "root", "");
                stmt = conn.createStatement();

                // Insert new record
                if ("Insert".equals(request.getParameter("action"))) {
                    String nome = request.getParameter("nome");
                    int idade = Integer.parseInt(request.getParameter("idade"));
                    String insertQuery = "INSERT INTO aluno (nome, idade) VALUES ('" + nome + "', " + idade + ")";
                    stmt.executeUpdate(insertQuery);
                }

                // Delete record
                if ("Delete".equals(request.getParameter("action"))) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    String deleteQuery = "DELETE FROM aluno WHERE ID = " + id;
                    stmt.executeUpdate(deleteQuery);
                }

                // Update record
                if ("Update".equals(request.getParameter("action"))) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    String nome = request.getParameter("nome");
                    int idade = Integer.parseInt(request.getParameter("idade"));
                    String updateQuery = "UPDATE aluno SET nome = '" + nome + "', idade = " + idade + " WHERE ID = " + id;
                    stmt.executeUpdate(updateQuery);
                }

                // Display records
                rs = stmt.executeQuery("SELECT * FROM aluno");
                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("ID") %></td>
            <td><%= rs.getString("nome") %></td>
            <td><%= rs.getInt("idade") %></td>
            <td>
                <form method="post" action="manage.jsp" style="display:inline;">
                    <input type="hidden" name="id" value="<%= rs.getInt("ID") %>">
                    <input type="text" name="nome" value="<%= rs.getString("nome") %>" required>
                    <input type="number" name="idade" value="<%= rs.getInt("idade") %>" required>
                    <input type="submit" name="action" value="Update">
                </form>
                <form method="post" action="manage.jsp" style="display:inline;">
                    <input type="hidden" name="id" value="<%= rs.getInt("ID") %>">
                    <input type="submit" name="action" value="Delete">
                </form>
            </td>
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