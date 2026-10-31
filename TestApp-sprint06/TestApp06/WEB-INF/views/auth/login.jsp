<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h1>Connexion</h1>

    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red">${error}</p>
    <% } %>

    <form action="login" method="POST">
        <p>
            <label>Nom d'utilisateur :
                <input type="text" name="username">
            </label>
        </p>
        <p>
            <label>Mot de passe :
                <input type="password" name="password">
            </label>
        </p>
        <button type="submit">Se connecter</button>
    </form>
</body>
</html>
