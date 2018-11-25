<?php
/* if (isset($_POST['submit'])){
} */
if($_POST) {
    $nom = htmlspecialchars($_POST['name']);
    $prenom = htmlspecialchars($_POST['surname']);
    $nick = htmlspecialchars($_POST['nickname']);
    $pass = htmlspecialchars($_POST['password']);
    $pass = sha1($pass);
    $date = htmlspecialchars($_POST['datebapt']);
    $mail = htmlspecialchars($_POST['mail']);
    $filiere = htmlspecialchars($_POST['filiere']);
    $mailAuth = htmlspecialchars($_POST['mailAuth']) == "on";
    $tel = htmlspecialchars($_POST['tel']);
    $role = htmlspecialchars($_POST['optradio']);
    try {
        $connect = new PDO('mysql:host=localhost;dbname=GestionFal;charset=utf8', 'root', 'password');
        $connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (Exception $e) {
        die('Erreur : ' . $e->getMessage());
    }

    $insert = $connect->prepare("INSERT INTO user (ID_USER, NOM_USER, PRENOM_USER, SURNOM_USER, PASSWORD, DATEBAPT_USER, TEL_USER, MAIL_USER, MAILAUTH_USER) VALUES (?,?,?,?,?,?,?,?,?)");
    $insert->execute(array(null, $nom, $prenom, $nick, $pass, $date, $tel, $mail, $mailAuth));
    //$insert2 = $connect->lastInsertId();
    //$insert2 = $connect-> prepare("INSERT INTO membre(ID_FILIERE,ID_ROLE)");
    /*echo $connect->lastInsertId();*/
    /*header('location:index.html')*/
}
?>