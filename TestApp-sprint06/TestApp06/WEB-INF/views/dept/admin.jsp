<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>${titre}</title>
</head>
<body>
    <h1>${titre}</h1>

    <p>Utilisateur courant : <strong>${user}</strong></p>
    <p>Rôle : <strong>${role}</strong></p>

    <p>Cette page n'est accessible qu'aux utilisateurs avec le rôle ADMIN.</p>
    <p><a href="/sprint06-test/dept/new">Retour au formulaire</a></p>
</body>
</html>
