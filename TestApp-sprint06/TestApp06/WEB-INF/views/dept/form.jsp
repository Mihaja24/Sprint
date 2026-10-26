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
            <label>Nom :
                <input type="text" name="nom" value="${dept.nom}">
            </label>
        </p>
        <p>
            <label>Age :
                <input type="number" name="age" value="${dept.age}">
            </label>
        </p>
        <button type="submit">Enregistrer</button>
    </form>

    <% if (request.getAttribute("message") != null) { %>
        <p>${message}</p>
    <% } %>

    <form action="$(pageContext.request.contextPath)/dept/upload" method="post" enctype="multipart/form-data">
        <input type="file" name="paramName" required>
        <button type="button">Upload</button>
    </form>

    <p><a href="list">Retour a la liste</a></p>
</body>
</html>
