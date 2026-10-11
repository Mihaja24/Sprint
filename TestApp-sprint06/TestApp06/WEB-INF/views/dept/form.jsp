<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>${titre}</title>
</head>
<body>
    <h1>${titre}</h1>

    <form action="save" method="POST">
        <p>
            <label>Nom :</label>
            <input type="text" name="nom" value="${nom}">
        </p>
        <p>
            <label>Age :</label>
            <input type="number" name="age" value="${age}">
        </p>
        <button type="submit">Enregistrer</button>
    </form>

    <% if (request.getAttribute("message") != null) { %>
        <p>${message}</p>
    <% } %>

    <p><a href="list">Retour a la liste</a></p>
</body>
</html>
