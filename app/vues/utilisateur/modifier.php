<!DOCTYPE html>
<html lang="fr" data-theme="light" data-mode="auto">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Modifier mon compte</title>
    <link rel="stylesheet" href="/css/main.css"/>
    <link rel="icon shortcut" href="/images/logo.png"/>
</head>
<body>
    <h1>Modifier mon compte</h1>
    <form action="/modifier" method="POST">
        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom" value="<?php echo $utilisateur['nom']; ?>" required>

        <label for="prenom">Prénom :</label>
        <input type="text" id="prenom" name="prenom" value="<?php echo $utilisateur['prenom']; ?>" required>

        <label for="email">Email :</label>
        <input type="email" id="email" name="email" value="<?php echo $utilisateur['email']; ?>" required>

        <label for="ville">Ville :</label>
        <input type="text" id="ville" name="ville" value="<?php echo $utilisateur['ville']; ?>">

        <label for="code_postal">Code postal :</label>
        <input type="text" id="code_postal" name="code_postal" value="<?php echo $utilisateur['code_postal']; ?>">

        <label for="adresse">Adresse :</label>
        <textarea id="adresse" name="adresse"><?php echo $utilisateur['adresse']; ?></textarea>

        <button type="submit">Enregistrer</button>
    </form>
</body>
</html>