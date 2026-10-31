<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Session utilisateur</title>
</head>
<body>
    <h1>Session utilisateur</h1>

    <form action="session" method="POST">
        <p>
            <label>Nom de l'utilisateur :
                <input type="text" name="user" value="${user}">
            </label>
        </p>
        <button type="submit">Mettre dans la session</button>
    </form>

    <% if (request.getAttribute("user") != null) { %>
        <p>Utilisateur dans la session : <strong><%= request.getAttribute("user") %></strong></p>
    <% } else { %>
        <p>Aucun utilisateur dans cette session.</p>
    <% } %>

    <p><a href="/sprint06-test/session">Actualiser</a></p>
</body>
</html>
