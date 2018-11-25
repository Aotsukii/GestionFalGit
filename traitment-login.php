<?php
session_start();
try
{
    $connect = new PDO('mysql:host=localhost;dbname=PPE;charset=utf8', 'root', 'password');
}
catch (Exception $e)
{
    die('Erreur : ' . $e->getMessage());
}
$login= htmlspecialchars($_POST['login']);
$pass= htmlspecialchars($_POST['password']);
$recovery_user = $connect->prepare("SELECT * FROM USER WHERE SURNOM_USER = ? AND PASSWORD = ?");
$recovery_user->execute(array($login,sha1($pass)));
if($recovery_user->rowcount() == 1) {
    $info_user = $recovery_user->fetch();
    $_SESSION['ID_USER'] = $info_user['ID_USER'];
    $_SESSION['NOM_USER'] = $info_user['NOM_USER'];
    $_SESSION['PRENOM_USER'] = $info_user['PRENOM_USER'];
    $_SESSION['LOGIN'] = $info_user['SURNOM_USER'];
    $_SESSION['PASSWORD'] = $info_user['PASSWORD'];
    $_SESSION['ROLE_USER'] = $info_user['ROLE_USER'];

    if ($_SESSION['ROLE_USER'] == "impetrant") {
        header('location: index_impetrant.html');
    } elseif ($_SESSION['ROLE_USER'] == "fal") {
        header('location: index_fal.html');
    } elseif ($_SESSION['ROLE_USER'] == "croix") {
        header('location: index_croix.html');
    }
}
?>