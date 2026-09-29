<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>${titre}</title></head>
<body>
    <h1>${titre}</h1>
    <form action="" method="POST">
        <label>Nom : <input type="text" name="nom" required></label>
        <button type="submit">Enregistrer</button>
    </form>
    <a href="list">Retour a la liste</a>
</body>
</html>
