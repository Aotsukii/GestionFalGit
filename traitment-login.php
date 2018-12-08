<?php
session_start();
try {
    $connect = new PDO('mysql:host=localhost;dbname=GestionFal;charset=utf8', 'root', 'root');
    $connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}

$login= htmlspecialchars($_POST['login']);
$pass= htmlspecialchars($_POST['password']);

$recovery_user = $connect->prepare("SELECT * FROM MEMBRE WHERE SURNOM_USER = ? AND PASSWORD = ?");
$recovery_user->execute(array($login,sha1($pass)));
if($recovery_user->rowcount() == 1) {
    $info_user = $recovery_user->fetch();
    $_SESSION['ID_USER'] = $info_user['ID_USER'];
    $_SESSION['NOM_USER'] = $info_user['NOM_USER'];
    $_SESSION['PRENOM_USER'] = $info_user['PRENOM_USER'];
    $_SESSION['SURNOM_USER'] = $info_user['SURNOM_USER'];
    $_SESSION['PASSWORD'] = $info_user['PASSWORD'];
    $_SESSION['ID_ROLE'] = $info_user['ID_ROLE'];

    if ($_SESSION['ID_ROLE'] == "3") {
        header('location:index_impetrant.html');
    } elseif ($_SESSION['ID_ROLE'] == "2") {
        header('location:index_fal.html');
    } elseif ($_SESSION['ID_ROLE'] == "1") {
        header('location:index_croix.html');
    }
} else {
    header('location:index.html');
}
?>