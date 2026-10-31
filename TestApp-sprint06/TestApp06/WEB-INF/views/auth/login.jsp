<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Connexion</h2>

    <form action="/sprint06-test/login" method="post">
        <p>Utilisateur : <input type="text" name="username" /></p>
        <p>Mot de passe : <input type="password" name="password" /></p>
        <button type="submit">Se connecter</button>
    </form>

    <p>Exemples :</p>
    <ul>
        <li>admin / admin</li>
        <li>user / user</li>
    </ul>
</body>
</html>
