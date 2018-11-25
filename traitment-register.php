<?php
/* if (isset($_POST['submit'])){
} */
$nom=htmlspecialchars($_POST['name']);
$prenom=htmlspecialchars($_POST['surname']);
$nick=htmlspecialchars($_POST['nickname']);
$pass=htmlspecialchars($_POST['password']);
$pass=sha1($pass);
$date=htmlspecialchars($_POST['datebapt']);
$mail=htmlspecialchars($_POST['mail']);
$filiere=htmlspecialchars($_POST['filiere']);
$mailAuth=htmlspecialchars($_POST['mailAuth']);
$tel=htmlspecialchars($_POST['tel']);
$rank=htmlspecialchars($_POST['checkrank']);
try
{
    $connect = new PDO('mysql:host=localhost;dbname=GestionFal;charset=utf8', 'root', 'password');
}
catch (Exception $e)
{
    die('Erreur : ' . $e->getMessage());
}

$insert = $connect->prepare("INSERT INTO USER (`NOM_USER`,`PRENOM_USER`,`SURNOM_USER`,`PASSWORD`,`RANK_USER`,`DATEBAPT_USER`,`FILIERE_USER`,`TEL_USER`,`MAIL_USER`, `MAILAUTH_USER`) VALUES(?,?,?,?,?,?,?,?,?,?)");
$insert->execute(array($nom,$prenom,$nick,$pass,$rank,$date,$filiere,$tel,$mail,$mailAuth)) or die(print_r($insert->errorInfo(), true));
header('location:index.html')
?>